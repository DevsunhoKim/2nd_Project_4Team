package com.sist.web;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.sist.MailSender.MailSender;
import com.sist.service.MemberService;

@RestController
@RequestMapping("member/")
public class MemberRestController {
	private MemberService mService;
	private BCryptPasswordEncoder encoder;
	
	@Autowired
	 public MemberRestController(MemberService mService,BCryptPasswordEncoder encoder) {
		this.mService = mService;
		this.encoder = encoder;
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
	  public String member_sendCode(String email) throws AddressException, MessagingException {
		  int code = (int)(Math.random() * 900000) + 100000; // 인증번호 6자리수 100000~999999
		  System.out.println(code);
		  String res = mService.sendCode(email,code);
		  if(res.equals("SEND_CODE")) {
			  MailSender smr=new MailSender();
			  smr.FindIdMailSend(email, code);
		  }
		  return res;
	  }
	 
	 @GetMapping(value="findId_vue.do",produces = "text/plain;charset=UTF-8")
	  public String member_idfind(String email,int code) throws AddressException, MessagingException {
		  String res = mService.idFind(email,code);
		  return res;
	  }
	 
	 @GetMapping(value="findpwd_vue.do",produces = "text/plain;charset=UTF-8")
	  public String member_pwdfindvue(String userId, String email) throws AddressException, MessagingException {
		  int random_ = (int)(Math.random() * 900000) + 100000; // 임시비밀번호 6자리수 100000~999999
		  String tempPwd=random_+"";
		  String enTempPwd=encoder.encode(tempPwd);
		  String res = mService.pwdFind(userId,email,enTempPwd);
		  // id, email 맞으면 임시비밀번호 변경 후 메일전송
		  if(res.equals("CHANGE_PWD")) {
			  MailSender smr=new MailSender();
			  smr.FindPwdMailSend(email, enTempPwd);
		  }
		  return res;
	  }
}
