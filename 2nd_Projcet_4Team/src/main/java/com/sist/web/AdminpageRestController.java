package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.MailSender.MailSender;
import com.sist.dao.StudyRoomAskDAO;
import com.sist.service.AdminpageService;
import com.sist.service.MemberService;
import com.sist.service.StudyRoomService;
import com.sist.vo.MemberVO;
import com.sist.vo.StudyRoomAskVO;
import com.sist.vo.StudyRoomReserveVO;

@RestController
@RequestMapping("adminpage/")
public class AdminpageRestController {
	@Autowired
	private AdminpageService service;
	@Autowired
	private StudyRoomService sService;
	@Autowired
	private MemberService memberService;
	@Autowired MailSender ms;
	//스터디룸 문의 내역
	@GetMapping(value="admin_ask_vue.do",produces="text/plain;charset=UTF-8")
	public String admin_ask(int page) throws Exception
	{
		int rowsize=7;
		int start=(rowsize*page)-(rowsize-1);
		int end=rowsize*page;
		final int BLOCK=5;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<StudyRoomAskVO> list=service.AdminRoomAskList(map);
		int totalpage=service.AdminRoomAskTotalpage();
		int startpage=((page-1)/BLOCK*BLOCK)+1;
		int endpage=((page-1)/BLOCK*BLOCK)+BLOCK;
		if(endpage>totalpage)
			endpage=totalpage;
		int totalCount=service.AdminRoomAskCount();
		Map map1=new HashMap();
		map1.put("curpage", page);
		map1.put("endpage", endpage);
		map1.put("startpage",startpage);
		map1.put("totalpage",totalpage);
		map1.put("list", list);
		map1.put("totalCount", totalCount);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(map1);
		return json;
	}
	
    @GetMapping(value="admin_ask_return.do",produces="text/plain;charset=UTF-8")
	public String admin_ask_return(int ano) throws Exception
	{
    	StudyRoomAskVO vo=sService.StudyRoomAskDetail(ano);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(vo);
		return json;
	}
    @PostMapping(value="ask_return_ok.do",produces="text/plain;charset=UTF-8")
	public String ask_return_ok(int ano,int group_id,String content,HttpSession session) throws Exception
	{
		String result="no";
		try {
			StudyRoomAskVO vo=sService.StudyRoomAskDetail(ano);
	    	StudyRoomAskVO revo=new StudyRoomAskVO();
	    	revo.setAno(ano);
	    	revo.setSno(vo.getSno());
	    	revo.setContent(content);
	    	revo.setCate(vo.getCate());
	    	revo.setGroup_id(group_id);
	    	revo.setUserId((String)session.getAttribute("userId"));
	    	service.StudyRoomAskReturnInsert(revo);
	    	ms.ASKReturnMailSend(ano);
	    	result="ok";
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
    
    //스터디룸 예약
  	@GetMapping(value="admin_room_vue.do",produces="text/plain;charset=UTF-8")
  	public String admin_room_vue(int page) throws Exception
  	{
  		int rowsize=7;
  		int start=(rowsize*page)-(rowsize-1);
  		int end=rowsize*page;
  		final int BLOCK=5;
  		Map map=new HashMap();
  		map.put("start", start);
  		map.put("end", end);
  		List<StudyRoomReserveVO> list=service.StudyRoomReserveAllList(map);
  		int totalpage=service.StudyRoomReserveAllTotalpage(map);
  		int startpage=((page-1)/BLOCK*BLOCK)+1;
  		int endpage=((page-1)/BLOCK*BLOCK)+BLOCK;
  		if(endpage>totalpage)
  			endpage=totalpage;
  		int totalCount=service.StudyRoomReserveAllTotalCount();
  		Map map1=new HashMap();
  		map1.put("curpage", page);
  		map1.put("endpage", endpage);
  		map1.put("startpage",startpage);
  		map1.put("totalpage",totalpage);
  		map1.put("list", list);
  		map1.put("totalCount", totalCount);
  		ObjectMapper mapper = new ObjectMapper();
  		String json = mapper.writeValueAsString(map1);
  		return json;
  	}
  	
  	@GetMapping(value="admin_room_info.do",produces="text/plain;charset=UTF-8")
  	public String admin_room_info(int no,String userId) throws Exception
  	{
  		StudyRoomReserveVO rvo=service.StudyRoomReserveData(no);
  		MemberVO mvo=memberService.getMemberByID(userId);
  		Map map=new HashMap();
  		map.put("rvo", rvo);
  		map.put("mvo", mvo);
  		ObjectMapper mapper = new ObjectMapper();
  		String json = mapper.writeValueAsString(map);
  		return json;
  	}
    
}
