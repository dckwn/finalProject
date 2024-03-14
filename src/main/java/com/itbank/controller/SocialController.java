package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.FeedDTO;
import com.itbank.model.ReplyDTO;
import com.itbank.service.FeedService;
import com.itbank.service.ReplyService;


@Controller
@RequestMapping("/social")
public class SocialController {
	
	@Autowired private FeedService fs;
	@Autowired private ReplyService rs;
	
	@GetMapping("/home")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		List<FeedDTO> list = fs.getList();
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("/view/{idx}")
	public ModelAndView View(@PathVariable("idx")int idx) {
		ModelAndView mav = new ModelAndView("/social/feed/view");
		FeedDTO dto = fs.getHealth_board(idx);
		mav.addObject("dto", dto);
		List<ReplyDTO> replylist = rs.getReplyList(idx);
		mav.addObject("replylist", replylist);
		return mav;
	}
	

	
	@PostMapping("/view/{idx}")
	public String replyAdd(@PathVariable("idx")int idx, ReplyDTO dto) {
		int row = rs.replyAdd(dto);
		System.out.println(dto.getIdx());
		System.out.println(row != 0 ? "성공" : "실패");
		return "redirect:/social/view/{idx}";
	}
	
	
	@GetMapping("/feed/myboard")
	public ModelAndView myboard() {
		ModelAndView mav = new ModelAndView();
		List<FeedDTO> list = fs.getList();
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("/feed/write")
	public void write() {};

	@PostMapping("/feed/write")
	public String write(FeedDTO dto) {
		int row = fs.write(dto);
		System.out.println(row != 0 ? "성공" : "실패");
		return "redirect:/social/feed/myboard";
	}

	
	@GetMapping("/feed/modify/{idx}")
	public ModelAndView modify(@PathVariable("idx")int idx) {
		ModelAndView mav = new ModelAndView("social/feed/modify");	
		FeedDTO dto = fs.getHealth_board(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@PostMapping("/feed/modify/{idx}")
	public ModelAndView modify(FeedDTO dto) {
		ModelAndView mav = new ModelAndView("social/alert");
		int row = fs.modify(dto);
		String url = "/alert" + dto.getIdx();
		String msg = row != 0 ? "성공" : "실패";
		mav.addObject(url);
		mav.addObject(msg);
		return mav;
	}
	
	@GetMapping("/feed/delete/{idx}")
	public ModelAndView delete(@PathVariable("idx")int idx) {
		ModelAndView mav = new ModelAndView("/social/alert");
		int row = fs.delete(idx);
		String url = "/social/home";
		String msg = row != 0 ? "성공" : "실패";
		mav.addObject("url", url);
		mav.addObject("msg", msg);
		return mav;
	}
	

	
}
