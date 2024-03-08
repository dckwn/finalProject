package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.FoodDTO;
import com.itbank.model.NutritionDTO;
import com.itbank.service.FoodService;
import com.itbank.service.NutritionService;

@Controller
@RequestMapping("/diet")
public class DietController {

	@Autowired private FoodService fs;
	@Autowired private NutritionService ns;
	
	@RequestMapping("/home")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("/diet/home");
		NutritionDTO userNutDTO = ns.getDtoByUser("test");
		
		List<FoodDTO> checkM = ns.getListByMeal("아침");
		List<FoodDTO> checkL = ns.getListByMeal("점심");
		List<FoodDTO> checkD = ns.getListByMeal("저녁");
		List<FoodDTO> checkY = ns.getListByMeal("간식");
		
		if(checkM.size() != 0) {mav.addObject("foodM", checkM);}
		if(checkL.size() != 0) {mav.addObject("foodL", checkL);}
		if(checkD.size() != 0) {mav.addObject("foodD", checkD);}
		if(checkY.size() != 0) {mav.addObject("foodY", checkY);}
		
		mav.addObject("NutDto", userNutDTO);
		
		return mav;
	}
	
//	@GetMapping("/getSearch")
//	public ModelAndView search(@RequestParam HashMap<String, Object> map) {
//		ModelAndView mav = new ModelAndView("/add");
//		
//		if(map.get("food_name")==null) {map.put("food_name", "----");}
//		if("".equals(map.get("group_name"))) {map.put("group_name", "%");}
//		
//		
//		List<FoodDTO> foodList = fs.getSearchList(map);
//		List<String> category = fs.getCategory();
//		
//		mav.addObject("foodList", foodList);
//		mav.addObject("category", category);
//		
//		return mav;		
//	}
	
	@GetMapping("/add/{meal}")
	public ModelAndView add(@PathVariable("meal") String meal) {
		ModelAndView mav = new ModelAndView("/diet/add");
		
		//List<FoodDTO> foodList = fs.getList();
		List<String> category = fs.getCategory();
		
		mav.addObject("meal_time", meal);
		mav.addObject("category", category);
		
//		mav.addObject("foodList", foodList);
		
		return mav;
	}
	
	@PostMapping("/add/{meal}")
	public ModelAndView add(NutritionDTO nutritionDto) {
		ModelAndView mav = new ModelAndView("redirect:/diet");
		
		int row = fs.addFood(nutritionDto);
		
		return mav;
	}
	
}
