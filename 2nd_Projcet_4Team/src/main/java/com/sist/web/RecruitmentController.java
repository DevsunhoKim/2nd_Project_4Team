package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("recruitment/")
public class RecruitmentController {
	@GetMapping("recruit_list.do")
	public String recruit_list() {
		return "recruitment/recruit_list";
	}
}
