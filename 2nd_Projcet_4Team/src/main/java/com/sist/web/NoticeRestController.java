package com.sist.web;

import java.util.*;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.NoticeService;
import com.sist.vo.NoticeVO;


@RestController
@RequestMapping("notice/")
public class NoticeRestController {
	private NoticeService service;
	private ObjectMapper objectMapper;

    @Autowired
    public NoticeRestController(NoticeService service) {
    	this.service = service;
    	objectMapper = new ObjectMapper();
    }
    
    @GetMapping(value = "list_vue.do", produces = "text/plain;charset=UTF-8")
	public String notice_list(int page) throws JsonProcessingException {
    	System.out.println(111);
		List<NoticeVO> json = service.noticeListData(page);
		return objectMapper.writeValueAsString(json);
	}
    
	@GetMapping(value="page_vue.do", produces="text/plain;charset=UTF-8")
	public String notice_page(int page) throws JsonProcessingException{
		Map json = service.noticeTotalpage(page);
		return objectMapper.writeValueAsString(json);
	}
}
