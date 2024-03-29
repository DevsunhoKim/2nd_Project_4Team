package com.sist.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sist.service.RecruitmentService;
import com.sist.vo.CompanyVO;
import com.sist.vo.RecruitVO;
// Spring MVC의 @Controller 어노테이션을 사용하여 웹 요청을 처리
@Controller
@RequestMapping("recruitment/")
public class RecruitmentController {
	@Autowired
	private RecruitmentService rService;
	
	// 목록 출력
	@GetMapping("recruit_list.do")
	public String recruit_list() {
		
		return "recruitment/recruit_list";
	}
	
	// 채용 공고 상세보기
	// recruit_detail.do URL에 대한 GET 요청 시 recruit_detail 메서드 실행
	@GetMapping("recruit_detail.do")
	public String recruit_detail(int rno, int cno, Model model, HttpSession session) {
		// Spring MVC에서 사용되는 모델 객체에 rno와 cno 데이터를 추가하여 뷰에서 사용할 수 있음
		String userId=(String)session.getAttribute("userId");
		String sessionId = userId != null ? userId : "";
		
		model.addAttribute("sessionId", sessionId);
		model.addAttribute("rno", rno);
		model.addAttribute("cno", cno);
		// recruit_detail 메서드는 recruitment/recruit_detail 뷰로 이동
		return "recruitment/recruit_detail";
	}
	
//	// 채용 공고 추가
//	@PostMapping("recruit_insert.do")
//	public String recruit_insert(RecruitVO vo) {
//		return "recruitment/recruit_insert";
//	}
//	
//	// 채용 공고 수정
//	@GetMapping("recruit_update.do")
//	public String recruit_update(int rno, int cno, Model model) {
//		model.addAttribute("rno", rno);
//		model.addAttribute("cno", cno);
//		return "recruitment/recruit_update";
//	}
	
	// 기업 정보 상세보기
	// company_detail.do URL에 대한 GET 요청 시 company_detail 메서드 실행
	@GetMapping("company_detail.do")
	public String company_detail(int cno, Model model, HttpSession session) {
		// Spring MVC에서 사용되는 모델 객체에 rno와 cno 데이터를 추가하여 뷰에서 사용할 수 있음
		String userId=(String)session.getAttribute("userId");
		String sessionId = userId != null ? userId : "";
		
		model.addAttribute("sessionId", sessionId);
		model.addAttribute("cno", cno);
		// company_detail 메서드는 recruitment/company_detail 뷰로 이동
		return "recruitment/company_detail";
	}
	
//	// 기업 정보 추가
//	@PostMapping("company_insert.do")
//	public String company_insert(CompanyVO vo) {
//		return "recruitment/company_insert";
//	}
//	
//	// 기업 정보 수정
//	@PostMapping("company_update.do")
//	public String company_update(int cno, Model model) {
//		model.addAttribute("cno", cno);
//		return "recruitment/company_update";
//	}

}
