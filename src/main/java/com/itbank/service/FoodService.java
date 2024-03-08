package com.itbank.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.FoodDTO;
import com.itbank.model.NutritionDTO;
import com.itbank.repository.FoodDAO;

@Service
public class FoodService {

	@Autowired private FoodDAO foodDao;

	public List<FoodDTO> getList() {
		return foodDao.selectList();
	}

	public int addFood(NutritionDTO nutritionDto) {
		return foodDao.insert(nutritionDto);
	}

	public List<FoodDTO> getSearchList(HashMap<String, Object> map) {
		List<FoodDTO> list = new ArrayList<>(); 
		map.put("food_name", "%"+map.get("food_name")+"%");
		String cate = (String) map.get("group_name");
		
		if(cate.contains(",")) {
			String[] catearr = cate.split(",");
			
			for(int i = 0; i < catearr.length; i++) {
				map.put("group_name", catearr[i]);
				List<FoodDTO> list2 = foodDao.selectSearchList(map);
				list.addAll(list2);
			}
		}
		else {
			list = foodDao.selectSearchList(map);
		}
		
		return list;
	}

	public List<String> getCategory() {
		List<String> cate = foodDao.selectCategory();
		return foodDao.selectCategory();
	}
	
}
