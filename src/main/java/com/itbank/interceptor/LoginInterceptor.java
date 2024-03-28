package com.itbank.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor {
	
	@Override
	   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	       HttpSession session = request.getSession(false);
	       if (session == null || session.getAttribute("login") == null) {
	           String fullURI = request.getRequestURI(); 
	           String contextPath = request.getContextPath(); 
	           String prevPage = fullURI.substring(contextPath.length());
	           
	           session = request.getSession(true);
	           session.setAttribute("prevPage", prevPage); 
	           response.sendRedirect(contextPath + "/member/login");
	           return false;
	       }
	       return true;
	   }   

}
