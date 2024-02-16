package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("mentoring/")
public class MentoringController {

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
}
