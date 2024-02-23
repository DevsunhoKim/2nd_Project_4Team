package com.sist.web;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.sist.service.MemberService;

@RestController
@RequestMapping("member/")
public class MemberRestController {
	private MemberService mService;
	
	@Autowired
	 public MemberRestController(MemberService mService) {
		this.mService = mService;
	}

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

	 @GetMapping(value="sendCode_vue.do",produces = "text/plain;charset=UTF-8")
	  public String member_sendCode(String email) {
		  String res = mService.sendCode(email);
		  return res;
	  }
	 
	 @GetMapping(value="findId_vue.do",produces = "text/plain;charset=UTF-8")
	  public String member_idfind(String email,int code) throws AddressException, MessagingException {
		  String res = mService.idFind(email,code);
		  return res;
	  }
	 
	 @GetMapping(value="findpwd_vue.do",produces = "text/plain;charset=UTF-8")
	  public String member_pwdfindvue(String userId, String email) throws AddressException, MessagingException {
		  String res = mService.pwdFind(userId,email);
		  return res;
	  }
}
