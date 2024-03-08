package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.model.FoodDTO;
import com.itbank.model.NutritionDTO;
import com.itbank.service.FoodService;
import com.itbank.service.NutritionService;

@RestController
@RequestMapping("/diet")
public class DietAPI {
	
	@Autowired private FoodService fs;
	@Autowired private NutritionService ns;

	@GetMapping("/getSearch")
	public List<FoodDTO> search(@RequestParam HashMap<String, Object> map) {
		
		boolean food = !("".equals(map.get("food_name")));
		boolean group = !("".equals(map.get("group_name")));
		
		if(!food && !group) {
			map.put("food_name", "---"); 
		}
		else if(food && !group) {
			map.put("group_name", "%");
		}
		
		
		List<FoodDTO> foodList = fs.getSearchList(map);
		
		return foodList;		
	}
	
	@PostMapping("/addFood")
	public int addFood(@RequestBody NutritionDTO dto) {
		int row = ns.addFood(dto);
		return row;
	}
	
}
