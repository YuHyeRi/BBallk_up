package com.gdj37.bballkup.web.login.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.bballkup.web.login.service.ILoginService;

@Controller
public class MyPageController {
	
	@Autowired
	public ILoginService iLoginService;
	
	@RequestMapping(value = "/Mypage")
	public ModelAndView Mypage(HttpServletRequest req, HttpSession session, 
			@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = iLoginService.getMem(params);
		
		mav.addObject("data", data);
		mav.setViewName("login/Mypage");

		return mav;
	}
}
