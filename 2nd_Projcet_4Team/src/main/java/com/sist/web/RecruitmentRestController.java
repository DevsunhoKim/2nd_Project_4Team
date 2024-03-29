package com.sist.web;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.JjimService;
import com.sist.service.MemberService;
import com.sist.service.RecruitmentService;
import com.sist.vo.ApplyVO;
import com.sist.vo.CompanyVO;
import com.sist.vo.InterviewVO;
import com.sist.vo.JjimVO;
import com.sist.vo.MemberVO;
import com.sist.vo.RecruitVO;

// Spring MVC의 @RestController 어노테이션을 사용하여 RESTful API를 제공
@RestController
@RequestMapping("recruitment/") // recruitment를 밖으로 빼냄
public class RecruitmentRestController {
	@Autowired
	private RecruitmentService rService;
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private JjimService jService;

	// 채용 공고 목록 출력
	@GetMapping(value="recruit_list_vue.do", produces="text/plain;charset=UTF-8")
	public String recruit_list_vue(@RequestParam("page") int page, Model model, @RequestParam("start") String startStr, @RequestParam("end") String endStr, @RequestParam("sortBy") String sortBy,HttpSession session) throws Exception {
		int rowSize=12;
		
		int start = Integer.parseInt(startStr);
        int end = Integer.parseInt(endStr);
    
		start=(rowSize*page)-(rowSize-1);
		end=rowSize*page;
		String userId=(String)session.getAttribute("userId");
		/* List<RecruitVO> list=rService.recruitListData(start, end); */
		List<RecruitVO> recruit_list=rService.recruitSortListData(start, end, sortBy);
		for(RecruitVO vo:recruit_list)
		{
			JjimVO jvo=new JjimVO();
			jvo.setCateno(4);
			jvo.setNo(vo.getCno());
			if(userId==null)
				userId="";
			jvo.setUserId(userId);
			int count=jService.jjimCount(jvo);
			if(count>0)
			{
				vo.setLikeState(true);
			}
			else {
				vo.setLikeState(false);
			}
			
		}
    model.addAttribute("recruit_list", recruit_list);
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(recruit_list);

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
	public String recruit_detail_vue(int rno, int cno, HttpSession session) throws Exception {
	// RecruitmentService를 통해 채용 공고 정보와 기업 정보를 가져옴
		RecruitVO rvo=rService.recuitDetailData(rno);
		CompanyVO cvo=rService.companyDetailData(cno);
		String userId=(String)session.getAttribute("userId");
		Map map=new HashMap();
		map.put("rvo", rvo);
		map.put("cvo", cvo);
		map.put("sessionId", userId);
		map.put("mvo", "NOMVO");
		if(userId!=null) {
			MemberVO mvo=mService.getMemberByID(userId);
			map.put("mvo", mvo);
		}
		// Map 객체는 Java에서 키-값 쌍을 저장하는 데 사용되는 인터페이스로 Map에 rno와 cno를 담아 JSON 형태로 응답
		
		ObjectMapper mapper=new ObjectMapper();
	  String json=mapper.writeValueAsString(map);

	  return json;
	}
	
	// 기업 정보 상세보기
	// recruitment/company_detail_vue.do URL에 대한 GET 요청이 들어올 때, company_detail_vue 메서드 실행
	@GetMapping(value="company_detail_vue.do", produces="text/plain;charset=UTF-8")
	public String company_detail_vue(int cno, HttpSession session) throws Exception {
		// RecruitmentService를 통해 채용 공고 정보와 기업 정보를 가져옴
		CompanyVO cvo=rService.companyDetailData(cno);
		List<RecruitVO> rList=rService.companyRecruitListData(cno);
		List<InterviewVO> iList=rService.interviewListData(cno);
		String userId=(String)session.getAttribute("userId");
		
		Map map=new HashMap();
		map.put("cvo", cvo);
		map.put("recruit_list", rList);
		map.put("interview_list", iList);
		map.put("sessionId", userId);
		map.put("mvo", "NOMVO");
		if(userId!=null) {
			MemberVO mvo=mService.getMemberByID(userId);
			map.put("mvo", mvo);
		}
		// Map 객체는 Java에서 키-값 쌍을 저장하는 데 사용되는 인터페이스로 Map에 rno와 cno를 담아 JSON 형태로 응답
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(map);

		return json;
	}
	
//	// 채용 공고 추가
//	@PostMapping(value="recruit_insert_vue.do", produces="text/plain;charset=UTF-8")
//	public String recruit_insert_vue(RecruitVO vo, Principal p) throws Exception {
//		String userId=p.getName();
//		MemberVO mvo=rService.memberInfoData(userId);
//		String userName=mvo.getUserName();
////		vo.setUserId(userId);
////		vo.setUserName(userName);
//		
//		String result="";
//		try {
//			rService.recruitInsert(vo);
//			result="yes";
//		} catch(Exception ex) {
//			result=ex.getMessage();
//		}
//		return result;
//	}
//	
//	// 채용 공고 수정
//	@PostMapping(value="recruit_update_vue.do", produces="text/plain;charset=UTF-8")
//	public String recruit_update_vue(RecruitVO vo) throws Exception {
////		rService.recruitUpdate(vo);
////
////		ObjectMapper mapper=new ObjectMapper();
////		String json=mapper.writeValueAsString(vo);
////		return json;
//		String result="";
//		try {
//			rService.recruitUpdate(vo);
//			result="yes";
//		} catch(Exception ex) {
//			result=ex.getMessage();
//		}
//		return result;
//	}
//
//	// 채용 공고 삭제
//	@GetMapping(value="recruit_delete_vue.do", produces="text/plain;charset=UTF-8")
//	public String recruit_delete_vue(int rno) {
//		String result="";
//	   	try {
//			rService.recruitDelete(rno);
//			result="yes";
//		} catch(Exception ex) {
//			result=ex.getMessage();
//		}
//		return result;
//   }


	
//	// 기업 정보 추가
//	@PostMapping(value="company_insert_vue.do", produces="text/plain;charset=UTF-8")
//  public String company_insert_vue(CompanyVO vo) {
//	  String result="";
//	  try{
//		  rService.companyInsert(vo);
//		  result="yes";
//	  } catch(Exception ex) {
//		  result=ex.getMessage();
//	  }
//	  return result;
//  }
//	// 기업 정보 수정
//	@PostMapping(value="company_update_vue.do", produces="text/plain;charset=UTF-8")
//  public String company_update(CompanyVO vo, int cno) throws Exception {
//		CompanyVO cvo=rService.companyUpdate(cno);
//	   
//	  ObjectMapper mapper=new ObjectMapper();
//	  String json=mapper.writeValueAsString(vo);
//	   
//	  return json;
//  }
	// 기업 정보 삭제
//	@GetMapping(value="company_delete_vue.do", produces="text/plain;charset=UTF-8")
//  public String company_delete(int cno) throws Exception {
//	   rService.companyDelete(cno);
//	   ObjectMapper mapper=new ObjectMapper();
//		 String json=mapper.writeValueAsString(vo);
//		   
//		 return json;
//  }
	
	// 지원하기
	@PostMapping(value="apply_insert_vue.do", produces="text/plain;charset=UTF-8")
  public String apply_insert_vue(int cno, String filename, @RequestParam("file") MultipartFile file, HttpSession session, HttpServletRequest request) {
	  ApplyVO vo=new ApplyVO();
    vo.setCno(cno);
    String userId = (String)session.getAttribute("userId");
    vo.setUserId(userId);
    vo.setFilename(filename);
		/* vo.setFilesize(filesize); */
    String result="";
    try {
      // 파일 업로드를 위한 디렉토리 경로 설정
      String path=request.getSession().getServletContext().getRealPath("/")+"upload\\";
      path=path.replace("\\", File.separator);// 운영체제의 호환 
      // Hosting => AWS(리눅스)
  
      File dir=new File(path); 
      // 디렉토리 생성
      if(!dir.exists()) { // 첨부 파일 존재 확인
      	dir.mkdir();
      }
   
      // 파일 업로드
      if (!file.isEmpty()) { // 첨부 파일 존재 확인 후 업로드
      	String originalFilename=file.getOriginalFilename();
      	File uploadFile=new File(path+originalFilename);
      	file.transferTo(uploadFile);
      }
  
      // 파일 정보를 vo에 저장하고 DB에 삽입
      vo.setFilename(file.getOriginalFilename());
      vo.setFilesize(String.valueOf(file.getSize()));
   
      rService.applyInsert(vo);
   
      result="yes";
   
    } catch(Exception ex) {
    	result=ex.getMessage();   
    }
    	return result;
  }
	
	
	
//	public String commonsInterviewData(int cno) throws Exception {
//    ObjectMapper mapper=new ObjectMapper();
//    List<InterviewVO> list=rService.interviewListData(cno);
//    String json=mapper.writeValueAsString(list);
//    return json;
//  }
	
	// 면접 후기 작성
	@PostMapping(value="interview_insert_vue.do", produces="text/plain;charset=UTF-8")
  public String interview_insert_vue(int cno, @RequestParam String title, @RequestParam String career, @RequestParam String score, @RequestParam String ilevel, @RequestParam String result, @RequestParam String content, HttpSession session) throws Exception {
		String userId=(String)session.getAttribute("userId"); // 세션에서 사용자 정보 가져오기
		
		// 면접 후기 데이터를 InterviewVO 객체에 담기
		InterviewVO vo=new InterviewVO();
    vo.setCno(cno);
    vo.setUserId(userId);
    vo.setTitle(title);
    vo.setCareer(career);
    vo.setScore(score);
    vo.setIlevel(ilevel);
    vo.setResult(result);
    vo.setContent(content);
    
    rService.interviewInsert(vo);
    
    ObjectMapper mapper=new ObjectMapper();
    List<InterviewVO> list=rService.interviewListData(cno); // 기업의 모든 면접 후기 리스트 가져오기
    String json=mapper.writeValueAsString(list);
    return json;
	}
	
	// 면접 후기 수정
	@PostMapping(value="interview_update_vue.do", produces="text/plain;charset=UTF-8")
	public String interview_update_vue(InterviewVO vo, int cno) throws Exception {
		rService.interviewUpdate(vo);
		
		ObjectMapper mapper=new ObjectMapper();
    List<InterviewVO> list=rService.interviewListData(cno); // 기업의 모든 면접 후기 리스트 가져오기
    String json=mapper.writeValueAsString(list);
    return json;
	}
	
	// 면접 후기 삭제
	@GetMapping(value="interview_delete_vue.do", produces="text/plain;charset=UTF-8")
	public String interview_delete_vue(int ino, int cno, String userId) throws Exception {
		rService.interviewDelete(ino, userId);
		
		ObjectMapper mapper=new ObjectMapper();
    List<InterviewVO> list=rService.interviewListData(cno); // 기업의 모든 면접 후기 리스트 가져오기
    String json=mapper.writeValueAsString(list);
    return json;
	}
	
}
