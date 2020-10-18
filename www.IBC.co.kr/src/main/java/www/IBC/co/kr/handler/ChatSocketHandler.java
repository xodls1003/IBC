package www.IBC.co.kr.handler;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatSocketHandler extends TextWebSocketHandler {
	private Map<String, WebSocketSession> users =
			new HashMap<String, WebSocketSession>(); // 아이디와 정보 저장
	
//	 채팅에 연결 됐을 때 : 접속한 클라이언트를 users의 session에 저장
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		users.put(session.getId(), session);
	}
	
//	 연결이 종료 됐을 때 : users에서 제거
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		users.remove(session.getId());
	}
	
//	 클라이언트에서 문자로 메세지가 왔을 때 : 메세지를 연결된 모든 클라이언트에 전송 
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		Collection<WebSocketSession> sessions = users.values();
		for (WebSocketSession ws : sessions) {
			ws.sendMessage(message);
		}
	}
}
