package com.itbank.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.InfoDTO;
import com.itbank.model.MemberDTO;
import com.itbank.service.InfoService;
import com.itbank.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired private MemberService ms;
	@Autowired private InfoService is;
	
	@GetMapping("/login")
	public void login() {}
	
	@PostMapping("/login")
	public String login(MemberDTO dto, HttpSession session) {
		MemberDTO login = ms.login(dto);
		session.setAttribute("login", login);
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/join")
	public void join() {}
	
	@PostMapping("/join")
	public String join(MemberDTO dto) throws ParseException {
		int row = ms.join(dto);
		
		System.out.println(row!=0 ? "가입 성공":"가입 실패");
		
		return "redirect:/";
	}
	
	@GetMapping("/myPage")
	public ModelAndView info(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		
		InfoDTO info = is.getOne(login.getUserid());
		
		if(info != null) {
			mav.addObject("info", info);
		}
		
		return mav;
	}
	
	@PostMapping("/check")
	@ResponseBody
	public HashMap<String, Object> check(@RequestBody HashMap<String,Object> param) {
		HashMap<String, Object> map = new HashMap<>();
		int row = ms.check(param);
		map.put("row", row);
		map.put("msg", row!=0?"중복된 아이디가 있습니다.":"사용가능한 아이디입니다.");
		return map;
	}
	
	//비밀 번호 변경
		@GetMapping("/chPw")
		public void chPw() {}
		
		@PostMapping("/chPw")
		public String chPw(@RequestParam Map<String, String> param, HttpSession session) {
		
			MemberDTO login = (MemberDTO) session.getAttribute("login");
			param.put("userid", login.getUserid());
			
			
			int row = ms.chPw(param);
			System.out.println(row!=0 ? "변경 성공":"변경 실패");
			if(row!=0) {session.invalidate();}
			return "redirect:/";	
		}
		
		// 비밀번호 재발급
		
			@GetMapping("/sendPassword")
			public void sendPassword() {}
			
			
			@PostMapping("/sendPassword")
			public String sendPassword(@RequestParam HashMap<String, String>param, MemberDTO dto) {
				
				param.put("email",dto.getEmail());
				param.put("username", dto.getUsername());
				String ResultMessage = ms.sendPassword(param);
				
				return ResultMessage;
			}
		
		@GetMapping("/chIf")
		public void chIf() {}
		
		@PostMapping("chIf")
		public String chIf(MemberDTO dto, HttpSession session) {
			int row = 0;
			MemberDTO login = (MemberDTO) session.getAttribute("login");
			
			row = ms.updateInfo(login, dto);
			
			if(row!=0) {session.invalidate();}
			return "redirect:/";
		}
	
}
