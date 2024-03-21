package com.itbank.repository;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.itbank.model.FoodDTO;
import com.itbank.model.NutritionDTO;

public interface NutritionDAO {

//	@Select("select "
//			+ "sum(f.kcal) as user_kcal, "
//			+ "sum(f.tan) as user_tan, "
//			+ "sum(f.dan) as user_dan, "
//			+ "sum(f.ji) as user_ji, "
//			+ "sum(f.dang) as user_dang, "
//			+ "sum(f.na) as user_na "
//			+ "from health_nutrition n "
//			+ "join health_food f on n.food_idx=f.idx "
//			+ "where userid=#{userid} AND TRUNC(n.add_date)=TRUNC(#{when})")
	NutritionDTO selectDtoByUser(Map<String, Object> map);

//	@Select("select "
//			+ "f.food_name, f.kcal, f.capacity "
//			+ "from health_nutrition n join health_food f on n.food_idx=f.idx "
//			+ "where meal_time=#{meal_time} AND userid=#{userid} AND TRUNC(n.add_date)=TRUNC(#{when})")
	List<FoodDTO> selectByMeal(Map<String, Object> map);

//	@Insert ("insert into health_nutrition (userid, food_idx, meal_time, add_date) values (#{userid}, #{food_idx}, #{meal_time}, #{add_date})")
	int insert(NutritionDTO nutritionDto);

//	@Select ("SELECT DISTINCT EXTRACT(DAY FROM add_date) AS day "
//			+ "FROM health_nutrition "
//			+ "WHERE EXTRACT(MONTH FROM add_date) = #{month} and userid=#{userid}")
	List<Integer> showDate(Map<String, Object> map);
	
	
	
}
