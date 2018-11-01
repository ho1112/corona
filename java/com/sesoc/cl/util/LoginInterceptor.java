package com.sesoc.cl.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// Session 정보를 얻어옴 
		HttpSession session = request.getSession();
		String custid = (String)session.getAttribute("loginId");
		//로그인을 하지 않은 경우
		if(custid == null){
			//로그인 화면으로 redirect
			response.sendRedirect("intercepted");
			return false;
		}
		
		return super.preHandle(request, response, handler);
		/*return true; 도 사용가능*/
	}
}
