package com.sist.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.service.MemberService;
@Controller
public class ChatController {
   @Autowired
   private MemberService service;

   @GetMapping("chat/chat.do")
   public String chat_chat(Model model,HttpSession session)
   {
	   String nickname=(String)session.getAttribute("nickname");
	   String userId=(String)session.getAttribute("userId");
	   //MemberVO user = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	   //System.out.println("@ChatController, GET Chat / Username : " + user.getUserName());
	   /*
	    *
	    *
	          modifyHandshake => 웹소켓의 핸드셰이크 과정 중에 호출되서 핸드셰이크 요청과 응답을 수정하는 역할
	   	      해당 메소드는 웹소켓 연결이 수립되기 전에 호출됨
	   	   ServerEndpointConfig => 웹 소켓 서버 엔드포인트의 설정 객체
	   	      핸드셰이크 요청을 나타내는 HandshakeRequest 객체
	                  핸드셰이크 응답을 나타내는 HandshakeResponse 객체
	          HandshakeRequest를 사용해서 http세션을 가져와서 웹소켓 세션과 연결함

	    */
	   System.out.println(nickname);
	   System.out.println(userId);
	   model.addAttribute("nickname", nickname);
	   model.addAttribute("userId", userId);
	   return "site/chat/chat"; // ViewResolver
   }
}
