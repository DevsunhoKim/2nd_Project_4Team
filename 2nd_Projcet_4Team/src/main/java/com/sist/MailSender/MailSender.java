package com.sist.MailSender;
import java.io.FileReader;
import java.util.*;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.messaging.MessagingException;
public class MailSender {
	
	public void FindIdMailSend(String toEmail, int code) throws AddressException, javax.mail.MessagingException {
	/*	String temp ="";
		try {
			FileReader fr = new FileReader(".c)
		}*/
		
		// 수신이메일, 임시비번
		String host="smtp.naver.com"; 
		String user="ariluv1009@naver.com";
		String password="ariari1009";
		Properties props=new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", true);
		Session session=Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		try {
			MimeMessage message=new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
			message.setSubject("[CODEV]아이디 찾기 인증번호 안내"); // 메일 제목
			String html="<html>"
       		     +"<head>"
       		     +"</head>"
       		     +"<body>"
       		     +"<h1>인증번호: <b style=\"color:#7918F2;\">"+code+"</b><br></h1>"
       		     +"<h3><p>"
       		     + "안녕하세요,<br>"
       		     + "<br>"
       		     + "아이디를 찾기 위한 인증번호를 안내해드립니다. 아래의 인증번호를 입력하여 아이디 찾기 프로세스를 완료해주세요.<br>"
       		     + "<br>"
       		     + "인증번호: "+code+"<br>"
       		     + "<br>"
       		     + "보안을 위해 인증번호는 민감한 정보이므로 다른 사람과 공유하지 마십시오. 인증이 완료된 후에는 안전을 위해 이메일 계정을 보호하는 것이 중요합니다.<br>"
       		     + "<br>"
       		     + "만약 이 요청을 하지 않았거나 도움이 필요하시다면 언제든지 저희에게 연락해주시기 바랍니다.<br>"
       		     + "<br>"
       		     + "감사합니다.<br>"
       		     + "<br>"
       		     + "CODEV 드림</p></h3>"
       		     +"</body>"
       		     +"</html>";
			
			message.setContent(html,"text/html;charset=UTF-8"); 
			Transport.send(message);
			System.out.println("Message Send Success!");
		}catch(MessagingException e) {
			e.printStackTrace();
		}
	}
	
	public void FindPwdMailSend(String toEmail, String tempPwd) throws AddressException, javax.mail.MessagingException {
		// 수신이메일, 임시비번
		String host="smtp.naver.com"; 
		String user="ariluv1009@naver.com";
		String password="ariari1009";
		Properties props=new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", true);
		Session session=Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		try {
			MimeMessage message=new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
			message.setSubject("[CODEV]임시 비밀번호 안내 및 계정 안전에 대한 안내"); // 메일 제목
			String html="<html>"
       		     +"<head>"
       		     +"</head>"
       		     +"<body>"
       		     +"<h1>임시 비밀번호: <b style=\"color:#7918F2;\">"+tempPwd+"</b><br></h1>"
       		     +"<h3><p>"
       		     + "안녕하세요,<br>"
       		     + "<br>"
       		     + "임시 비밀번호를 안내해드립니다. 아래 임시 비밀번호로 로그인하신 후, 보안 설정에서 새로운 비밀번호를 설정해주시기 바랍니다.<br>"
       		     + "<br>"
       		     + "임시 비밀번호: [<b style=\"color:#7918F2;\">"+tempPwd+"</b>]<br>"
       		     + "<br>"
       		     + "보안을 위해 이메일을 통한 비밀번호 재설정이 완료된 후에는 반드시 비밀번호를 변경해주시기 바랍니다. 접속 기록을 확인하시고, 본인이 요청하지 않은 경우에는 즉시 저희에게 알려주시기 바랍니다.<br>"
       		     + "<br>"
       		     + "더 궁금한 사항이 있으시거나 도움이 필요하시면 언제든지 저희에게 연락해주시기 바랍니다.<br>"
       		     + "<br>"
       		     + "감사합니다.<br>"
       		     + "<br>"
       		     + "CODEV 드림</p></h3>"
       		     +"</body>"
       		     +"</html>";
			
			message.setContent(html,"text/html;charset=UTF-8"); 
			Transport.send(message);
			System.out.println("Message Send Success!");
		}catch(MessagingException e) {
			e.printStackTrace();
		}
	}
}