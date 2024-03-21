package com.itbank.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.component.CalenderComponent;
import com.itbank.model.AbscentDTO;
import com.itbank.model.CalenderDTO;
import com.itbank.model.MemberDTO;
import com.itbank.service.AbscentService;

@Controller
@RequestMapping("/ticket")
public class AbscentController {

   @Autowired AbscentService as;
   @Autowired private CalenderComponent cal;
   
   // 출석하기
   @GetMapping("/abList")
   public ModelAndView abscentList(HttpSession session, @RequestParam(required=false) Map<String, String> map) {
      ModelAndView mav = new ModelAndView("/ticket/abList");
      MemberDTO login = (MemberDTO) session.getAttribute("login");
      String userid = login.getUserid();
      
      String strmonth = (String) map.get("strmonth");
       int month = 0;
       if(strmonth == null) {
          month = java.util.Calendar.getInstance().get(java.util.Calendar.MONTH) + 1;}   
       else {month = Integer.parseInt(strmonth);}
         
       List<Integer> list = as.abscentList(month, userid);
      
      CalenderDTO dto = new CalenderDTO();   
      dto.setMonth(cal.getMonth(month));
      dto.setLastDay(cal.getLastDay(month));
      dto.setStartDayOfWeek(cal.getStartDayOfWeek(month));
   
      if(list!=null) {mav.addObject("list",list);}
      mav.addObject("cal", dto);
      mav.addObject("month", month);
      
      return mav;
   }
}