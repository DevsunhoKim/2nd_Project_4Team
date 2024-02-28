package com.sist.MailSender;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.MessagingException;
import org.springframework.stereotype.Component;

import com.sist.service.AdminpageService;
import com.sist.service.MemberService;
import com.sist.service.StudyRoomService;
import com.sist.vo.MemberVO;
import com.sist.vo.StudyRoomAskVO;
import com.sist.vo.StudyRoomReserveVO;
@Component
public class MailSender {
	@Autowired
	private AdminpageService aService;
	@Autowired
	private MemberService mService;
	@Autowired
	private StudyRoomService srService;
	
	public void FindIdMailSend(String toEmail, int code) throws AddressException, javax.mail.MessagingException {
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
       		     + "인증번호: <b style=\"color:#7918F2;\">"+code+"</b><br>"
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
	public void ReserveMailSend(int no,String userId) throws AddressException, javax.mail.MessagingException {
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
			MemberVO mvo=mService.getMemberByID(userId);
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(mvo.getEmail()));
			StudyRoomReserveVO vo=aService.StudyRoomReserveData(no);
			message.setSubject("[CODEV]예약 확정 안내"); // 메일 제목
			String html="<html>"
       		     +"<head>"
       		     +"</head>"
       		     +"<body>"
       		     +"<h1><b style=\"color:#7918F2;\">CODEV STUDYROOM</b><br></h1>"
       		     +"<h3><p>"
       		     + mvo.getUserName()+"님 안녕하세요,<br>"
       		     + "<br>"
       		     + "저희 CODEV 스터디룸을 예약해주셔서 감사합니다. 방문일과 시간을 안내드리오니 해당 날짜에 맞춰 방문해주시길 바랍니다.<br>"
       		     + "<br>"
       		     + "방문일: [<b style=\"color:#7918F2;\">"+vo.getRdate()+"</b>]<br>"
       		     + "<br>"
       		     + "예약시간: [<b style=\"color:#7918F2;\">"+vo.getTime()+"</b>]<br>"
       		     + "<br>"
       		     + "예약시간: [<b style=\"color:#7918F2;\">"+vo.getDbday()+"</b>]<br>"
    		     + "<br>"
       		     + "결제금액: [<b style=\"color:#7918F2;\">"+vo.getPrice()+"원</b>]<br>"
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
	public void ASKReturnMailSend(int ano) throws AddressException, javax.mail.MessagingException {
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
			StudyRoomAskVO vo=srService.StudyRoomAskDetail(ano);
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(vo.getEmail()));
			
			message.setSubject("[CODEV]1:1문의 답변 안내"); // 메일 제목
			String html="<html>"
       		     +"<head>"
       		     +"</head>"
       		     +"<body>"
       		     +"<h1><b style=\"color:#7918F2;\">CODEV STUDYROOM</b><br></h1>"
       		     +"<h3><p>"
       		     + vo.getName()+"님 안녕하세요,<br>"
       		     + "<br>"
       		     + "저희 CODEV 스터디룸을 이용해주셔서 감사합니다.<br>"
       		     + "<br>"
       		     + "1:1문의 주신 내용에 대해 답변을 드리기 위해, 문의글 작성시 입력하신 이메일로 안내 드립니다.<br>"
       		     + "<br>"
       		     + "문의 구분: [<b style=\"color:#7918F2;\">"+vo.getCate()+"</b>]<br>"
       		     + "<br>"
       		     + "제목: [<b style=\"color:#7918F2;\">"+vo.getSubject()+"</b>]<br>"
    		     + "<br>"
    		     + "작성 날짜: [<b style=\"color:#7918F2;\">"+vo.getDbday()+"</b>]<br>"
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