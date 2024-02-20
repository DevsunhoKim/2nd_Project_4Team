package com.sist.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.service.MemberService;
import com.sist.vo.MemberVO;

@Controller
@RequestMapping("member/")
public class MemberController {
	private MemberService mService;
	private BCryptPasswordEncoder encoder;
    
    @Autowired
    public MemberController(MemberService mService,BCryptPasswordEncoder encoder) {
    	this.mService = mService;
    	this.encoder = encoder;
    }
	
	@GetMapping("login.do")
	public String member_login()
	{
		return "member/login";
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
	
	@PostMapping("join_submit.do")
	public String member_submit(MemberVO vo) {
		String enPwd=encoder.encode(vo.getUserPwd());// 비밀번호 암호화
    	vo.setUserPwd(enPwd);
    	mService.joinMember(vo);
    	mService.memberAuthorityInsert(vo.getUserId());
    	return "member/join_ok";
	}
	
    @GetMapping("logout.do")
    public String member_logout(HttpSession session,HttpServletRequest request,HttpServletResponse response)
    {
    	session.invalidate();
    	Cookie[] cookies=request.getCookies();
    	if(cookies!=null)
    	{
    	    for(int i=0;i<cookies.length;i++)
    	    {
    	    	if(cookies[i].getName().equals("userId"))
    	    	{
    	    		cookies[i].setPath("/");
    	    		cookies[i].setMaxAge(0);
    	    		response.addCookie(cookies[i]);
    	    		break;
    	    	}
    	    }
    	}
    	return "redirect:../main/main.do";
    }
}
