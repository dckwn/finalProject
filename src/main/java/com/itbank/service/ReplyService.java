package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.ReplyDTO;
import com.itbank.repository.ReplyDAO;

@Service
public class ReplyService {

	@Autowired private ReplyDAO dao;

	public List<ReplyDTO> getReplyList(int idx) {
		 
		return dao.selectList(idx);
	}

	public int replyAdd(ReplyDTO dto) {
		
		return dao.insert(dto);
	}

	public int replydelete(ReplyDTO dto) {
	
		return dao.delete(dto);
	}


	public int replyModify(ReplyDTO dto) {
		return dao.update(dto);
	}





	

	
	
}
