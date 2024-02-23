package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;
import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.service.*;
import com.sist.vo.*;
@Controller
public class ChatController {
   @Autowired
   private MemberService service;
   
   @GetMapping("chat/chat.do")
   public String chat_chat(Model model,HttpSession session)
   {
	   String nickname=(String)session.getAttribute("nickname");
	   System.out.println(nickname);
	   model.addAttribute("nickname", nickname);
	   return "site/chat/chat_test"; // ViewResolver
   }
}
