package com.gdj37.bballkup.web.teamAdd.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj37.bballkup.web.myPage.service.IMyPageService;
import com.gdj37.bballkup.web.teamAdd.service.ITeamAddService;


@Controller
public class teamAddController {
	@Autowired
	public ITeamAddService iTeamAddService;
	
	@Autowired
	public IMyPageService iMyPageService;
	
	/* 메소드 로그인 컨트롤러로 이동
	 * @RequestMapping(value = "/teamChk" , method = RequestMethod.POST, produces =
	 * "text/json;charset=UTF-8")
	 * 
	 * @ResponseBody public String teamChk(@RequestParam HashMap<String, String>
	 * params) throws Throwable{
	 * 
	 * ObjectMapper mapper = new ObjectMapper();
	 * 
	 * Map<String, Object> modelMap = new HashMap<String, Object>();
	 * 
	 * String result = "success";
	 * 
	 * try { int teamChk = iTeamAddService.teamChk(params);
	 * System.out.println("팀 체크 : "+teamChk);
	 * 
	 * if(teamChk > 0) { result = "overlap"; }else { result = "success"; }
	 * 
	 * System.out.println(result); } catch (Exception e) { e.printStackTrace();
	 * 
	 * result = "error"; }
	 * 
	 * modelMap.put("result", result);
	 * 
	 * return mapper.writeValueAsString(modelMap); }
	 */
	
	@RequestMapping(value = "/tNmChk" , method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String tNmChk(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		String result = "success";
		
		try {
			  int tNmChk = iTeamAddService.tNmChk(params);
			  System.out.println("팀명 중복체크 : "+tNmChk);
			  
			  if(tNmChk > 0) { 
				  result = "overlap"; 
			  }else {
				  result = "success";
			  }
			
			  System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
			
			result = "error";
		}
		
		modelMap.put("result", result);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/teamAdd")
	public ModelAndView teamAdd(@RequestParam HashMap<String, String> params,				
								ModelAndView mav) throws Throwable {				
		
		/*
		 * HashMap<String, String> data = iMyPageService.getMEM(params);
		 * 
		 * mav.addObject("data", data); System.out.println(data);
		 */
	 
		mav.setViewName("teamAdd/teamAdd");
		
		return mav;
	}
	
	@RequestMapping(value = "/teamAdds" , method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String teamAdds(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		String result = "success";

		try {
				int tNmChk = iTeamAddService.tNmChk(params);
				  
				  if(tNmChk > 0) { 
					  result = "reChk"; 
				  }else {
					  result = "success";
					  int cnt = iTeamAddService.teamAdd(params);
					  
					  if(cnt == 0) {
						  result = "failed";
					  }
				  }
		} catch (Exception e) {
			e.printStackTrace();
			
			result = "error";
		}
		
		modelMap.put("result", result);
		
		return mapper.writeValueAsString(modelMap);
	}
}
