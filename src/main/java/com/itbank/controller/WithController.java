package com.itbank.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.HealthWithDTO;
import com.itbank.model.MemberDTO;
import com.itbank.model.WithDTO;
import com.itbank.service.WithService;

@Controller
@RequestMapping("/social/with")
public class WithController {

	@Autowired
	private WithService withService;
	

	@GetMapping("/wlist")   // 참여 게시글
	public ModelAndView wlist(@RequestParam(name = "keyword", required = false) String keyword,
			 				  @RequestParam(name = "category", required = false) String category) {
		ModelAndView mav = new ModelAndView();
		List<WithDTO> list;
		
		  // category와 keyword를 모두 받아서 처리합니다.
	    if (category != null && !category.isEmpty() && keyword != null && !keyword.isEmpty()) {
	        list = withService.getWithListWithCategoryAndKeyword(category, keyword);
	    } else if (category != null && !category.isEmpty()) {
	        list = withService.getWithListWithCategory(category); // 카테고리에 따라 필터링된 리스트를 가져오는 메서드를 호출
	    } else if (keyword != null && !keyword.isEmpty()) {
	        list = withService.getWithListWithKeyword(keyword); // 키워드에 따라 필터링된 리스트를 가져오는 메서드를 호출
	    } else {
	        list = withService.getWithList();
	    }
		

		mav.addObject("wlist", list);
		return mav;
	}

	@GetMapping("/{idx}")   // 참여게시글 보기및 접수                        // 찾아가는 주소
	public ModelAndView with(@PathVariable("idx") int idx, HttpSession session) {
		ModelAndView mav = new ModelAndView("/social/with/wview");   //   jsp 이름
		WithDTO dto = withService.getWith(idx);             // 
		MemberDTO loginuser = (MemberDTO) session.getAttribute("login");
		if(loginuser == null) {
			mav.setViewName("redirect:/member/login");
			return mav;
		}
		
		List<HealthWithDTO> withList = withService.getlist(idx);     //
		boolean alreadyJoined = withList.stream().anyMatch(with -> with.getWithPeople().equals(loginuser.getUserid()));
//																		health_with						health_member									
		mav.addObject("dto", dto);
		mav.addObject("withList", withList);
		mav.addObject("loginuser", loginuser);
		mav.addObject("alreadyJoined", alreadyJoined);
		return mav;
	}
	

	@GetMapping("/mypage")   // mypage에서 내가 작성한 게시글 보기
	public ModelAndView mypage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO loginuser = (MemberDTO) session.getAttribute("login");
		if(loginuser == null) {
			mav.setViewName("redirect:/member/login");
			return mav;
		}
		List<WithDTO> list = withService.getMypageList(loginuser.getUserid());
		mav.addObject("list",list);   // 내가 작성한 게시글
		
		List<WithDTO> wJoinList = withService.getwJoinList(loginuser.getUserid());
	    mav.addObject("wJoinList", wJoinList);  // 내가 참여한 게시글
		
		return mav;
	}
	
	@GetMapping("/wcancel/{idx}")			
	public String modifyWithCancel(@PathVariable("idx") int idx, HttpSession session) {
	    MemberDTO login = (MemberDTO) session.getAttribute("login");
	    int row = withService.cancel(login.getUserid(), idx);
	    return "redirect:/social/with/mypage";
	}

	
	
	
	@GetMapping("/receipt/{idx}")    // 접수하기를 누르면 참여인원에 인원누적
	public String receipt(@PathVariable("idx") int idx, HttpSession session) {
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		int row = withService.receipt(login.getUserid(), idx);
		return "redirect:/social/with/{idx}";
	}
	@GetMapping("/cancel/{idx}")			// 취소하면 참여인원 차감
	public String cancel(@PathVariable("idx") int idx, HttpSession session) {
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		int row = withService.cancel(login.getUserid(),idx);
		return "redirect:/social/with/{idx}";
	}

	@GetMapping("/add")		
	public ModelAndView add(HttpSession session) {
		ModelAndView mav = new ModelAndView("/social/with/add");
		MemberDTO loginuser = (MemberDTO) session.getAttribute("login");
		mav.addObject("writer", loginuser.getUserid());
		return mav;
	}	
	
	@PostMapping("/add")   // 나의페이지에서 게시글 작성하기
	public String add(@ModelAttribute WithDTO dto) {
		int row = withService.add(dto);
		System.out.println(row != 0 ? "작성 성공" : "작성 실패");
		return "redirect:/social/with/mypage";
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
	
//	@GetMapping("/search")
//	public ModelAndView search(@RequestParam("searchType") String searchType, @RequestParam("keyword") String keyword) {
//		ModelAndView mav = new ModelAndView();
//		List<WithDTO> searchResult = withService.searchPosts(searchType, keyword);
//		
//		mav.addObject("wlist", searchResult);
//		mav.setViewName("redirect:/social/with/wlist");
//		return mav;
//	}
	


}
