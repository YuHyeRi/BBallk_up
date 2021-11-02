package com.gdj37.bballkup.web.login.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import com.gdj37.bballkup.util.Utils;
import com.gdj37.bballkup.web.login.service.ILoginService;
import com.gdj37.bballkup.web.teamAdd.service.ITeamAddService;

@Controller
public class loginController {

	@Autowired
	public ILoginService iLoginService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@Autowired
	public ITeamAddService iTeamAddService;
	
	@RequestMapping(value = "/login")
	public ModelAndView login(HttpServletRequest req, HttpSession session, ModelAndView mav) {
		
		mav.setViewName("login/login");
		return mav;
	}
	
	@SuppressWarnings("unused")
	@RequestMapping(value = "/logins")
	public ModelAndView logins(
			@RequestParam HashMap<String, String> params,
			HttpSession session,
			ModelAndView mav
			) throws Throwable {
		
		//비밀번호 암호화
		String mem_pw = Utils.encryptAES128(params.get("mem_pw"));
		params.put("mem_pw", mem_pw);
		
		HashMap<String, String> data = iLoginService.getLogin(params);
		
		int result = 0;
		String nm = "";
		
		if(data != null) {//id, pw 일치할때
			nm = String.valueOf(data.get("MEM_NO"));
			params.put("mem_no", nm);
			
			int teamChk = iTeamAddService.teamChk(params); //팀장여부 확인
			System.out.println("팀 체크 : "+teamChk);
			
			if(teamChk > 0) { 
				  result = 1;
			  }else {
				  result = 0;
			  }
			
			System.out.println("결과 : "+result);
			
			String delYn = String.valueOf(data.get("MEM_DEL"));
			
			if(delYn.equals("1")) {
				session.setAttribute("sMNo", data.get("MEM_NO"));
				session.setAttribute("sMId", data.get("MEM_ID"));
				session.setAttribute("sMNm", data.get("MEM_NM"));
				session.setAttribute("sMLv", data.get("LEVEL_NO"));
				session.setAttribute("sTCnt", result);
				//getAttribute("키") : 세션에서 해당 키와 값을 넣는다
				System.out.println("m_no : "+session.getAttribute("sMNo"));
				System.out.println("m_id : "+session.getAttribute("sMId"));
				System.out.println("m_nm : "+session.getAttribute("sMNm"));
				System.out.println("m_lv : "+session.getAttribute("sMLv"));
				
				mav.addObject("result", result);
				mav.setViewName("redirect:Main"); 
				
			}else {
				mav.addObject("msg", "탈퇴한 회원입니다.");
				mav.setViewName("login/failedAction");
			}
		}else {
			mav.addObject("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			mav.setViewName("login/failedAction");
		}
		
		return mav;
	}

	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		
		session.invalidate();//session 정보 초기화
		
		mav.setViewName("redirect:Main");
		
		return mav;
	}
	//아이디찾기이동
	@RequestMapping(value = "/findId")
	public ModelAndView findId(HttpSession session, ModelAndView mav) {
		
		mav.setViewName("login/findId");
		
		return mav;
	}
	//비밀번호찾기이동
	@RequestMapping(value = "/findPw")
	public ModelAndView findPw(HttpSession session, ModelAndView mav) {
		
		mav.setViewName("login/findPw");
		
		return mav;
	}
	@RequestMapping(value = "/join")
	public ModelAndView join(HttpServletRequest req, HttpSession session, ModelAndView mav) {
		
		mav.setViewName("login/join");

		return mav;
	}
	
