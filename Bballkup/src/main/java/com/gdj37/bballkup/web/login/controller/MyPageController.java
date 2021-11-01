package com.gdj37.bballkup.web.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyPageController {
	@RequestMapping(value = "/Mypage")
	public ModelAndView Mypage(HttpServletRequest req, HttpSession session, ModelAndView mav) {
		
		mav.setViewName("login/Mypage");

		return mav;
	}
}
