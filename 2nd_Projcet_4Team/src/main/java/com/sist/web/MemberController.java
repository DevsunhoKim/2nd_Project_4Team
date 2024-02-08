package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class MemberController {
	@GetMapping("member/login.do")
	public String member_login()
	{
		return "member/login";
	}
	
	@GetMapping("member/ToS.do")
	public String member_ToS()
	{
		return "member/ToS";
	}
	
	@GetMapping("member/join.do")
	public String member_join()
	{
		return "member/join";
	}
}
