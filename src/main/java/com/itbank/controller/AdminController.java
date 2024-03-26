package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.DealDTO;
import com.itbank.model.FoodDTO;
import com.itbank.model.MemberDTO;
import com.itbank.service.DealService;
import com.itbank.service.FoodService;
import com.itbank.service.MemberService;

@Controller
public class AdminController {

	@Autowired private MemberService ms;
	@Autowired private DealService ds;
	@Autowired private FoodService fs;
	
	@GetMapping("/setting")
	public ModelAndView admin() {
		ModelAndView mav = new ModelAndView("/admin/home");
		
		List<MemberDTO> memberList = ms.getList();
		List<DealDTO> ticketList = ds.getList();
		List<FoodDTO> foodList =  fs.getListByUserInsert();
		
		mav.addObject("memberList", memberList);
		mav.addObject("ticketList", ticketList);
		mav.addObject("foodList", foodList);
		return mav;
	}
	
}
