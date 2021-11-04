package com.gdj37.bballkup.web.reservation.controller;

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
import com.gdj37.bballkup.common.service.IPagingService;
import com.gdj37.bballkup.web.reservation.service.IReserveService;

@Controller
public class reserveController {
	@Autowired
	public IReserveService iReserveService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/reservation")
	public ModelAndView reservation(@RequestParam HashMap<String, String> params,
									ModelAndView mav) throws Throwable {
		
		 int cnt = iReserveService.getCard(params); 
		
		 if(cnt > 0) { 
			 mav.setViewName("reservation/reservation"); 
		 
		 }else {
			 mav.addObject("msg","카드가 등록되어 있어야 주최가 가능합니다.");
			 mav.setViewName("reservation/failedAction"); 
		 }
		
		return mav;
	}
	
	@RequestMapping(value = "/reservations" , method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String reservations(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		String result = "success";

		try {
			  int cnt = iReserveService.matchAdd(params);
			  
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
	
	@RequestMapping(value = "/reserveEntry")
	public ModelAndView personalReservation(ModelAndView mav) {
		
		mav.setViewName("reservation/reserveEntry");
		
		return mav;
	}
	
	@RequestMapping(value = "/pList")
	public ModelAndView pList(@RequestParam HashMap<String, String> params, 
			HttpSession session, ModelAndView mav) {
		
		int page = 1;
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page", page);
		
		if(session.getAttribute("sMId") != null) {
			mav.setViewName("reservation/pList");
			
		} else {
			mav.setViewName("redirect:login");
		}
		
		return mav;
	}
	
	@RequestMapping(value="/pLists", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String pLists(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int page = Integer.parseInt(params.get("page"));
		int cnt = iReserveService.getMatchCnt(params);
		
		PagingBean pb = iPagingService.getPagingBean(page, cnt);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iReserveService.getMatchList(params);
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/stateChk", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String stateChk(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
			
		String result = "success";
			
		try {
			int cnt = iReserveService.stateChk(params);
			if(cnt > 0 ) {
					result = "failed";
			}
		} catch(Exception e) {
			e.printStackTrace();
			result = "error";
		}
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/pDtl")
	public ModelAndView pDtl(@RequestParam HashMap<String, String> params, 
									ModelAndView mav) throws Throwable {
		if(params.get("match_no") != null) {
			
			HashMap<String, String> data = iReserveService.getMatch(params);
			
			mav.addObject("data", data);
			
			int attCnt = iReserveService.getAtt(params);
			
			if(attCnt > 0) {
				mav.addObject("attCnt", attCnt);
			}			
			mav.setViewName("reservation/pDtl");
			
		} else {
			mav.setViewName("redirect/pList");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/pAttend")
	public ModelAndView pAttend(@RequestParam HashMap<String, String> params,
									ModelAndView mav) throws Throwable {

			int cnt = iReserveService.getCard(params); 
			
			if(cnt > 0) { 
				mav.setViewName("reservation/pAttend"); 
				
			}else {
				mav.addObject("msg","카드가 등록되어 있어야 참여가 가능합니다.");
				mav.setViewName("reservation/failedAction"); 
			}
		return mav;
	}
	
	@RequestMapping(value = "/pAttends" , method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String pAttends(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		String result = "success";

		try {
				int cnt = iReserveService.attend(params);
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
	
	@RequestMapping(value="/matchDeletes", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	
	@ResponseBody
	public String matchDeletes(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
			
		String result = "success";
			
		try {
			int cnt = iReserveService.matchDelete(params);
			if(cnt == 0 ) {
					result = "failed";
			}
		} catch(Exception e) {
			e.printStackTrace();
			result = "error";
		}
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/map")
	public ModelAndView map(ModelAndView mav) {
		
		mav.setViewName("reservation/map");
		
		return mav;
	}
	
}
