package com.itbank.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.TicketDTO;
import com.itbank.repository.TicketDAO;

@Service
public class TicketService {

	@Autowired TicketDAO dao;
	
	public List<TicketDTO> getList() {
		List<TicketDTO> list = dao.getList();
		return list;
	}
	
	public TicketDTO getOne(int idx) {
		return dao.getOne(idx);
	}

	// 이용권 구매
	public int buy(String counts, String userid) {
		Map<String, Object> map = new HashMap<>();
		String[] ticket = counts.split(",");
		int row = 0;
		int[] hw = new int[ticket.length];
		map.put("userid", userid);
		
		for(int i =0; i < ticket.length; i++) {	
			map.put("ticket_id", i+1);
			hw[i] = Integer.parseInt(ticket[i]);
			for(int j =0; j < hw[i]; j++) {
				row = dao.buy(map);
			}
		}		
		
		return 0;
	}

}
