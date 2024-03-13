package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.FeedDTO;
import com.itbank.model.replyDTO;
import com.itbank.service.ReplyService;

@Controller
public class ReplyController {
	
	@Autowired private ReplyService rs;

	//	리스트
	@GetMapping("")
	public ModelAndView replyList() {
		ModelAndView mav = new ModelAndView();
		List<replyDTO> list = rs.getList();
		mav.addObject("list", list);
		return mav;
	}
	
	
	@GetMapping("/feed/view")
	public void reply() {};

	@PostMapping("/feed/view")
	public String reply(FeedDTO dto) {
		int row = rs.getreply(dto);
		System.out.println(row != 0 ? "성공" : "실패");
		return "redirect:/social/feed/view";
	}
	
}
