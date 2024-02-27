package com.sist.chat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.test.web.servlet.setup.SharedHttpSessionConfigurer;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import com.sist.dao.*;
import com.sist.vo.*;
import lombok.Data;

import java.util.*;

@ServerEndpoint(value="/chat/chat-ws",configurator = WebSokcetSessionConfigurator.class)
public class ChatManager {
   private static Map<Session,ChatVO> users=Collections.synchronizedMap(new HashMap<Session,ChatVO>());
   @OnOpen
   public void onOpen(Session session,EndpointConfig config) throws Exception
   {
	   ChatVO vo=new ChatVO();
	   HttpSession hs=(HttpSession)config.getUserProperties().get("PRIVATE_HTTP_SESSION");
	   vo.setUserId((String)hs.getAttribute("userId"));
	   vo.setUserName((String)hs.getAttribute("userName"));
	   vo.setNickname((String)hs.getAttribute("nickname"));
	   vo.setSession(session);
	   users.put(session,vo);
	   Iterator<Session> it=users.keySet().iterator();
	   while(it.hasNext())
	   {
		   Session ss=it.next();
		   ChatVO vo1=users.get(session);
		   if(ss.getId()!=session.getId())
		   {
		      ss.getBasicRemote().sendText("msg:[알림 ☞]"+vo.getNickname()+"님이 입장하셨습니다");
		   }
		   System.out.println(vo1.getNickname()+":전송 완료!!");
	   }
	   System.out.println("클라이언트 접속...:"+vo.getUserId()+"--"+vo.getNickname()+" "+vo.getSession());
	   
   }
   @OnMessage
   public void onMessage(String message,Session session) throws Exception
   {
	   System.out.println("수신된 메세지...:"+message+"==> 보낸사람:"+session.getId());
	   Iterator<Session> it=users.keySet().iterator();
	   while(it.hasNext())
	   {
		   Session ss=it.next();
		   ChatVO vo=users.get(session);
		   if(session.getId()==ss.getId())
		   {
		       ss.getBasicRemote().sendText("my:["+vo.getNickname()+"]"+message);
		   }
		   else
		   {
			   ss.getBasicRemote().sendText("you:["+vo.getNickname()+"]"+message);
		   }
		   System.out.println(vo.getNickname()+":전송 완료!!");
	   }
	   
   }
   @OnClose
   public void onClose(Session session) throws Exception
   {
	   Iterator<Session> it=users.keySet().iterator();
	   while(it.hasNext())
	   {
		   Session ss=it.next();
		   ChatVO vo=users.get(session);
		   if(ss.getId()!=session.getId())
		   {
		     ss.getBasicRemote().sendText("msg:[알림 ☞]"+vo.getNickname()+"님이 퇴장하셨습니다");
		   }
		     System.out.println(vo.getNickname()+":전송 완료!!");
	   }
	   System.out.println("클라이언트 퇴장:"+users.get(session).getNickname());
	   users.remove(session);
	   
		/*
		 * for(int i=0;i<users.size();i++) { ChatVO vo=users.get(i);
		 * if(vo.getSession().getId()==session.getId()) {
		 * System.out.println("클라이언트 퇴장...:"+vo.getUserName()); users.remove(i);
		 * 
		 * break; } }
		 */
	   
   }
}