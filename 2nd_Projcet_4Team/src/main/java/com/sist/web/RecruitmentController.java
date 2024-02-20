package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("recruitment/")
public class RecruitmentController {
	@GetMapping("recruit_list.do")
	public String recruit_list() {
		return "recruitment/recruit_list";
	}

	@GetMapping("recruit_detail.do")
	public String recruit_detail(int no, int cno, Model model) {
		model.addAttribute("no", no);
		model.addAttribute("cno", cno);
		return "recruitment/recruit_detail";
	}
}
