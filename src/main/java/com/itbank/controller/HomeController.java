package com.itbank.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.component.CalenderComponent;
import com.itbank.model.CalenderDTO;


@Controller
public class HomeController {

	@Autowired private CalenderComponent cal;
	
	@GetMapping("/")
	public ModelAndView home(@RequestParam(required=false) String strmonth) {
		ModelAndView mav = new ModelAndView("/home");
		CalenderDTO dto = new CalenderDTO();
		
		Date wantDate = new Date(new java.util.Date().getTime());

        // SimpleDateFormat 객체를 사용하여 Date를 원하는 형식의 String으로 변환
        SimpleDateFormat sdf = new SimpleDateFormat("MM");
        int month = 0;
        if(strmonth == null) {month = Integer.parseInt(sdf.format(wantDate));}	
        else {month = Integer.parseInt(strmonth);}
		
		dto.setMonth(cal.getMonth(month));
		dto.setLastDay(cal.getLastDay(month));
		dto.setStartDayOfWeek(cal.getStartDayOfWeek(month));
		
		mav.addObject("cal", dto);
		mav.addObject("month", month);
		return mav;
	}
}
