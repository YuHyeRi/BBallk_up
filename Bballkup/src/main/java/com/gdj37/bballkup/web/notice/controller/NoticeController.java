package com.gdj37.bballkup.web.notice.controller;

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
import com.gdj37.bballkup.web.notice.service.INoticeService;

@Controller
public class NoticeController {
	@Autowired
	public INoticeService iNoticeService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/NoticeList")
	public ModelAndView NoticeList(@RequestParam  HashMap<String, String> params,
								ModelAndView mav) {
		String page = "1";
		
		if(params.get("page") != null) {
			page = params.get("page");
			}
			mav.addObject("page", page);
			
			mav.setViewName("notice/NoticeList");
		
			return mav;
		}
	
	@RequestMapping(value = "/NoticeLists", method = RequestMethod.POST,
			  produces = "text/json;charset=UTF-8")
	  @ResponseBody
	  public String NoticeList(@RequestParam HashMap<String, String> params) throws Throwable{
		  ObjectMapper mapper = new ObjectMapper();
		  
		  Map<String, Object> modelMap = new HashMap<String, Object>();
		  
		  int page = Integer.parseInt(params.get("page"));
		  
		  int cnt = iNoticeService.getNoticeCnt(params);
		  
		  PagingBean pb = iPagingService.getPagingBean(page, cnt, 5, 2);
	  
		  params.put("startCnt", Integer.toString(pb.getStartCount()));
		  params.put("endCnt", Integer.toString(pb.getEndCount()));
	  
		  List<HashMap<String, String>> list = iNoticeService.getNoticeList(params);
		  
		  modelMap.put("list", list);
		  modelMap.put("pb", pb);
		  
		  return mapper.writeValueAsString(modelMap);
	  }
	
	@RequestMapping(value = "/Notice")
	  public ModelAndView Notice(@RequestParam HashMap<String, String> params,
				ModelAndView mav) throws Throwable {

		  if(params.get("no") != null) {
			  
			  iNoticeService.updateNoticeHit(params);
			  
			  HashMap<String, String> data = iNoticeService.getNotice(params);
			  
			  mav.addObject("data", data);
			  
			  mav.setViewName("notice/Notice");
		  }else {
			  mav.setViewName("redirect:NoticeList");
		  }
		  return mav;
	  }
	
	 @RequestMapping(value = "/NoticeAdd")
	  public ModelAndView NoticeAdd(ModelAndView mav){
	  mav.setViewName("notice/NoticeAdd");
	  
	  return mav;
	  }
	 
	 @RequestMapping(value = "/NoticeAdds", method = RequestMethod.POST,
			  produces = "text/json;charset=UTF-8")
	  @ResponseBody
	  public String NoticeAdds(@RequestParam HashMap<String, String> params)throws Throwable{
		  ObjectMapper mapper = new ObjectMapper();
		  
		  Map<String, Object> modelMap = new HashMap<String, Object>();
		  System.out.println(params.get("sMNo"));
		  String result = "success";
		  
		  try {
			int cnt= iNoticeService.NoticeAdd(params);
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
	 
	 @RequestMapping(value = "/NoticeUpdate")
	  public ModelAndView NoticeUpdate(@RequestParam HashMap<String, String> params,
				ModelAndView mav) throws Throwable {
		  if(params.get("no") != null) {
				HashMap<String, String> data = iNoticeService.getNotice(params);
				
				mav.addObject("data", data);
				
				mav.setViewName("notice/NoticeUpdate");
			}else {
				mav.setViewName("redirect:NoticeList");
			}
			
			return mav;
	  }
	 
	 	@RequestMapping(value = "/NoticeUpdates", method = RequestMethod.POST,
				produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String NoticeUpdates(@RequestParam HashMap<String, String> params) throws Throwable{
	  		ObjectMapper mapper = new ObjectMapper();
	  		
	  		Map<String, Object> modelMap = new HashMap <String, Object>();
			
			String result = "success";
			
			try {
				int cnt = iNoticeService.NoticeUpdate(params);
				
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
	 
	 	@RequestMapping(value = "/NoticeDeletes", method = RequestMethod.POST,
				produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String NoticeDeletes(@RequestParam HashMap<String, String> params)throws Throwable{
			ObjectMapper mapper = new ObjectMapper();
	  
			Map<String, Object> modelMap = new HashMap <String, Object>();
			
			String result = "success";
			
			try {
				int cnt = iNoticeService.NoticeDeletes(params);
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
	 	
	 	@RequestMapping(value = "/Noticeup", method = RequestMethod.POST,
				produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String Noticeup(@RequestParam HashMap<String, String> params)throws Throwable{
			ObjectMapper mapper = new ObjectMapper();
	 	
			Map<String, Object> modelMap = new HashMap <String, Object>();
			
			String result = "success";
			
			try {
				int cnt = iNoticeService.Noticeup(params);
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
