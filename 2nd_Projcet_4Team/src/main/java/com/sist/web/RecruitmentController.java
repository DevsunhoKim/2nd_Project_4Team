package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.vo.RecruitVO;

@Controller
@RequestMapping("recruitment/")
public class RecruitmentController {
	@GetMapping("recruit_list.do")
	public String recruit_list() {
		return "recruitment/recruit_list";
	}

	@GetMapping("recruit_detail.do")
	public String recruit_detail(int rno, int cno, Model model) {
		model.addAttribute("rno", rno);
		model.addAttribute("cno", cno);
		return "recruitment/recruit_detail";
	}

	@GetMapping("company_detail.do")
	public String company_detail(int rno, int cno, Model model) {
		model.addAttribute("rno", rno);
		model.addAttribute("cno", cno);
		return "recruitment/company_detail";
	}
	
	@GetMapping("recruit_insert.do")
	public String recruit_insert(RecruitVO vo) {
		return "recruitment/recruit_insert";
	}
	
	@GetMapping("recruit_update.do")
	public String recruit_update(RecruitVO vo) {
		return "recruitment/recruit_update";
	}
}
