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
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.WithDTO;
import com.itbank.repository.HealthBoardRepository;
import com.itbank.service.WithService;

@Controller
@RequestMapping("/social/with")
public class WithController {

	@Autowired
	private WithService withService;
	
	@Autowired
    private HealthBoardRepository healthBoardRepository;

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
	

	@GetMapping("/receipt/{idx}")    // 접수하기를 누르면 참여인원에 인원누적
	public String insert(@PathVariable("idx") int idx) {
		int row = withService.insert("jjang", idx);
		 if (row > 0) {
	            increaseWithNum(idx); // 게시글 작성자가 작성한 게시글의 withNum을 증가시킴
	        }
		return "redirect:/social/with/{idx}";
	}
	
	
	
	
	private void increaseWithNum(int idx) {
		String writer = healthBoardRepository.getWriterByIdx(idx); // 게시글 작성자를 가져옴
        if (writer != null) {
            healthBoardRepository.increaseWithNum(writer); // 해당 작성자가 작성한 게시글의 withNum을 증가시킴
        }
		
	}

	@GetMapping("/add")
	public void join() {}	
	
	@PostMapping("/add")   // 나의페이지에서 게시글 작성하기
	public String add(@ModelAttribute WithDTO dto) {
		int row = withService.add(dto);
		
        if (row > 0) {
            increaseWithNumForWriter(dto.getWriter()); // 게시글 작성자가 작성한 게시글의 withNum을 증가시킴
        }

		
		System.out.println(row != 0 ? "작성 성공" : "작성 실패");
		return "redirect:/social/with/mypage";
	}
	
	

	private void increaseWithNumForWriter(String writer) {
		 if (writer != null) {
	            healthBoardRepository.increaseWithNum(writer); // 해당 작성자가 작성한 게시글의 withNum을 증가시킴
	        }
		
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
