package com.sist.MailSender;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.messaging.MessagingException;
public class MailSender {

	public void naverMailSend(String toEmail, String tempPwd) throws AddressException, javax.mail.MessagingException {
		// 수신이메일, 임시비번
		String host="smtp.naver.com";
		String user="ariluv1009@naver.com";
		String password="ariari1009";
		Properties props=new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", true);
		Session session=Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			@Override
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		try {
			MimeMessage message=new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
			message.setSubject("[CODEV]임시 비밀번호 입니다."); // 메일 제목
			String html="<html>"
       		     +"<head>"
       		     +"</head>"
       		     +"<body>"
       		     +"<h3>임시비밀번호는 <b>"+tempPwd+"</b>입니다.</h3>"
       		     +"<h3>로그인 후 비밀번호를 변경해주세요.</h3>"
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