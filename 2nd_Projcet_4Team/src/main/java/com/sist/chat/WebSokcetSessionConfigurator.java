package com.sist.chat;

import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;
import javax.websocket.server.ServerEndpointConfig.Configurator;

public class WebSokcetSessionConfigurator extends Configurator{

	@Override
	public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) {
		HttpSession session=(HttpSession)request.getHttpSession();
		if(session!=null)
			sec.getUserProperties().put("PRIVATE_HTTP_SESSION", session);
	}


}