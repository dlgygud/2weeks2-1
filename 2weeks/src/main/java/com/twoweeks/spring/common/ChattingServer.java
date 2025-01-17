package com.twoweeks.spring.common;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.twoweeks.spring.chat.model.service.ChatServiceImpl;
import com.twoweeks.spring.chat.model.vo.ChatGroupMessage;
import com.twoweeks.spring.chat.model.vo.ChatLog;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ChattingServer extends TextWebSocketHandler{
	
	private static List<WebSocketSession> sessionList=new ArrayList<WebSocketSession>();	
	
	private static ChatLog cl=new ChatLog();	
	
	@Autowired
	private ChatServiceImpl service;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);				
				
		String sender=(String)session.getAttributes().get("chatName");
		log.info("{}님 입장",sender);

		//게터로 sessionList를 만들어 컨트롤러에서 값을 쏴줄수있게.. 전체 세션의 수를 세니 방마다의 숫자를 셀것.				
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String loginName=(String)session.getAttributes().get("chatName");			
		String loginId=(String)session.getAttributes().get("chatId");
		
		
		//알람띄울 샌더 다시 추출하기
		log.info("{}님이 {}메세지 전송함", loginName, message.getPayload());		
		
		Gson gson=new Gson();
		
		ChatGroupMessage msg=gson.fromJson(message.getPayload(), ChatGroupMessage.class); //Json을 java객체로 바꿔줌
				
		TextMessage sendMsg= new TextMessage(gson.toJson(msg));
		
		String result=sendMsg.getPayload();
		
		if(result.contains("ENTER")) {
			int num=result.indexOf("chatGroupNo");
			int no=Integer.parseInt(result.substring(num+13, result.substring(num).indexOf(",")+num));
			cl.setChatNo(no); cl.setChatId(loginId);
			int check=service.insertChatLog(cl);
			System.out.println("insert : "+check);
			
		} else if(result.contains("CLOSE")) {
//			System.out.println("close");
//			int num=result.indexOf("chatGroupNo");
//			int no=Integer.parseInt(result.substring(num+13, result.substring(num).indexOf(",")+num));
//			cl.setChatNo(no); cl.setChatId(loginId);
//			int check=service.deleteChatLog(cl);
//			System.out.println("delete : "+check);
		}
		
		for(WebSocketSession s : sessionList) {
			if(result.contains("MSG")) {
				s.sendMessage(sendMsg);				
			}
		}	
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);	
	}
}
