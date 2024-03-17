package com.itbank.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.FoodDTO;
import com.itbank.model.NutritionDTO;
import com.itbank.repository.NutritionDAO;

@Service
public class NutritionService {

	@Autowired private NutritionDAO nutDao;

	Date now = new java.sql.Date(new java.util.Date().getTime());
	
	public NutritionDTO getDtoByUser(String userid, Date when) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("userid", userid);
		if(when == null) {
			map.put("when", now);
		}
		else {map.put("when", when);}
		
		NutritionDTO dto = nutDao.selectDtoByUser(map);
		return dto;
	}

	public List<FoodDTO> getListByMeal(String meal_time, String userid, Date when) {	
		Map<String, Object> map = new HashMap<>();
		map.put("meal_time", meal_time);
		map.put("userid", userid);
		if(when == null) {
			map.put("when", now);
		}
		else {map.put("when", when);}
		return nutDao.selectByMeal(map);
	}

	public int addNutrition(NutritionDTO nutritionDto) {
		if(nutritionDto.getAdd_date() == null) {nutritionDto.setAdd_date(now);}
		return nutDao.insert(nutritionDto);
	}

	public List<Integer> showDate(String userid, int month) {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("month", month);
		return nutDao.showDate(map);
	}
	
}
