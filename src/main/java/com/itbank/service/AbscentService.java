package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.AbscentDTO;
import com.itbank.repository.AbscentDAO;


@Service
public class AbscentService {

	@Autowired AbscentDAO adao;
	
	public List<AbscentDTO> abscentList() {
		List<AbscentDTO> list = adao.selectList();
		return list;
	}



}
