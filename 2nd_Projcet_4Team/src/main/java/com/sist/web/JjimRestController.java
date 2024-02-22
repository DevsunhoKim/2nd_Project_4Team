package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.service.JjimSerive;
import com.sist.vo.JjimVO;

@RestController
public class JjimRestController {
	@Autowired
	private JjimSerive service;
	
	@GetMapping(value="jjim/jjim_vue.do",produces="text/plain;charset=UTF-8")
	public int jjim_count(String userId,int no,int cateno) {
		JjimVO vo=new JjimVO();
		vo.setUserId(userId);
		vo.setCateno(cateno);
		vo.setNo(no);
		int count=service.jjimCount(vo);
		return count;
	}
	@GetMapping(value="jjim/jjim_ok.do",produces="text/plain;charset=UTF-8")
	public int jjim_ok(String userId,int no,int cateno) {
		JjimVO vo=new JjimVO();
		vo.setUserId(userId);
		vo.setCateno(cateno);
		vo.setNo(no);
		service.jjimInsert(vo);
		int count=service.jjimCount(vo);
		System.out.println(count);
		return count;
		
	}
	@GetMapping(value="jjim/jjim_delete.do",produces="text/plain;charset=UTF-8")
	public int jjim_delete(String userId,int no,int cateno) {
		JjimVO vo=new JjimVO();
		vo.setUserId(userId);
		vo.setCateno(cateno);
		vo.setNo(no);
		service.jjimDelete(vo);
		int count=service.jjimCount(vo);
		return count;
	}
}
