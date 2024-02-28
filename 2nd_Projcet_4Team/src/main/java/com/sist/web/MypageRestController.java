package com.sist.web;

import java.util.*;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
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
    public String mentor_myReserve(int page,HttpSession session,Model model) throws JsonProcessingException {
       String userId=(String) session.getAttribute("userId");
       Map json = service.getAllMyMentorRev(userId,page);
       return objectMapper.writeValueAsString(json);
    }
     
	public String admin_ask(int page,String userId) throws Exception
	{
		int rowsize=7;
		int start=(rowsize*page)-(rowsize-1);
		int end=rowsize*page;
		final int BLOCK=5;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("userId", userId);
		List<StudyRoomReserveVO> list=service.myStudyRoomReserveList(map);
		int totalpage=service.myStudyRoomReserveTotalpage(map);
		int startpage=((page-1)/BLOCK*BLOCK)+1;
		int endpage=((page-1)/BLOCK*BLOCK)+BLOCK;
		if(endpage>totalpage)
			endpage=totalpage;
		Map map1=new HashMap();
		map1.put("curpage", page);
		map1.put("endpage", endpage);
		map1.put("startpage",startpage);
		map1.put("totalpage",totalpage);
		map1.put("list", list);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(map1);
		return json;
	}

    	@GetMapping(value="jjim_vue.do",produces="text/plain;charset=UTF-8")
	public String jjim(int cateno,String userId) throws Exception
	{

		List<StudyRoomVO> list=service.studyRoomJjim(userId);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
    
    
}
