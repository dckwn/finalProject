package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.AbscentDTO;
import com.itbank.service.AbscentService;

@Controller
@RequestMapping("/ticket")
public class AbscentController {

	@Autowired AbscentService as;
	
	// 출석하기
	@GetMapping("/abList")
	public ModelAndView abscentList() {
		ModelAndView mav = new ModelAndView();
		List<AbscentDTO> list = as.abscentList();
		mav.addObject("list",list);
		return mav;
	}
}
