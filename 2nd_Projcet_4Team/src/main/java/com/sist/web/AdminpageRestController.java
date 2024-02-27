package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.StudyRoomAskDAO;
import com.sist.service.AdminpageService;
import com.sist.service.StudyRoomService;
import com.sist.vo.StudyRoomAskVO;

@RestController
@RequestMapping("adminpage/")
public class AdminpageRestController {
	@Autowired
	private AdminpageService service;
	@Autowired
	private StudyRoomService sService;
	
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
}
