package com.sist.chat;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
@ServerEndpoint("/chat/chat-ws")
public class ChatManager {
   private static List<Session> users=new ArrayList<>();

   @OnOpen
   public void onOpen(Session session)
   {
	   users.add(session);
	   System.out.println("클라이언트 접속...:"+session.getId());
   }
   @OnMessage
   public void onMessage(String message,Session session) throws Exception
   {
	   System.out.println("수신된 메세지...:"+message+"==> 보낸사람:"+session.getId());
	   Iterator<Session> it=users.iterator();
	   while(it.hasNext())
	   {
		   it.next().getBasicRemote().sendText(message);
		   System.out.println(session.getId()+":전송 완료!!");
	   }

   }
   @OnClose
   public void onClose(Session session)
   {
	   users.remove(session);
	   System.out.println("클라이언트 퇴장...:"+session.getId());
   }
}
