package com.gdj37.bballkup.web.t_board.controller;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class T_boardController {
	
	@RequestMapping(value = "/T_board")
	public ModelAndView T_board(@RequestParam  HashMap<String, String> params,
								ModelAndView mav) {
			
			mav.setViewName("t_board/T_board");
		
			return mav;
		}
}
