package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.FeedDTO;
import com.itbank.model.replyDTO;
import com.itbank.repository.ReplyDAO;

@Service
public class ReplyService {

	@Autowired private ReplyDAO dao;

	public List<replyDTO> getList() {

		return dao.selectList();
	}

	public int getreply(FeedDTO dto) {
		
		return dao.insert(dto);
	}


}
