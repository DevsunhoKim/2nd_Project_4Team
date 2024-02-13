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
}
