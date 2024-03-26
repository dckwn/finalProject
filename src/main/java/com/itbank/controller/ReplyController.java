package com.itbank.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.model.ReplyDTO;
import com.itbank.service.ReplyService;

@Controller
@RequestMapping("/social")
public class ReplyController {

	@Autowired private ReplyService rs;
	
	@PostMapping("/feed/view/{idx}")
	public String replyAdd(ReplyDTO dto) {
		int row = rs.replyAdd(dto);
		System.out.println(row != 0 ? "성공" : "실패");
		return "redirect:/social/feed/view/{idx}";
	}

	@GetMapping("/feed/replyDelete/{idx}/{feedidx}")
	public String replyDelete(ReplyDTO dto) {
		int row = rs.replydelete(dto);
		System.out.println(row != 0 ? "성공" : "실패");
		return "redirect:/social/feed/view/{feedidx}";
	}
	
	@PostMapping("/feed/replyModify/{feedidx}")
	public String replyModify(ReplyDTO dto) {
		
		System.out.println(dto.getContent());
		int row = rs.replyModify(dto);
		System.out.println(row != 0 ? "성공" : "실패");
		return "redirect:/social/feed/view/{feedidx}";
	}
}
