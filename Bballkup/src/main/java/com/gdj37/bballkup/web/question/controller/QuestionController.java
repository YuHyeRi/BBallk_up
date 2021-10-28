package com.gdj37.bballkup.web.question.controller;

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

@Controller
public class QuestionController {
	@Autowired
	public IQuestionService iQuestionService;

	//페이징
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping (value="/Question")
	public ModelAndView Question(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		
		int page = 1;
		
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		int cnt = iQuestionService.getQCnt(params);
		PagingBean pb = iPagingService.getPagingBean(page, cnt,5,10);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		List<HashMap<String, String>> list = iQuestionService.getQList(params);
		
		mav.addObject("pb",pb);
		mav.addObject("page",page);
		mav.addObject("list",list);
		mav.setViewName("Question/Question");
		
		return mav;
	}
	
	@RequestMapping (value="/QuestionAdds")
	public ModelAndView QuestionAdds(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{
		
		int cnt = iQuestionService.addQ(params);
		
		if(cnt>0) {
			mav.setViewName("redirect:Question");
		} else {
			mav.addObject("msg","저장에 실패하였습니다.");
			mav.setViewName("Question/failedAction");
		}
		
		return mav;
	}
	
	@RequestMapping (value="/QuestionUpdates")
	public ModelAndView QuestionUpdates(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {		
		
		int cnt = iQuestionService.updateQ(params);
		if(cnt > 0) { // 수정 성공
			mav.setViewName("redirect:Question"); 
		} else {
			mav.addObject("msg","수정에 실패하였습니다.");
			mav.setViewName("Question/failedAction");						
		}	
		return mav;
	}
	
	@RequestMapping(value="/QuestionDelete")
	public ModelAndView QuestionDelete(
			@RequestParam HashMap<String,String>params, 
			ModelAndView mav)throws Throwable{
		
		int cnt = iQuestionService.deleteQ(params);
		if(cnt>0) {
			mav.setViewName("redirect:Question");
		}else {
			mav.addObject("msg","삭제에 실패하였습니다.");
			mav.setViewName("Question/failedAction");
		}
		return mav;
	}
	
	@RequestMapping(value="/QuestionReple")
	public ModelAndView QuestionReple(
			@RequestParam HashMap <String,String>params, 
			ModelAndView mav)throws Throwable{

		// 답변 내용 추가 업데이트 카운트 
		int cnt = iQuestionService.repleQ(params); 
		if(cnt > 0) {			
			mav.setViewName("redirect:Question");
		}else {
			mav.addObject("msg","답변에 실패하였습니다.");
			mav.setViewName("Question/failedAction");
		}
		return mav;
	}
	
	@RequestMapping(value="/QuestionRepleDel")
	public ModelAndView QuestionRepleDel(
			@RequestParam HashMap <String,String>params, 
			ModelAndView mav)throws Throwable{
		
		int cnt = iQuestionService.repleDeleteQ(params);
		if(cnt>0) {
			mav.setViewName("redirect:Question");
		}else {
			mav.addObject("msg","답변 삭제에 실패하였습니다.");
			mav.setViewName("Question/failedAction");
		}
		return mav;
	}
	
}
