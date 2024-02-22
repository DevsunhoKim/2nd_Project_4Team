package com.sist.web;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("studyRoom/")
public class StudyRoomController {
	@GetMapping("room_main.do")
	public String room_main()
	{
		return "studyRoom/room_main";
	}
	@GetMapping("room_detail.do")
	public String room_detail(int no,Model model,Principal p)
	{
		String userId="";
		if(p!=null)
		{
			userId=(String)p.getName();
		}
		model.addAttribute("no", no);
		model.addAttribute("userId", userId);
		return "studyRoom/room_detail";
	}
	@GetMapping("ask.do")
	public String room_ask(int no,Model model)
	{
		model.addAttribute("no", no);
		return "studyRoom/room_ask";
	}
	@GetMapping("reserve.do")
	public String room_reserve(int no,Model model)
	{
		model.addAttribute("no", no);
		return "studyRoom/room_reserve";
	}
}
