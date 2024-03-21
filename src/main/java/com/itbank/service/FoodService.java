package com.itbank.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.FoodDTO;
import com.itbank.repository.FoodDAO;

@Service
public class FoodService {

	@Autowired private FoodDAO foodDao;

	public List<FoodDTO> getSearchList(HashMap<String, Object> map) {
		List<FoodDTO> list = new ArrayList<>(); 
		if(map.get("group_name")!=null) {
			String cate = (String) map.get("group_name");
		
			if(cate.contains(",")) {
				String[] catearr = cate.split(",");
				map.put("group_name", catearr);
			}
		}
		
		list = foodDao.selectSearchList(map);
		return list;
	}

	public List<String> getCategory() {
		return foodDao.selectCategory();
	}

	public int add(FoodDTO foodDto) {
		return foodDao.insert(foodDto);
	}
	
}
