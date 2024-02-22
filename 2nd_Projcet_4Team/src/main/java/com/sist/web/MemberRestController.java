package com.sist.web;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.MailSender.MailSender;
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

	 @GetMapping(value="pwdfind_vue.do",produces = "text/plain;charset=UTF-8")
	  public String member_pwdfindvue(String userId, String email) throws AddressException, MessagingException {
		 Random rand=new Random();
		  int random_ = rand.nextInt(9000) + 1000; // 임시비밀번호 4자리수 1000~9999
		  String tempPwd=random_+"";
		  System.out.println(userId);
		  String res = mService.pwdFind(userId,email,tempPwd);
		  // id, email 맞으면 임시비밀번호 변경 후 메일전송
		  System.out.println(res);
		  if(res.equals("CHANGE_PWD")) {
			  MailSender smr=new MailSender();
			  smr.naverMailSend(email, tempPwd);
		  }
		  return res;
	  }
}
