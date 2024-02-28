package com.sist.web;

import java.util.*;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.MypageService;
import com.sist.vo.*;

@RestController
@RequestMapping("mypage/")
public class MypageRestController {
	private MypageService service;
	private ObjectMapper objectMapper;

    @Autowired
    public MypageRestController(MypageService service) {
    	this.service = service;
    	objectMapper = new ObjectMapper();
    }
    
    @GetMapping(value = "init_vue.do", produces = "text/plain;charset=UTF-8")
	public String member_init(HttpSession session) throws JsonProcessingException {
		String userId=(String) session.getAttribute("userId");
		MemberVO json = service.getMemberByID(userId);
		return objectMapper.writeValueAsString(json);
	}
    
    @PostMapping("ckpwd_vue.do")
	public String member_pwdCk(HttpSession session,String pwd) {
    	String userId=(String) session.getAttribute("userId");
		String res = service.pwdCk(userId,pwd);
		return res;
	}
    
    @PostMapping("member_withdraw_vue.do")
	public String member_withdraw(HttpSession session,String pwd) {
    	String userId=(String) session.getAttribute("userId");
		String res = service.member_withdraw(userId,pwd);
		if(res == "YES") {
			session.invalidate();
		}
		return res;
	}
    
    @GetMapping(value = "mentor_MyReserve_vue.do", produces = "text/plain;charset=UTF-8")
	public String mentor_myReserve(HttpSession session) throws JsonProcessingException {
		String userId=(String) session.getAttribute("userId");
		List<MentorReserveVO> json = service.getAllMyMentorRev(userId);
		return objectMapper.writeValueAsString(json);
	}
    
}
