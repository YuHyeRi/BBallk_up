package com.gdj37.bballkup.web.team.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
		
		// 4. 입장하기(B) 해당 팀번호 게시판으로 이동
		// HashMap<String, String> goTB = iTMainService.goTB(params);
		// mav.addObject("goTB", goTB);
		
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
	
	// 수정ing -- team_no에 맞는 게시판으로 이동하기 위한 컨트롤러
	@RequestMapping(value="/goTB")
	public ModelAndView goTB(@RequestParam HashMap<String, String> params,
								ModelAndView mav) throws Throwable {
		
		
		return mav;
	}
	
	
	
	
	
} // class end
