package com.sist.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
	public String member_update(MemberVO vo) {
		service.updateMember(vo);
		return "mypage/member";
	}
    
    @GetMapping("member_withdraw.do")
	public String mypage_withdraw() {
		return "mypage/member_withdraw";
	}
    
    @GetMapping("mentor_reserve.do")
    public String mypage_mentor_reserve() {
       return "mypage/mentor_reserve";
    }
    
 // 스터디룸 마이페이지
    @GetMapping("myRoom_reserve.do")
    public String myRoom_reserve(HttpSession session,Model model)
    {
    	String userId=(String)session.getAttribute("userId");
    	model.addAttribute("userId", userId);
    	return "mypage/myRoom_reserve";
    }
    @GetMapping("room_jjim.do")
    public String room_jjim(HttpSession session,Model model)
    {
    	String userId=(String)session.getAttribute("userId");
    	model.addAttribute("userId", userId);
    	return "mypage/room_jjim";
    }
    
   
}
