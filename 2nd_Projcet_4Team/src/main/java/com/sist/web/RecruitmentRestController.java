package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.RecruitmentService;
import com.sist.vo.CompanyVO;
import com.sist.vo.RecruitVO;

@RestController
@RequestMapping("recruitment/") // recruitment를 밖으로 빼냄
public class RecruitmentRestController {
	@Autowired
	private RecruitmentService service;
	
	// 목록 출력
	@GetMapping(value="recruit_list_vue.do", produces="text/plain;charset=UTF-8")
	public String recruit_list_vue(int page) throws Exception {
		int rowSize=12;
		int start=(rowSize*page)-(rowSize-1);
		int end=rowSize*page;
		
		List<RecruitVO> list=service.recruitListData(start, end);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		
		return json;
	}
	
	// 페이지
	@GetMapping(value="recruit_page_vue.do", produces="text/plain;charset=UTF-8")
	public String recruit_page_vue(int page) throws Exception {
		final int BLOCK=10;
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		int totalpage=service.recruitTotalPage();
		if(endPage>totalpage) {
			endPage=totalpage;
		}
		Map map=new HashMap();   
		map.put("curpage", page);
		map.put("totalpage", totalpage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
   
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(map);
		
		return json;
	}
	
	// 채용 공고 상세 페이지
	@GetMapping(value="recruit_detail_vue.do", produces="text/plain;charset=UTF-8")
	public String recruit_detail_vue(int no, int cno) throws Exception {
		RecruitVO rvo=service.recuitDetailData(no);
		CompanyVO cvo=service.companyDetailData(cno);
		
		Map map=new HashMap();
		map.put("rvo", rvo);
		map.put("cvo", cvo);
		ObjectMapper mapper=new ObjectMapper();
	  String json=mapper.writeValueAsString(map);
	   
	  return json;
	}
}
