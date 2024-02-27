package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("mypage/")
public class MypageController {

	@GetMapping("main.do")
	public String mypage_main() {
		return "mypage/member";
	}
}
