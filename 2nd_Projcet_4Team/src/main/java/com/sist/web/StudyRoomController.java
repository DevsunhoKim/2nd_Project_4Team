package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StudyRoomController {
	@GetMapping("studyRoom/room_main.do")
	public String room_main()
	{
		return "studyRoom/room_main";
	}
}
