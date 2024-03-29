package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.service.JjimService;
import com.sist.vo.JjimVO;

@RestController
@RequestMapping("jjim/")
public class JjimRestController {
	@Autowired
	private JjimService service;

	@GetMapping("jjim_vue.do")
	public int jjim_count(String userId,int no,int cateno) {
		JjimVO vo=new JjimVO();
		vo.setUserId(userId);
		vo.setCateno(cateno);
		vo.setNo(no);
		System.out.println(userId);
		int count=service.jjimCount(vo);
		return count;
	}

	@GetMapping("jjim_ok.do")
	public int jjim_ok(String userId,int no,int cateno) {
		JjimVO vo=new JjimVO();
		vo.setUserId(userId);
		vo.setCateno(cateno);
		vo.setNo(no);
		if(cateno==2)
		{
			service.jjimInsert(vo);
		}
		else if(cateno==1)
		{
			service.MentorjjimInsert(vo);
		}
		else if(cateno==4)
		{
			service.companyjimInsert(vo);
		}
		int count=service.jjimCount(vo);
		System.out.println(count);
		return count;

	}
	@GetMapping("jjim_delete.do")
	public int jjim_delete(String userId,int no,int cateno) {
		JjimVO vo=new JjimVO();
		vo.setUserId(userId);
		vo.setCateno(cateno);
		vo.setNo(no);
		if(cateno==2)
		{
			service.jjimDelete(vo);
		}
		if(cateno==1)
		{
			service.MentorjjimDelete(vo);
		}
		if(cateno==4)
		{
			service.companyjjimDelete(vo);
		}
		int count=service.jjimCount(vo);
		return count;
	}
}
