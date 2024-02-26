package com.sist.web;

import java.security.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.service.MentorService;
import com.sist.vo.MentorVO;

@Controller
@RequestMapping("mentoring/")
public class MentoringController {
	private MentorService service;

    @Autowired
    public MentoringController(MentorService service) {
    	this.service = service;
    }

	@GetMapping("list.do")
	public String mentor_list() {
		return "mentoring/list";
	}

	@GetMapping("detail.do")
	public String mentor_detail(int mno,Model model) {
		MentorVO vo = service.mentorDetailData(mno);
		model.addAttribute("vo", vo);
		return "mentoring/detail";
	}

	@GetMapping("mentor_enrollment.do")
	public String mentor_enrollment() {
		return "mentoring/mentor_enrollment";
	}

	@PostMapping("mentor_join_submit.do")
	public String mentor_submit(MentorVO vo,Principal p) {
		String userId = p.getName();
		vo.setUserId(userId);
    	service.enrollMentor(vo);
    	return "mentoring/enrollment_ok";
	}
	
	@GetMapping("reservation.do")
	public String mentor_reservation(int mno, int str_Mtime, int end_Mtime,Model model,int pay) {
		model.addAttribute("mno", mno);
		model.addAttribute("str_Mtime", str_Mtime);
		model.addAttribute("end_Mtime", end_Mtime);
		model.addAttribute("pay", pay);
		return "mentoring/reservation";
	}
	
}
