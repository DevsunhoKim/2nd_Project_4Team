package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("adminpage/")
public class AdminpageController {
	@GetMapping("admin.do")
	public String admin_main()
	{
		return "adminpage";
	}
	@GetMapping("room_reserve.do")
	public String admin_room_reserve()
	{
		return "adminpage/room_reserve";
	}
	@GetMapping("room_ask.do")
	public String admin_room_ask()
	{
		return "adminpage/room_ask";
	}
}
