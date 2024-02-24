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

// Spring MVC의 @RestController 어노테이션을 사용하여 RESTful API를 제공
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
	
	// 검색
	@GetMapping(value="recruit_find_vue.do", produces = "text/plain;charset=UTF-8")
	public String recruit_find_vue(String word) throws Exception {
		List<RecruitVO> list=rService.recruitFindData(word);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);

		return json;
	}

	// 채용 공고 상세 페이지
	// recruitment/recruit_detail_vue.do URL에 대한 GET 요청이 들어올 때, recruit_detail_vue 메서드 실행
	@GetMapping(value="recruit_detail_vue.do", produces="text/plain;charset=UTF-8")
	public String recruit_detail_vue(int rno, int cno) throws Exception {
	// RecruitmentService를 통해 채용 공고 정보와 기업 정보를 가져옴
		RecruitVO rvo=rService.recuitDetailData(rno);
		CompanyVO cvo=rService.companyDetailData(cno);

		Map map=new HashMap();
		map.put("rvo", rvo);
		map.put("cvo", cvo);
<<<<<<< HEAD
		// Map 객체는 Java에서 키-값 쌍을 저장하는 데 사용되는 인터페이스로 Map에 rno와 cno를 담아 JSON 형태로 응답
=======

>>>>>>> branch 'master' of https://github.com/DevsunhoKim/2nd_Project_4Team.git
		ObjectMapper mapper=new ObjectMapper();
	  String json=mapper.writeValueAsString(map);

	  return json;
	}

	// 기업 정보 상세 페이지
	// recruitment/company_detail_vue.do URL에 대한 GET 요청이 들어올 때, company_detail_vue 메서드 실행
	@GetMapping(value="company_detail_vue.do", produces="text/plain;charset=UTF-8")
	public String company_detail_vue(int rno, int cno) throws Exception {
	// RecruitmentService를 통해 채용 공고 정보와 기업 정보를 가져옴
		RecruitVO rvo=rService.recuitDetailData(rno);
		CompanyVO cvo=rService.companyDetailData(cno);
<<<<<<< HEAD
		
		// 특정 기업(cno)의 특정 채용 공고(rno) => 여러 개의 채용 정보가 담긴 리스트를 가져오는 메서드
=======

>>>>>>> branch 'master' of https://github.com/DevsunhoKim/2nd_Project_4Team.git
		List<RecruitVO> recruits=rService.recruitListData(rno, cno);

		Map map=new HashMap();
		map.put("rvo", rvo);
		map.put("cvo", cvo);
<<<<<<< HEAD
		// Map 객체는 Java에서 키-값 쌍을 저장하는 데 사용되는 인터페이스로 Map에 rno와 cno를 담아 JSON 형태로 응답
=======

>>>>>>> branch 'master' of https://github.com/DevsunhoKim/2nd_Project_4Team.git
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(map);

		return json;
	}
<<<<<<< HEAD
	
	// 채용 공고 추가
=======

>>>>>>> branch 'master' of https://github.com/DevsunhoKim/2nd_Project_4Team.git
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
<<<<<<< HEAD
	
	// 채용 공고 수정
=======

>>>>>>> branch 'master' of https://github.com/DevsunhoKim/2nd_Project_4Team.git
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
