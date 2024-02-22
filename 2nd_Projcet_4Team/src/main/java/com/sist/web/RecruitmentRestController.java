package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	private RecruitmentService rService;

	// 목록 출력
	@GetMapping(value="recruit_list_vue.do", produces="text/plain;charset=UTF-8")
	public String recruit_list_vue(int page) throws Exception {
		int rowSize=12;
		int start=(rowSize*page)-(rowSize-1);
		int end=rowSize*page;

		List<RecruitVO> list=rService.recruitListData(start, end);
		
		for (RecruitVO area : list) {
		    String[] addressParts = area.getCvo().getAddress().split(" ", 2);
		    if (addressParts.length == 2) {
		    	area.getCvo().setAddress(addressParts[1]); // 두 번째 공백 이후의 부분을 address로 설정
		    }
		}
		
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
		int totalpage=rService.recruitTotalPage();
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
	public String recruit_detail_vue(int rno, int cno) throws Exception {
		RecruitVO rvo=rService.recuitDetailData(rno);
		CompanyVO cvo=rService.companyDetailData(cno);

		Map map=new HashMap();
		map.put("rvo", rvo);
		map.put("cvo", cvo);
		
		ObjectMapper mapper=new ObjectMapper();
	  String json=mapper.writeValueAsString(map);

	  return json;
	}

	// 기업 정보 상세 페이지
	@GetMapping(value="company_detail_vue.do", produces="text/plain;charset=UTF-8")
	public String company_detail_vue(int rno, int cno) throws Exception {
		RecruitVO rvo=rService.recuitDetailData(rno);
		CompanyVO cvo=rService.companyDetailData(cno);
		
		List<RecruitVO> recruits=rService.recruitListData(rno, cno);

		Map map=new HashMap();
		map.put("rvo", rvo);
		map.put("cvo", cvo);
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(map);

		return json;
	}
	
	@PostMapping(value="recruit_insert_vue.do", produces="text/plain;charset=UTF-8")
	public String recruit_insert_vue(RecruitVO vo) throws Exception {
		String result="";
		try {
			rService.recruitInsert(vo);
			result="yes";
		} catch(Exception ex) {
			result=ex.getMessage();
		}
		return result;
	}
	
	@GetMapping(value="recruit_update_vue.do", produces="text/plain;charset=UTF-8")
	public String recruit_update_vue(RecruitVO vo) throws Exception {
//		rService.recruitUpdate(vo);
//		
//		ObjectMapper mapper=new ObjectMapper();
//		String json=mapper.writeValueAsString(vo);
//		return json;
		String result="";
		try {
			rService.recruitUpdate(vo);
			result="yes";
		} catch(Exception ex) {
			result=ex.getMessage();
		}
		return result;
	}
	
	@GetMapping(value="recruit_delete_vue.do", produces="text/plain;charset=UTF-8")
	public String recruit_delete_vue(int rno) {
		String result="";
	   	try {
			rService.recruitDelete(rno);
			result="yes";
		} catch(Exception ex) {
			result=ex.getMessage();
		}
		return result;
   }
}
