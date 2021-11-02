package com.gdj37.bballkup.web.t_board.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.bballkup.common.bean.PagingBean;
import com.gdj37.bballkup.common.service.IPagingService;
import com.gdj37.bballkup.web.question.service.IQuestionService;
import com.gdj37.bballkup.web.t_board.service.IT_onelineService;

@Controller
public class T_onelineController {
	@Autowired
	public IT_onelineService it_onelineService;

	//페이징
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping (value="/T_oneline")
	public ModelAndView Question(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		
		int page = 1;
		
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		int cnt = it_onelineService.tOneCnt(params);
		PagingBean pb = iPagingService.getPagingBean(page, cnt,5,10);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		List<HashMap<String, String>> list = it_onelineService.tOneList(params);
		
		//int cnt2 = it_onelineService.tOneLeader(params);
		
		mav.addObject("pb",pb);
		mav.addObject("page",page);
		mav.addObject("list",list);
		mav.setViewName("t_board/T_oneline");
		
		return mav;
	}
	
	@RequestMapping (value="/T_onelineAdds")
	public ModelAndView T_onelineAdds(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{
		System.out.println(params);// 받아오는 값 확인
		int cnt = it_onelineService.tOneAdd(params);
		
		if(cnt>0) {
			mav.addObject("tno", params.get("tno"));
			mav.setViewName("redirect:T_oneline");
		} else {
			mav.addObject("msg","저장에 실패하였습니다.");
			mav.setViewName("t_board/failedAction");
		}
		
		return mav;
	}
	
	@RequestMapping (value="/T_onelineUpdates")
	public ModelAndView T_onelineUpdates(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {		
		
		int cnt = it_onelineService.tOneUpdate(params);
		if(cnt > 0) { // 수정 성공
			mav.addObject("tno", params.get("tno"));
			mav.setViewName("redirect:T_oneline"); 
		} else {
			mav.addObject("msg","수정에 실패하였습니다.");
			mav.setViewName("t_board/failedAction");						
		}	
		return mav;
	}
	
	@RequestMapping(value="/T_onelineDelete")
	public ModelAndView T_onelineDelete(
			@RequestParam HashMap<String,String>params, 
			ModelAndView mav)throws Throwable{
		
		int cnt = it_onelineService.tOneDelete(params);
		if(cnt>0) {
			mav.addObject("tno", params.get("tno"));
			mav.setViewName("redirect:T_oneline");
		}else {
			mav.addObject("msg","삭제에 실패하였습니다.");
			mav.setViewName("t_board/failedAction");
		}
		return mav;
	}
	
	@RequestMapping(value="/T_onelineReple")
	public ModelAndView T_onelineReple(
			@RequestParam HashMap <String,String>params, 
			ModelAndView mav)throws Throwable{

		// 답변 내용 추가 업데이트 카운트 
		int cnt = it_onelineService.tOneReple(params); 
		if(cnt > 0) {
			mav.addObject("tno", params.get("tno"));
			mav.setViewName("redirect:T_oneline");
		}else {
			mav.addObject("msg","답변에 실패하였습니다.");
			mav.setViewName("t_board/failedAction");
		}
		return mav;
	}
	
	@RequestMapping(value="/T_onelineRepleDel")
	public ModelAndView T_onelineRepleDel(
			@RequestParam HashMap <String,String>params, 
			ModelAndView mav)throws Throwable{
		
		int cnt = it_onelineService.tOneRepleDelete(params);
		if(cnt>0) {
			mav.addObject("tno", params.get("tno"));
			mav.setViewName("redirect:T_oneline");
		}else {
			mav.addObject("msg","답변 삭제에 실패하였습니다.");
			mav.setViewName("t_board/failedAction");
		}
		return mav;
	}
	
}
