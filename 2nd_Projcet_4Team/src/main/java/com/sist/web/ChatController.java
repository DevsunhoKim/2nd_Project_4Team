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
	   System.out.println(nickname);
	   System.out.println(userId);
	   model.addAttribute("nickname", nickname);
	   model.addAttribute("userId", userId);
	   return "site/chat/chat_test"; // ViewResolver
   }
}
