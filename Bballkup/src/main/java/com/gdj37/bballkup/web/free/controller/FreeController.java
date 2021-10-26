package com.gdj37.bballkup.web.free.controller;

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
import com.gdj37.bballkup.web.free.service.IFreeService;

@Controller
public class FreeController {
	
	@Autowired
	public IPagingService iPagingService;
	
	@Autowired
	public IFreeService iFreeService;
	
	// list 1
	@RequestMapping(value="/freeList")
	public ModelAndView freeList(@RequestParam HashMap<String, String> params, 
									HttpSession session, ModelAndView mav) {
		
		int page = 1;
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page", page);
		
		if(session.getAttribute("sMId") != null) {
			mav.setViewName("free/freeList");
			
		} else {
			mav.setViewName("redirect:login");
		}
		return mav;
	}
	
	// list 2
	@RequestMapping(value="/freeLists", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	
	@ResponseBody
	public String freeLists(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int page = Integer.parseInt(params.get("page"));
		int cnt = iFreeService.getFreeCnt(params);
		PagingBean pb = iPagingService.getPagingBean(page, cnt, 5, 10);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iFreeService.getFreeList(params);
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// add 1
	@RequestMapping(value="/freeAdd")
	public ModelAndView freeAdd(ModelAndView mav) {
		/*
		 * if(session.getAttribute("sMId") != null) {
		 * mav.setViewName("bballkup/freeAdd"); } else {
		 * mav.setViewName("redirect:login"); }
		 */
		mav.setViewName("free/freeAdd");
		return mav;
	}
			
	// add 2
	@RequestMapping(value="/freeAdds", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
			
	@ResponseBody
	public String freeAdds(@RequestParam HashMap<String, Object> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String result = "success";
				
		try {
			int cnt = iFreeService.freeAdd(params);
			if(cnt == 0) {
				result = "failed";
			}
		} catch(Exception e) {
			e.printStackTrace();
			result = "error";
		}
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	
	// dtl
	@RequestMapping(value="/freeDtl")
	public ModelAndView freeDtl(@RequestParam HashMap<String, String> params, 
									ModelAndView mav) throws Throwable {
		if(params.get("no") != null) {
			iFreeService.updateFreeHit(params);
			
			HashMap<String, String> data = iFreeService.getFree(params);
			mav.addObject("data", data);
			mav.setViewName("free/freeDtl");
		} else {
			mav.setViewName("redirect/freeList");
		}
		
		// comment list 추가
		int page = 1;
		
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		int cnt = iFreeService.cfreeCnt(params);
		PagingBean pb = iPagingService.getPagingBean(page, cnt, 5, 10);
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iFreeService.cfreeList(params);
		mav.addObject("page", page);
		mav.addObject("pb", pb);
		mav.addObject("cnt", cnt);
		mav.addObject("list", list);
		mav.setViewName("free/freeDtl");
		
		return mav;
	}
	
	// update 1
	@RequestMapping(value="/freeUpdate")
	public ModelAndView freeUpdate(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		if(params.get("no") != null) {
			HashMap<String, String> data = iFreeService.getFree(params);
			mav.addObject("data", data);
			mav.setViewName("free/freeUpdate");
		} else {
			mav.setViewName("redirect:freeList");
		}
		return mav;
	}
	
	// update 2
	@RequestMapping(value="/freeUpdates", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	
	@ResponseBody
	public String freeUpdates(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		String result = "success";
		
		try {
			int cnt = iFreeService.freeUpdate(params);
			
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
	
	// delete
	@RequestMapping(value="/freeDeletes", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
		
	@ResponseBody
	public String freeDeletes(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
			
		String result = "success";
			
		try {
			int cnt = iFreeService.freeDelete(params);
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
	
	// commnet 컨트롤러
	// comment add 추가
	@RequestMapping(value="/cfreeAdds", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	
	@ResponseBody
	public String cfreeAdds(@RequestParam HashMap<String, Object> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		String result = "success";
		
		try {
			int cnt = iFreeService.cfreeAdd(params);
			if(cnt == 0) {
				result = "failed";
			}
		} catch(Exception e) {
			e.printStackTrace();
			result = "error";
		}
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	
	// comment delete 추가
	@RequestMapping(value="/cfreeDels", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	
	@ResponseBody
	public String cfreeDels(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		String result = "success";
		
		try {
			int cnt = iFreeService.cfreeDel(params);
			if(cnt == 0) {
				result = "failed";
			}
		} catch(Exception e) {
			e.printStackTrace();
			result = "error";
		}
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	
	// comment update 추가
	@RequestMapping(value="/cfreeUpdates", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
		
	@ResponseBody
	public String cfreeUpdates(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// System.out.println(params.get("con2"));
		// System.out.println(params.get("reno"));
			
		String result = "success";
			
		try {
			int cnt = iFreeService.cfreeUpdate(params);
			
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

} // class end
