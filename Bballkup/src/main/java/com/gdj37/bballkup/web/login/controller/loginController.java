package com.gdj37.bballkup.web.login.controller;

import java.util.HashMap;
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
import com.gdj37.bballkup.util.Utils;
import com.gdj37.bballkup.web.login.service.ILoginService;

@Controller
public class loginController {

   @Autowired
   public ILoginService iLoginService;
   
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
      
      String delYn = "";
      
      if(data != null) {//id, pw 일치할때
         
         delYn = String.valueOf(data.get("MEM_DEL"));
         
         if(delYn.equals("1")) {
            session.setAttribute("sMNo", data.get("MEM_NO"));
            session.setAttribute("sMId", data.get("MEM_ID"));
            session.setAttribute("sMNm", data.get("MEM_NM"));
            session.setAttribute("sMLv", data.get("LEVEL_NO"));
            //getAttribute("키") : 세션에서 해당 키와 값을 넣는다
            System.out.println("m_no : "+session.getAttribute("sMNo"));
            System.out.println("m_id : "+session.getAttribute("sMId"));
            System.out.println("m_nm : "+session.getAttribute("sMNm"));
            System.out.println("m_lv : "+session.getAttribute("sMLv"));
            
            mav.setViewName("redirect:login");
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
      
      mav.setViewName("redirect:login");
      
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

      mav.addObject("data", data);
      
      mav.setViewName("login/mem_update");
      
      return mav;
   }
}