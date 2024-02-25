package com.sist.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.vo.InterviewVO;
import com.sist.vo.RecruitVO;
// Spring MVC의 @Controller 어노테이션을 사용하여 웹 요청을 처리
@Controller
@RequestMapping("recruitment/")
public class RecruitmentController {
	// 목록 출력
	@GetMapping("recruit_list.do")
	public String recruit_list() {
		return "recruitment/recruit_list";
	}
	
	// 상세 페이지
	// recruit_detail.do URL에 대한 GET 요청 시 recruit_detail 메서드 실행
	@GetMapping("recruit_detail.do")
	public String recruit_detail(int rno, int cno, Model model, HttpSession session) {
		// Spring MVC에서 사용되는 모델 객체에 rno와 cno 데이터를 추가하여 뷰에서 사용할 수 있음
		model.addAttribute("rno", rno);
		model.addAttribute("cno", cno);
		// recruit_detail 메서드는 recruitment/recruit_detail 뷰로 이동
		return "recruitment/recruit_detail";
	}

	// company_detail.do URL에 대한 GET 요청 시 company_detail 메서드 실행
	@GetMapping("company_detail.do")
	public String company_detail(int cno, Model model, HttpSession session) {
		// Spring MVC에서 사용되는 모델 객체에 rno와 cno 데이터를 추가하여 뷰에서 사용할 수 있음
		String userId=(String)session.getAttribute("userId");
		String sessionId="";
		if(userId==null) {
			sessionId="";
		} else {
			sessionId=userId;
		}
		model.addAttribute("sessionId", sessionId);
		model.addAttribute("cno", cno);
		// company_detail 메서드는 recruitment/company_detail 뷰로 이동
		return "recruitment/company_detail";
	}
	
	// 채용 공고 작성
	@PostMapping("recruit_insert.do")
	public String recruit_insert(RecruitVO vo) {
		return "recruitment/recruit_insert";
	}
	
	// 채용 공고 수정
	@PostMapping("recruit_update.do")
	public String recruit_update(RecruitVO vo) {
		return "recruitment/recruit_update";
	}
	
//	@GetMapping("interview_detail.do")
//	public String interview_Detail(int cno, int ino, Model model) {
//		model.addAttribute("cno", cno);
//		model.addAttribute("ino", ino);
//		return "recruitment/company_detail";
//	}
	
//	@GetMapping("interview_insert.do")
//	public String interview_insert(InterviewVO vo) {
//		return "recruitment/interview_insert";
//	}
//	
	

}
