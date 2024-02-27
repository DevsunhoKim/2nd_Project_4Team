package com.sist.chat;

import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.sist.vo.ChatVO;

//@ServerEndpoint(value="/chat/chat-ws",configurator = WebSokcetSessionConfigurator.class)
public class ChatServer {
	/*private static Map<Session,ChatVO> users=Collections.synchronizedMap(new HashMap<Session,ChatVO>());
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
			      ss.getBasicRemote().sendText("msg:[알림 ☞]"+vo.getUserName()+"님이 입장하셨습니다");
			   }
			   System.out.println(vo1.getUserName()+":전송 완료!!");
		   }
		   System.out.println("클라이언트 접속...:"+vo.getUserId()+"--"+vo.getUserName()+" "+vo.getSession());
		   
	   }
	   @OnMessage
	   public void onMessage(String message, Session senderSession) throws Exception {
	       System.out.println("수신된 메세지...:" + message + "==> 보낸사람:" + senderSession.getId());

	       ChatVO senderVO = users.get(senderSession); // 메시지를 보낸 사용자의 ChatVO 가져오기

	       for (Session receiverSession : users.keySet()) {
	           ChatVO receiverVO = users.get(receiverSession);

	           if (!receiverSession.getId().equals(senderSession.getId())) {
	               // 메시지를 보낸 사용자가 아닌 경우에만 "no:" 접두사를 붙여서 전송
	               receiverSession.getBasicRemote().sendText("no:[" + senderVO.getUserName() + "]" + message);
	           } else {
	               // 메시지를 보낸 사용자에게는 "my:" 접두사를 붙여서 전송
	               senderSession.getBasicRemote().sendText("my:[" + senderVO.getUserName() + "]" + message);
	           }
	           System.out.println(receiverVO.getUserName() + ": 전송 완료!!");
	       }
	   }

	   @OnClose
	   public void onClose(Session session) throws Exception
	   {
		   Iterator<Session> it=users.keySet().iterator();
		   // user안에 있는 <Session,ChatVO> 키 집합(set)을 얻어서 순회함
		   // it에 저장
		   // hasNext으로 존재여부확인
		   //next() 메서드로 다음요소 가져오기
		   while(it.hasNext())
		   {
			   Session ss=it.next();
			   ChatVO vo=users.get(session);
			   if(ss.getId()!=session.getId())
			   {
			     ss.getBasicRemote().sendText("msg:[알림 ☞]"+vo.getUserName()+"님이 퇴장하셨습니다");
			   }
			     System.out.println(vo.getUserName()+":전송 완료!!");
		   }
		   System.out.println("클라이언트 퇴장:"+users.get(session).getUserName());
		   users.remove(session);
		   
			
		   
	   }*/
	/*
	 * for(int i=0;i<users.size();i++) { ChatVO vo=users.get(i);
	 * if(vo.getSession().getId()==session.getId()) {
	 * System.out.println("클라이언트 퇴장...:"+vo.getUserName()); users.remove(i);
	 * 
	 * break; } }
	 */
}
