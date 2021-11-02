package com.gdj37.bballkup.web.reservation.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj37.bballkup.web.reservation.service.IReserveService;

@Controller
public class reserveController {
	@Autowired
	public IReserveService iReserveService;
	
	@RequestMapping(value = "/reservation")
	public ModelAndView reservation(ModelAndView mav) {
		
		mav.setViewName("reservation/reservation");
		
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
	
}
