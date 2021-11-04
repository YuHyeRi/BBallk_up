package com.gdj37.bballkup.web.myPage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj37.bballkup.common.bean.PagingBean;
import com.gdj37.bballkup.common.service.IPagingService;
import com.gdj37.bballkup.util.Utils;
import com.gdj37.bballkup.web.myPage.service.IMyPageService;


@Controller
public class myPageController {
	
	@Autowired
	public IMyPageService iMyPageService;
	
	@Autowired
	public IPagingService ipagingservice;
	
	@RequestMapping(value = "/myPage") //마이페이지
	public ModelAndView myPage(@RequestParam HashMap<String, String> params,
								ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = iMyPageService.getMEM(params);
		
		mav.addObject("data", data);
		mav.setViewName("login/Mypage");
		
		return mav;
	}
	
	@RequestMapping(value = "/mgrPage") //관리자페이지
	public ModelAndView mgrPage(@RequestParam HashMap<String, String> params,
								ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = iMyPageService.getMEM(params);
		
		mav.addObject("data", data);
		mav.setViewName("myPage/mgrPage");
		
		return mav;
	}
	
	@RequestMapping(value = "/teamManage") //관리자페이지>>팀관리
	public ModelAndView teamManage(@RequestParam  HashMap<String, String> params,
								ModelAndView mav) {
	
		mav.setViewName("myPage/teamManage");
	
		return mav;
	}
	
	// list: 팀관리 리스트 
	@RequestMapping(value = "/teamManages" , method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8") //관리자페이지>>팀관리
	@ResponseBody 
	public String teamManages(@RequestParam HashMap<String, String> params) throws Throwable{
			
		ObjectMapper mapper = new ObjectMapper();
			
		Map<String, Object> modelMap = new HashMap<String, Object>();
		List<HashMap<String, String>> list = iMyPageService.teamManageList(params);
			
		modelMap.put("list", list);
		//System.out.println("뽑은 리스트들 : "+list);
		//modelMap.put("pb", pb);
			
		return mapper.writeValueAsString(modelMap);
			
	}
		
	// 팀관리 승인완료 처리
	@RequestMapping(value = "/teamManageUpdate" , method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8") //관리자페이지>>팀관리
	@ResponseBody 
	public String teamManageUpdate(@RequestParam HashMap<String, String> params) throws Throwable{
			
		ObjectMapper mapper = new ObjectMapper();
			
		Map<String, Object> modelMap = new HashMap<String, Object>();
		int cnt = iMyPageService.teamManageUpdate(params);
			
		modelMap.put("cnt",cnt);
			
		return mapper.writeValueAsString(modelMap);
			
	}
	@RequestMapping(value = "/memManage") //관리자페이지>>회원관리
	public ModelAndView memManage(@RequestParam  HashMap<String, String> params,
								ModelAndView mav) {
		String page = "1";
		
		if(params.get("page") != null) {
			page = params.get("page");
		}
		System.out.println("memManage_page:"+page);
		mav.addObject("page", page);
		
		mav.setViewName("myPage/memManage");
	
		return mav;
	}
	
	@RequestMapping(value = "/memManages" , method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8") //관리자페이지>>회원관리
	@ResponseBody 
	public String memManages(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int page = Integer.parseInt(params.get("page"));
		//System.out.println("page:" + page);
		
		int cnt = iMyPageService.getMemCnt(params);
		//System.out.println("cnt:"+cnt);
		
		PagingBean pb = ipagingservice.getPagingBean(page, cnt, 10, 10);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iMyPageService.getMemList(params);
		
		modelMap.put("list", list);
		
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
		
	}
	
	@RequestMapping(value = "/memDtl") //관리자페이지>>회원관리>>회원상세
	public ModelAndView memDtl(@RequestParam  HashMap<String, String> params,
								ModelAndView mav) {
		
		mav.setViewName("myPage/memDtl");
	
		return mav;
	}
	
	@RequestMapping(value = "/memDtls" , method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8") //관리자페이지>>회원관리>>회원상세
	@ResponseBody 
	public String memDtls(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> list = iMyPageService.getTeamList(params);
		HashMap<String, String> data = iMyPageService.getMEM(params);
		
		modelMap.put("list", list);
		modelMap.put("data", data);
		
		
		return mapper.writeValueAsString(modelMap);
		
	}
	
	@RequestMapping(value = "/myCard") //마이페이지>>카드등록
	public ModelAndView myCard(@RequestParam HashMap<String, String> params,
								ModelAndView mav) throws Throwable {
		
		int cnt = iMyPageService.getCardChk(params);
		
		if(cnt > 0) {
			HashMap<String, String> data = iMyPageService.getCard(params);
			System.out.println(data);
			
			mav.addObject("data", data);					
		}

		mav.setViewName("myPage/myCard");
		
		return mav;
	}
	
	@RequestMapping(value = "/cardCUD" , method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8") //마이페이지>>카드등록
	@ResponseBody 
	public String cardCUD(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		String result = "success";
		
		try {
			int cnt = 0;
			
			//CUD처리
			switch (params.get("gbn")) {
				//카드 등록
				case "c":
					//카드 뒷번호 암호화
					params.put("cardNum2", Utils.encryptAES128(params.get("cardNum2")));
					//비밀번호 앞2자리 암호화
					params.put("cardPw", Utils.encryptAES128(params.get("cardPw")));
					
					cnt = iMyPageService.addCard(params);
					
					break;
				case "d":
					//카드 삭제
					cnt = iMyPageService.deleteCard(params);
					break;
			}
			
			if(cnt == 0) {
				result = "failed";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
			result = "error";
		}
		
		modelMap.put("result", result);
		
		return mapper.writeValueAsString(modelMap);
	}
}
