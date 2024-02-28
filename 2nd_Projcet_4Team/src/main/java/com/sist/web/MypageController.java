package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.sist.service.MypageService;
import com.sist.vo.MemberVO;

@Controller
@RequestMapping("mypage/")
public class MypageController {
	private MypageService service;

    @Autowired
    public MypageController(MypageService service) {
    	this.service = service;
    }
    
    @GetMapping("main.do")
	public String mypage_main() {
		return "mypage/member";
	}
    
	@GetMapping("member_pwdCheck.do")
	public String mypage_pwdCheck() {
		return "mypage/member_pwdCheck";
	}

    @PostMapping("update.do")
	public String member_update(MemberVO vo) throws JsonProcessingException {
		service.updateMember(vo);
		return "mypage/member";
	}
    
    @GetMapping("member_withdraw.do")
	public String mypage_withdraw() {
		return "mypage/member_withdraw";
	}
}
