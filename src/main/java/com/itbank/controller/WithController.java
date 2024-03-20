package com.itbank.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.WithDTO;
import com.itbank.service.WithService;

@Controller
@RequestMapping("/social/with")
public class WithController {

	@Autowired
	private WithService withService;


	@GetMapping("/wlist")   // 참여 게시글
	public ModelAndView wlist() {
		ModelAndView mav = new ModelAndView();
		List<WithDTO> list = withService.getWithList();
		mav.addObject("wlist", list);
		return mav;
	}

	@GetMapping("/{idx}")   // 참여게시글 보기및 접수
	public ModelAndView with(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/social/with/wview");
		WithDTO dto = withService.getWith(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	@GetMapping("/mypage")   // mypage리스트 보기
	public ModelAndView mypage() {
		ModelAndView mav = new ModelAndView();
		List<WithDTO> list = withService.getMypageList();
		mav.addObject("list",list);
		return mav;
	}
	
	
	@GetMapping("/add")
	public void add() {}	
	
	@PostMapping("/add")   // 나의페이지에서 게시글 작성하기
	public String add(WithDTO dto) {
		int row = withService.add(dto);
		
		System.out.println(row != 0 ? "작성 성공" : "작성 실패");
		return "redirect:/social/with/mypage";
	}

	@GetMapping("/receipt/{idx}")    // 접수하기를 누르면 참여인원에 인원누적
	public String insert(@PathVariable("idx") int idx) {
		int row = withService.insert("jjang", idx);
		return "redirect:/social/with/{idx}";
	}
	
	@GetMapping("/cancel/{idx}")			// 취소하면 참여인원 차감
	public String cancel(@PathVariable("idx") int idx) {
		int row = withService.cancel("jjang",idx);
		return "redirect:/social/with/wlist";
	}


	@GetMapping("/delete/{idx}")  // 나의 페이지에서 게시글 삭제
	public String delete(@PathVariable("idx") int idx) {
		int row = withService.delete(idx);
		System.out.println(row != 0 ? "삭제 성공" : "삭제 실패");
		return "redirect:/social/with/mypage";
			
	}
	
	@GetMapping("/modify/{idx}")		// 나의페이지에서게시글 수정
	public ModelAndView modify(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/social/with/modify");
		WithDTO dto = withService.getWith(idx);
		mav.addObject("dto",dto);
		return mav;
	}
	
	@PostMapping("/modify/{idx}")    //  수정된 정보 전달
	public String modify(WithDTO dto) {
		int row = withService.withModify(dto);
		System.out.println(row != 0 ? "수정 성공" : "수정 실패");
		return "redirect:/social/with/mypage";
	}
	


}
