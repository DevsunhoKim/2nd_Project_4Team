package com.sist.web;

import java.io.File;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.RecruitmentService;
import com.sist.vo.CompanyVO;
import com.sist.vo.InterviewVO;
import com.sist.vo.MemberVO;
import com.sist.vo.RecruitVO;

// Spring MVC의 @RestController 어노테이션을 사용하여 RESTful API를 제공
@RestController
@RequestMapping("recruitment/") // recruitment를 밖으로 빼냄
public class RecruitmentRestController {
	@Autowired
	private RecruitmentService rService;

	// 채용 공고 목록 출력
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

	// 채용 공고 목록 총 페이지
	@GetMapping(value="recruit_page_vue.do", produces="text/plain;charset=UTF-8")
	public String recruit_page_vue(int page) throws Exception {
		int totalpage=rService.recruitTotalPage();
		final int BLOCK=10;
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
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
	
	// 채용 공고 검색
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
		// Map 객체는 Java에서 키-값 쌍을 저장하는 데 사용되는 인터페이스로 Map에 rno와 cno를 담아 JSON 형태로 응답

		ObjectMapper mapper=new ObjectMapper();
	  String json=mapper.writeValueAsString(map);

	  return json;
	}
	
	// 채용 공고 추가
	@PostMapping(value="recruit_insert_vue.do", produces="text/plain;charset=UTF-8")
	public String recruit_insert_vue(RecruitVO vo, Principal p) throws Exception {
		String userId=p.getName();
		MemberVO mvo=rService.memberInfoData(userId);
		String userName=mvo.getUserName();
//		vo.setUserId(userId);
//		vo.setUserName(userName);
		
		String result="";
		try {
			rService.recruitInsert(vo);
			result="yes";
		} catch(Exception ex) {
			result=ex.getMessage();
		}
		return result;
	}
	// 채용 공고 수정
	@PostMapping(value="recruit_update_vue.do", produces="text/plain;charset=UTF-8")
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

	// 채용 공고 삭제
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
	

	// 기업 정보 상세 페이지
	// recruitment/company_detail_vue.do URL에 대한 GET 요청이 들어올 때, company_detail_vue 메서드 실행
	@GetMapping(value="company_detail_vue.do", produces="text/plain;charset=UTF-8")
	public String company_detail_vue(int cno) throws Exception {
		// RecruitmentService를 통해 채용 공고 정보와 기업 정보를 가져옴
		CompanyVO cvo=rService.companyDetailData(cno);
		
		// 특정 기업(cno)의 특정 채용 공고(rno) => 여러 개의 채용 정보가 담긴 리스트를 가져오는 메서드
		List<RecruitVO> rList=rService.recruitListData(cno, cno);
		List<InterviewVO> iList=rService.interviewListData(cno);
		
		Map map=new HashMap();
		map.put("cvo", cvo);
		map.put("recruit_list", rList);
		map.put("interview_list", iList);
		// Map 객체는 Java에서 키-값 쌍을 저장하는 데 사용되는 인터페이스로 Map에 rno와 cno를 담아 JSON 형태로 응답
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(map);

		return json;
	}
	
	// 기업 정보 추가
	@PostMapping(value="company_insert_vue.do", produces="text/plain;charset=UTF-8")
  public String company_insert_vue(CompanyVO vo) {
	  String result="";
	  try{
		  rService.companyInsert(vo);
		  result="yes";
	  } catch(Exception ex) {
		  result=ex.getMessage();
	  }
	  return result;
  }
	// 기업 정보 수정
	@PostMapping(value="company_update_vue.do", produces="text/plain;charset=UTF-8")
  public String company_update(CompanyVO vo, int cno) throws Exception {
		CompanyVO cvo=rService.companyUpdate(cno);
	   
	  ObjectMapper mapper=new ObjectMapper();
	  String json=mapper.writeValueAsString(vo);
	   
	  return json;
  }
	// 기업 정보 삭제
//	@GetMapping(value="company_delete_vue.do", produces="text/plain;charset=UTF-8")
//  public String company_delete(int cno) throws Exception {
//	   rService.companyDelete(cno);
//	   ObjectMapper mapper=new ObjectMapper();
//		 String json=mapper.writeValueAsString(vo);
//		   
//		 return json;
//  }
	
	
	// 면접 후기 작성
	@PostMapping(value="interview_insert_vue.do", produces="text/plain;charset=UTF-8")
  public String interview_insert_vue(InterviewVO vo, int ino, Principal p) throws Exception {
		String userId=p.getName();
		MemberVO mvo=rService.memberInfoData(userId);
		String userName=mvo.getUserName();
		vo.setUserId(userId);
		
		rService.interviewInsert(vo);
		
		List<InterviewVO> list=rService.interviewListData(ino);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
	   
		return json;
	}
	
	// 면접 후기 수정
	@PostMapping(value="interview_update_vue.do", produces="text/plain;charset=UTF-8")
	public String interview_update_vue(InterviewVO vo, int ino) throws Exception {
		rService.interviewUpdate(vo);
		
		List<InterviewVO> list=rService.interviewListData(ino);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
	   
		return json;
	}
	
	// 면접 후기 삭제
	@GetMapping(value="interview_delete_vue.do", produces="text/plain;charset=UTF-8")
	public String interview_delete_vue(int cno, int ino) throws Exception {
		rService.interviewDelete(ino);
		
		List<InterviewVO> list=rService.interviewListData(ino);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
	   
		return json;
	}
	
//	// 면접 후기 상세보기
//	@PostMapping(value="interview_detail_vue.do", produces="text/plain;charset=UTF-8")
//	public String interview_detail_vue(int cno, int ino) throws Exception {
//		List<InterviewVO> iList=rService.interviewListData(cno, ino);
//
//		CompanyVO cvo=rService.companyDetailData(cno);
//		InterviewVO ivo=rService.interviewDetailData(ino);
//		
//		Map map=new HashMap();
//		map.put("cvo", cvo);
//		map.put("ivo", ivo);
//		
//		ObjectMapper mapper=new ObjectMapper();
//		String json=mapper.writeValueAsString(map);
//
//		return json;
//	}
	
}
