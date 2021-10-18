package com.gdj37.bballkup.web.login.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj37.bballkup.util.Utils;
import com.gdj37.bballkup.web.login.service.ILoginService;

@Controller
public class loginController {

	@Autowired
	public ILoginService iLoginService;
	
	@RequestMapping(value = "/login")
	public ModelAndView login(HttpServletRequest req, HttpSession session, ModelAndView mav) {
		
		if(session.getAttribute("sMNo") != null) {//로그인
			
			mav.setViewName("login/logout");
		}else {//로그인 안됨
			
			mav.setViewName("login/login");
		}
		return mav;
	}
	
	@RequestMapping(value = "/logins")
	public ModelAndView m1Logins(
			@RequestParam HashMap<String, String> params,
			HttpSession session,
			ModelAndView mav
			) throws Throwable {
		
		//비밀번호 암호화
		String mem_pw = Utils.encryptAES128(params.get("mem_pw"));
		params.put("mem_pw", mem_pw);
		
		HashMap<String, String> data = iLoginService.getLogin(params);
		
		if(data != null) {
			session.setAttribute("sMId", data.get("MEM_ID"));
			session.setAttribute("sMNm", data.get("MEM_NM"));
			session.setAttribute("sMLv", data.get("LEVEL_NO"));
			
			System.out.println("m_no : "+session.getAttribute("sMId"));
			System.out.println("m_nm : "+session.getAttribute("sMNm"));
			System.out.println("m_lv : "+session.getAttribute("sMLv"));
			
			mav.setViewName("redirect:login");
			
		}else {//id, pw 안 일치할때(로그인 실패)
			mav.addObject("msg", "아이디나 비밀번호가 틀립니다.");
			mav.setViewName("login/failedAction");
		}
		
		return mav;
	}

	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		
		session.invalidate();//session 정보 초기화
		
		mav.setViewName("redirect:login");
		
		return mav;
	}
	
	@RequestMapping(value = "/join")
	public ModelAndView join(HttpServletRequest req, HttpSession session, ModelAndView mav) {
		
		mav.setViewName("login/join");

		return mav;
	}
	
	@RequestMapping(value = "/memCntCheckAjax" , method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String memCntCheckAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iLoginService.getMemIdCheck(params);
		
		modelMap.put("cnt", cnt);
		
		return mapper.writeValueAsString(modelMap);
	}
	
}
