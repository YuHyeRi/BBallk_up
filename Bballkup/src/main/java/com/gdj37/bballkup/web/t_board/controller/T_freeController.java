package com.gdj37.bballkup.web.t_board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj37.bballkup.common.bean.PagingBean;
import com.gdj37.bballkup.common.service.IPagingService;
import com.gdj37.bballkup.web.t_board.service.IT_freeService;

@Controller
public class T_freeController {
	
	@Autowired
	public IT_freeService iT_freeService;
	
	@Autowired
	public IPagingService iPagingService;

	
	// list -1
	@RequestMapping(value="/tFreeList")
	public ModelAndView tFreeList (@RequestParam HashMap<String, String> params, 
									HttpSession session,
									ModelAndView mav) throws Throwable {
		int page = 1;
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page", page);
		
		if(session.getAttribute("sMId") != null) {
			mav.setViewName("t_board/tFreeList");
		} else {
			mav.setViewName("redirect:login");
		}
		return mav;
	}
	
	// list -2 
	@ResponseBody
	@PostMapping(value="/tFreeLists", produces="text/json;charset=UTF-8")
	public String tFreeLists(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		int page = Integer.parseInt(params.get("page"));
		int cnt = iT_freeService.tFreeCnt(params);		// tFreeCnt
		
		PagingBean pb = iPagingService.getPagingBean(page, cnt);
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> list = iT_freeService.tFreeList(params);	// tFreeList
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// dtl
	@RequestMapping(value="/tFreeDtl")
	public ModelAndView tFreeDtl(@RequestParam HashMap<String, String> params, 
									ModelAndView mav) throws Throwable {
		if(params.get("no") != null) {
			iT_freeService.tFreeHit(params);	// tFreeHit
			
			HashMap<String, String> data = iT_freeService.tFree(params); 	// tFree
			mav.addObject("data", data);
			mav.setViewName("t_board/tFreeDtl");
		} else {
			mav.setViewName("redirect:tFreeList");
		}
		
		// 댓글 추가
		int page = 1;
		
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		int cnt = iT_freeService.cTFreeCnt(params);		// cTFreeCnt
		
		PagingBean pb = iPagingService.getPagingBean(page, cnt, 5, 10);
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iT_freeService.cTFreeList(params);	// cTFreeList
		
		mav.addObject("page", page);
		mav.addObject("pb", pb);
		mav.addObject("list", list);

		mav.setViewName("t_board/tFreeDtl");
		return mav;
	}
	
	// delete 
	@ResponseBody
	@PostMapping(value="/tfreeDeletes", produces="text/json;charset=UTF-8")
	public String tfreeDeletes (@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		String result = "success";
		
		try {
			int cnt = iT_freeService.tFreeDelete(params); 	//tFreeDelete
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
	
	// add -1
	@RequestMapping(value="/tFreeAdd")
	public ModelAndView tFreeAdd(ModelAndView mav) {
			
		mav.setViewName("t_board/tFreeAdd");
		return mav;
	}
		
	// add -2
	@ResponseBody
	@PostMapping(value="/tFreeAdds", produces="text/json;charset=UTF-8")
	public String tFreeAdds(@RequestParam HashMap<String, Object> params) throws Throwable {
			
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
			
		String result = "success";
					
		try {
			int cnt = iT_freeService.tFreeAdd(params);	// tFreeAdd
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
	
	// update -1
	@RequestMapping(value="/tFreeUpdate")
	public ModelAndView tFreeUpdate(@RequestParam HashMap<String, String> params,
									ModelAndView mav) throws Throwable {
		if(params.get("no") != null) {
			HashMap<String, String> data = iT_freeService.tFree(params);
			mav.addObject("data", data);
			mav.setViewName("t_board/tFreeUpdate");
		} else {
			mav.setViewName("redirect:tFreeList");
		}
		return mav;
	}
	
	// update -2
	@ResponseBody
	@PostMapping(value="/tFreeUpdates", produces="text/json;charset=UTF-8")
	public String tFreeUpdates(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		String result = "success";
		
		try {
			int cnt = iT_freeService.tFreeUpdate(params);
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
	
	// comment
	// comment add
	@ResponseBody
	@PostMapping(value="/cTfreeAdds", produces="text/json;charset=UTF-8")
	public String cTfreeAdds(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		String result = "success";
		
		try {
			int cnt = iT_freeService.cTfreeAdd(params);	// cTfreeAdd
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
	
	// comment delete
	@ResponseBody
	@PostMapping(value="/cTfreeDels", produces="text/json;charset=UTF-8")
	public String cTfreeDels(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		String result = "success";
		
		try {
			int cnt = iT_freeService.cTfreeDel(params);		// cTfreeDel
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
	
	// comment update
	@ResponseBody
	@PostMapping(value="/cTfreeUpdates", produces="text/json;charset=UTF-8")
	public String cTfreeUpdates(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		String result = "success";
		
		try {
			int cnt = iT_freeService.cTfreeUpdate(params);
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
	
	
	
} // class end