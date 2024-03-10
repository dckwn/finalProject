package com.itbank.controller;

import java.text.ParseException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itbank.model.MemberDTO;
import com.itbank.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired private MemberService ms;
	
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
		
		return "home";
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
	
}
