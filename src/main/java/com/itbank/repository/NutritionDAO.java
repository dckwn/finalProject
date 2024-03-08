package com.itbank.repository;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.itbank.model.FoodDTO;
import com.itbank.model.NutritionDTO;

public interface NutritionDAO {

	@Select("select "
			+ "sum(f.kcal) as user_kcal, "
			+ "sum(f.tan) as user_tan, "
			+ "sum(f.dan) as user_dan, "
			+ "sum(f.ji) as user_ji, "
			+ "sum(f.dang) as user_dang, "
			+ "sum(f.na) as user_na "
			+ "from health_nutrition n "
			+ "join health_food f on n.food_idx=f.idx "
			+ "where userid=#{userid} AND TRUNC(n.add_date)=TRUNC(sysdate)")
	NutritionDTO selectDtoByUser(String userid);

	@Select("select "
			+ "f.food_name, f.kcal, f.capacity "
			+ "from health_nutrition n join health_food f on n.food_idx=f.idx "
			+ "where meal_time=#{meal_time} AND TRUNC(n.add_date)=TRUNC(sysdate)")
	List<FoodDTO> selectByMeal(String meal_time);
	
	
	
}
