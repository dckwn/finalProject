package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.itbank.model.FoodDTO;
import com.itbank.model.NutritionDTO;

public interface FoodDAO {

	@Select("SELECT * "
			+ "FROM health_food "
			+ "ORDER BY DBMS_RANDOM.VALUE "
			+ "FETCH FIRST 20 ROWS ONLY")
	List<FoodDTO> selectList();

	@Insert ("insert into health_nutrition (userid, food_idx, meal_time) values (#{userid}, #{food_idx}, #{meal_time})")
	int insert(NutritionDTO nutritionDto);

	@Select("select * from health_food where food_name like #{food_name} AND group_name like #{group_name}")
	List<FoodDTO> selectSearchList(HashMap<String, Object> map);

	@Select("SELECT group_name FROM health_food "
			+ "WHERE group_name IN ('밥류', '구이류', '국류') "
			+ "GROUP BY group_name "
			+ "UNION "
			+ "SELECT group_name FROM ( "
			+ "SELECT group_name "
			+ "FROM health_food "
			+ "WHERE group_name NOT IN ('밥류', '구이류', '국류') "
			+ "ORDER BY DBMS_RANDOM.VALUE "
			+ ") WHERE rownum <= 5")
	List<String> selectCategory();

}
