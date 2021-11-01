package com.gdj37.bballkup.web.siteplan;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class UsedContoller {
		@RequestMapping(value = "/Used")
		public ModelAndView Used(@RequestParam HashMap<String, String> params,
				HttpSession session, ModelAndView mav) throws Throwable{
		
		mav.setViewName("siteplan/Used");
			
		return mav;
	}
}
