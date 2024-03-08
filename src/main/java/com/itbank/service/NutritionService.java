package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.FoodDTO;
import com.itbank.model.NutritionDTO;
import com.itbank.repository.NutritionDAO;

@Service
public class NutritionService {

	@Autowired private NutritionDAO nutDao;

	public NutritionDTO getDtoByUser(String userid) {
		NutritionDTO dto = nutDao.selectDtoByUser(userid);
		return dto;
	}

	public List<FoodDTO> getListByMeal(String meal_time) {	
		return nutDao.selectByMeal(meal_time);
	}
	
}
