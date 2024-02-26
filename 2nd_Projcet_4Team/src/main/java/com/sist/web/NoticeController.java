package com.sist.web;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("notice/")
public class NoticeController {

	@GetMapping("list.do")
	public String notice_list() {
		return "notice/list";
	}
}
