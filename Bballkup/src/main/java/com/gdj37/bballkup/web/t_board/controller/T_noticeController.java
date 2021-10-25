package com.gdj37.bballkup.web.t_board.controller;

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
import com.gdj37.bballkup.web.t_board.service.IT_noticeService;

@Controller
public class T_noticeController {
	@Autowired
	public IT_noticeService iT_noticeService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/T_notice")
	public ModelAndView T_notice(@RequestParam HashMap<String, String> params,
			ModelAndView mav) {
		
		String page = "1";
		
		if(params.get("page") != null) {
			page = params.get("page");
			}
			mav.addObject("page", page);
			
			mav.setViewName("t_board/T_notice");
		
			return mav;
	}
	
	
	@RequestMapping(value = "/T_notices", method = RequestMethod.POST,
			  produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String T_notice(@RequestParam HashMap<String, String> params) throws Throwable{
		  ObjectMapper mapper = new ObjectMapper();

		  Map<String, Object> modelMap = new HashMap<String, Object>();
		  
		  int page = Integer.parseInt(params.get("page"));
		  
		  int cnt = iT_noticeService.getnoticeCnt(params);
		  
		  PagingBean pb = iPagingService.getPagingBean(page, cnt, 10, 5);
		  
		  params.put("startCnt", Integer.toString(pb.getStartCount()));
		  params.put("endCnt", Integer.toString(pb.getEndCount()));
	  
		  List<HashMap<String, String>> list = iT_noticeService.getnoticeList(params);
		  
		  modelMap.put("list", list);
		  modelMap.put("pb", pb);
		  
		  return mapper.writeValueAsString(modelMap);
	}
}
