package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.AbscentDTO;
import com.itbank.repository.AbscentDAO;


@Service
public class AbscentService {

   @Autowired AbscentDAO adao;


   public List<Integer> abscentList(int month, String userid) {
      HashMap<String, Object> map1 = new HashMap<>();
      map1.put("month", month);
      map1.put("userid", userid);
      List<Integer> list = adao.abscentList(map1);
      return list;
   }


   public int getTotalCheckDate(String userid) {
	   
	return adao.getTotaclCheckDate(userid);
}
   
}


