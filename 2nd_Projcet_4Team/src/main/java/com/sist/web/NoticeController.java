package com.sist.web;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.service.NoticeService;
import com.sist.vo.NoticeVO;

@Controller
@RequestMapping("notice/")
public class NoticeController {
	private NoticeService service;

    @Autowired
    public NoticeController(NoticeService service) {
    	this.service = service;
    }

	@GetMapping("list.do")
	public String notice_list() {
		return "notice/list";
	}
	
	@GetMapping("detail.do")
	public String notice_detail(int no,Model model) {
		NoticeVO vo = service.noticeDetailData(no);
		model.addAttribute("vo", vo);
		return "notice/detail";
	}
}
