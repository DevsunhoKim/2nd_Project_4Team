package com.sist.web;

import java.util.*;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.MentorService;
import com.sist.vo.MentorVO;

@RestController
@RequestMapping("mentoring/")
public class MentorRestController {
	private MentorService service;
	private ObjectMapper objectMapper;

    @Autowired
    public MentorRestController(MentorService service) {
    	this.service = service;
    	objectMapper = new ObjectMapper();
    }
    
    @GetMapping(value = "list_vue.do", produces = "text/plain;charset=UTF-8")
	public String mentoring_list(int page,String selectedVal,String searchWord,String job, String filter, HttpSession session) throws JsonProcessingException {
		String userId=(String) session.getAttribute("userId");
		List<MentorVO> json = service.getMentorListBymap(page,selectedVal,searchWord,job,filter,userId);
		return objectMapper.writeValueAsString(json);
	}
    
	@GetMapping(value="page_vue.do", produces="text/plain;charset=UTF-8")
	public String mentoring_page(int page,String selectedVal,String searchWord,String job) throws JsonProcessingException{
		Map json = service.getTotalMentorPageBymap(page,selectedVal,searchWord,job);
		return objectMapper.writeValueAsString(json);
	}

	@PostMapping(value="reservation_vue.do",produces = "text/plain;charset=UTF-8")
	 public String mentor_reservation_vue(int mno, String rDate, int totalAmount, String inquiry,int str_time, int end_time,HttpSession session) {
		String userId=(String) session.getAttribute("userId");
		service.insertMentoring(mno, rDate, totalAmount, inquiry, str_time, end_time,userId);
		return "yes";
	  }
}
