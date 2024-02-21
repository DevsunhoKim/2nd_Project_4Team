package com.sist.web;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.service.MemberService;
import com.sist.service.MentorService;
import com.sist.vo.MentorVO;

@Controller
@RequestMapping("mentoring/")
public class MentoringController {
	private MentorService mService;

    @Autowired
    public MentoringController(MentorService mService) {
    	this.mService = mService;
    }

	@GetMapping("list.do")
	public String mentor_list() {
		return "mentoring/list";
	}

	@GetMapping("detail.do")
	public String mentor_detail() {
		return "mentoring/detail";
	}

	@GetMapping("mentor_enrollment.do")
	public String mentor_enrollment() {
		return "mentoring/mentor_enrollment";
	}

	@PostMapping("mentor_join_submit.do")
	public String mentor_submit(MentorVO vo,Principal p) {
		String userId = p.getName();
		// String userId = (String)session.getAttribute("userId");
		/*
		 * String sessionId = "";
		 * if(userId==null) sessionId="";
		 * else sessionId =
		 * userId;
		 */
		vo.setUserId(userId);
    	mService.enrollMentor(vo);
    	return "mentoring/enrollment_ok";
	}
}
