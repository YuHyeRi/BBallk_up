package com.gdj37.bballkup.web.main.controller;

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
import com.gdj37.bballkup.web.main.service.IMainService;

@Controller
public class MainController {
	@Autowired
	public IMainService iMainService;

	@RequestMapping(value = "/Main")
	public ModelAndView Main(@RequestParam HashMap<String, String> params,
					HttpSession session, ModelAndView mav) throws Throwable{
		
		mav.setViewName("main/Main");

		return mav;
	}

	@RequestMapping(value="/Mainnotice", method=RequestMethod.POST,
				produces="text/json;charset=UTF-8")
	@ResponseBody
	public String Mainnotice(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> list = iMainService.getMain2List(params);
		modelMap.put("list", list);
		
		List<HashMap<String, String>> list3 = iMainService.getMain3List(params);
		modelMap.put("list3", list3);
		
		List<HashMap<String, String>> list1 = iMainService.getMain1List(params);
		modelMap.put("list1", list1);
		
		return mapper.writeValueAsString(modelMap);
	}
}
