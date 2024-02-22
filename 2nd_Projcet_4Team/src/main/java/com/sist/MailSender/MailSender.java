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
       		     + "[CODEV] 드림</p></h3>"
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