package com.sist.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.service.MemberService;
import com.sist.vo.MemberVO;

@RestController
@RequestMapping("member/")
public class MemberRestController {
	@Autowired
	private MemberService mService;

	 @GetMapping(value="idcheck_vue.do",produces = "text/plain;charset=UTF-8")
	   public String member_idcheck(String userId) {
		 int count = mService.getIDCount(userId);
		 return String.valueOf(count);
	 }

	 @GetMapping(value="nicknamecheck_vue.do",produces = "text/plain;charset=UTF-8")
	   public String member_nicknamecheck(String nickname) {
		 int count = mService.getNicknameCount(nickname);
		 return String.valueOf(count);
	 }

	 /*
	 @GetMapping(value="login_ok_vue.do",produces = "text/plain;charset=UTF-8")
	  public String member_login_ok(String userId,String userPwd,boolean ck,
			 HttpSession session,HttpServletResponse response)
	  {
		  MemberVO vo=mService.login(userId, userPwd);
		  if(vo.getMsg().equals("OK"))
		  {
			  session.setAttribute("userId", vo.getUserId());
			  session.setAttribute("enabled", vo.getEnabled());
			  session.setAttribute("authority", vo.getAuthority());
			  session.setAttribute("userName", vo.getUserName());
			  if(ck)
			  {
				  Cookie cookie=new Cookie("userId", vo.getUserId());
				  cookie.setPath("/");
				  cookie.setMaxAge(60*60*24);
				  response.addCookie(cookie);
			  }
		  }
		  return vo.getMsg();
	  }
	  */
}
