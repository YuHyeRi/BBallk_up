package com.gdj37.bballkup.web.team.controller;

import java.util.HashMap;
import java.util.List;
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
import com.gdj37.bballkup.common.bean.PagingBean;
import com.gdj37.bballkup.web.team.service.ITMainService;

@Controller
public class TMainController {

	@Autowired
	public ITMainService iTMainService;
	
	// list: 팀 커뮤니티 메인페이지
	@RequestMapping(value="/tMain")
	public ModelAndView tMain(@RequestParam HashMap<String, String> params, 
								HttpSession session,
								ModelAndView mav) throws Throwable {
		
		List<HashMap<String, String>> list = iTMainService.tMainList(params);
		mav.addObject("list", list);
		
		if(session.getAttribute("sMId") != null) {
			mav.setViewName("team/tMain");
			
		} else {
			mav.setViewName("redirect:login");
		}
		
		return mav;
	}
	
	// dtl 
	@RequestMapping(value="/tMainIntro")
	public ModelAndView tMainIntro(@RequestParam HashMap<String, String> params,
									ModelAndView mav) throws Throwable {
		
		// 1. 클릭한 팀에 대한 상세페이지
		HashMap<String, String> data = iTMainService.tMainDtl(params);
		mav.addObject("data", data);
		
		// 2. 팀 가입여부에 따른 버튼 노출 유무
		int cnt = iTMainService.teamRegOX(params);
		mav.addObject("cnt", cnt);
		// System.out.println("cnt =====> " + cnt);
		
		// 3. 가입신청 후 승인상태에 따른 버튼 노출 유무
		int applyState = iTMainService.applyState(params);
		mav.addObject("applyState", applyState);
		// System.out.println("applyState =====> " + applyState);
		
		// 4. 팀장에게만 팀관리 버튼 노출
		int teamManageBtn = iTMainService.teamManageBtn(params);
		mav.addObject("teamManageBtn", teamManageBtn);
		// System.out.println("teamManageBtn =====> " + teamManageBtn);
		
		mav.setViewName("team/tMainIntro");
		return mav;
	}
	
	// add : 팀 가입신청폼으로만 이동
	@RequestMapping(value="/tReg")
	public ModelAndView tReg(ModelAndView mav) {
		
		mav.setViewName("team/tReg");
		return mav;
	}
	
	// add -2 : 팀 가입신청
	@RequestMapping(value="/tRegs")
	public ModelAndView tRegs(@RequestParam HashMap<String, String> params,
								ModelAndView mav) throws Throwable {
		int cnt = iTMainService.teamReg(params);
		if(cnt > 0) {
			mav.setViewName("redirect:tMain");
		} else {
			mav.addObject("msg", "가입신청에 실패하였습니다.");
			mav.setViewName("team/failedAction");
		}
		return mav;
	}
	
	// 팀원관리로만 이동
	@RequestMapping(value="/tMemManage")
	public ModelAndView tMemManege(ModelAndView mav) {
		
		mav.setViewName("team/tMemManage");
		return mav;
	}
	
	// list: 팀원관리 리스트 
	@RequestMapping(value = "/tMemManageAjax" , method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8") //관리자페이지>>회원관리
	@ResponseBody 
	public String memManages(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		//int page = Integer.parseInt(params.get("page"));
		//System.out.println("page:" + page);
		
		//int cnt = iTMainService.getMemCnt(params);
		//System.out.println("cnt:"+cnt);
		
		//PagingBean pb = ipagingservice.getPagingBean(page, cnt, 10, 10);
		
		//params.put("startCnt", Integer.toString(pb.getStartCount()));
		//params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iTMainService.tMemManageList(params);
		
		modelMap.put("list", list);
		//System.out.println("뽑은 리스트들 : "+list);
		//modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
		
	}
	
	@RequestMapping(value="/tMemManageUpdate")
	public ModelAndView tMemManageUpdate(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		
		int cnt = iTMainService.tMemManageUpdate(params);
		if(cnt > 0) {
			mav.setViewName("team/tMemManage");
		} else {
			mav.addObject("msg", "가입신청에 실패하였습니다.");
			mav.setViewName("team/failedAction");
		}
		return mav;
	}
		
}// class end
