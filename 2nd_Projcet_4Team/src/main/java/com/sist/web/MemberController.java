package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("member/")
public class MemberController {
	@GetMapping("login.do")
	public String member_login()
	{
		return "member/login";
	}

	@GetMapping("ToS.do")
	public String member_ToS()
	{
		return "member/ToS";
	}

	@GetMapping("join.do")
	public String member_join()
	{
		return "member/join";
	}

	@GetMapping("join_ok.do")
	public String member_join_ok()
	{
		return "member/join_ok";
	}
}