	@RequestMapping(value = "/memCntCheckAjax" , method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String memCntCheckAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iLoginService.getMemIdCheck(params);
		
		modelMap.put("cnt", cnt);
		
		return mapper.writeValueAsString(modelMap);
	}
	//비밀번호 재확인 이동
		@RequestMapping(value = "/pwCheckGo")
		public ModelAndView pwCheckGo(HttpSession session, ModelAndView mav) throws Throwable {
			
			mav.setViewName("login/pwCheck");
			
			return mav;
		}
		//비밀번호 재확인
		@RequestMapping(value = "/memPwCheckAjax" , method = RequestMethod.POST, 
				produces = "text/json;charset=UTF-8")
		@ResponseBody 
		public String memPwCheckAjax(@RequestParam HashMap<String, String> params) throws Throwable{
			
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			HashMap<String, String> data = iLoginService.getMem(params);
			String mem_pw = Utils.decryptAES128(data.get("MEM_PW")); 
			data.put("MEM_PW", mem_pw);
			
			modelMap.put("data", data);
			
			return mapper.writeValueAsString(modelMap);
		}
	@RequestMapping(value = "/memCUDAjax" , method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String memCUDAjax(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable{
		

		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		String result = "success";
		
		try {
			int cnt = 0;
			
			//CUD처리
			switch (params.get("gbn")) {
				case "c":
					//비번 암호화
					params.put("mem_pw", Utils.encryptAES128(params.get("mem_pw")));
					cnt = iLoginService.joinMem(params);
					break;
				case "u":
					cnt = iLoginService.updateMem(params);
					break;
				case "pu":
					//비번 암호화
					params.put("mem_pw", Utils.encryptAES128(params.get("mem_pw")));
					cnt = iLoginService.pwUpdateMem(params);
					break;
				case "d":
					cnt = iLoginService.deleteMem(params);
					session.invalidate();//session 정보 초기화
					break;

			}
			
			if(cnt == 0) {
				result = "feiled";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
			result = "error";
		}
		
		modelMap.put("result", result);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/memUpdate")
	public ModelAndView memUpdate(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav
			) throws Throwable {
		
		HashMap<String, String> data = iLoginService.getMem(params);

		if(params.get("gbn").equals("u")) {
			mav.setViewName("login/mem_update");
		}else {
			mav.setViewName("login/mem_PWUpdate");
		}
		
		mav.addObject("data", data);
		
		return mav;
	}

	//아이디찾기
	@RequestMapping(value = "/memFindIdAjax" , method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String memFindIdAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iLoginService.getMemFindIdCnt(params);
		HashMap<String, String> data = iLoginService.getMemFindId(params);
		
		modelMap.put("cnt", cnt);
		modelMap.put("data", data);
		
		return mapper.writeValueAsString(modelMap);
	}
	//비밀번호 찾기 아이디, 이름 조회
	@RequestMapping(value = "/memPWCntCheckAjax" , method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String memPWCntCheckAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iLoginService.getMemIdCntCheck(params);
		
		modelMap.put("cnt", cnt);
		
		return mapper.writeValueAsString(modelMap);
	}
	//아이디, 이름, 질문, 답변 조회
	@RequestMapping(value = "/memPWAllCheckAjax" , method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String memPWAllCheckAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iLoginService.getMemNoCntCheck(params);
		HashMap<String, String> data = iLoginService.getMemPwAllCheck(params);
		if(cnt > 0) {
			modelMap.put("cnt", cnt);
		}else {
			modelMap.put("cnt", 0);
		}
		modelMap.put("data", data);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//내가 쓴 게시글 이동
	@RequestMapping(value = "/myBoardList")
	public ModelAndView myBoardList(
			@RequestParam HashMap<String, String> params,ModelAndView mav) {
		
		String page = "1";
		
		if(params.get("page") != null) {
			
			page = params.get("page");
		}
		
		mav.addObject("page", page);
		
		mav.setViewName("login/myBoardList");
		
		return mav;
	}
	
	//내가 쓴 게시글 리스트
	@RequestMapping(value = "/myBoardListAjax" , method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String myBoardListAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();	//jackson객체
		
		Map<String, Object> modelMap = new HashMap<String, Object>(); //데이터를 담을 맵
		
		//페이지 취득
		int page = Integer.parseInt(params.get("page"));
		
		//개수 취득
		int cnt = iLoginService.getAllBoardCnt(params);
		//페이징 정보 취득
		PagingBean pb = iPagingService.getPagingBean(page, cnt, 10, 10);
		//데이터 시작, 종료값 할당
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		//리스트 조회
		List<HashMap<String, String>> list = iLoginService.getAllBoardList(params);
		
		//데이터 담기
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		//데이터를 문자열화
		return mapper.writeValueAsString(modelMap);
		
	}
}