<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp" %>    
<%-- <%@ include file="toggle.jsp" %>     --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#chatTable {
	height: 50%;
	border: 2px solid green;
	/* table-layout: fixed;  */
	overflow: hidden;
	margin-top: 65px;
}

#chatMessage {
	height: 400px;
	overflow: scroll;
}
th{
	text-align: center;
	font-weight: bold;
	font-style: italic;
	color: navy;
}
</style>
<script type="text/javascript">
	var websocket;	// 웹소켓 변수, 전역변수로 사용하기 위해
	$(function() {
		$('#enterBtn').click(function() {
			connect();
		});
		$('#exitBtn').click(function(){
			disconnect();
		});
		$('#sendBtn').click(function(){
			send();
		});
		$('#message').keypress(function(){
			// 				IE면?		IE key 값	  IE아닌 key값
			var keycode = event.keyCode?event.keyCode:event.which;
			if(keycode == 13) {	//enter를 눌렀으면 (아스키코드)
				send();
			}
			event.stopPropagation();	// 이벤트를 전달하지 마라
		});
	});
	function send() {
		var nickname= $('#nickname').val(); // 별명
		var msg = $('#message').val();      // 메세지
		websocket.send(nickname+"=>"+msg);  // 별명과 메세지를 묶어서 보내기
		$('#message').val("");  // 입력한 메세지 삭제
	}
	function connect() {
		websocket=new WebSocket("ws://172.30.1.55:8080/chat-ws.do");
		websocket.onopen = onOpen;
		websocket.onmessage=onMessage;
		websocket.onclose = onClose;
	}
	function onOpen() {
		var nickname= $('#nickname').val();
		appendMessage(nickname+"님이 입장하였습니다");
	}
	function onMessage(event) {
		var msg = event.data;  // 메세지는 event의 data로 들어온다
		appendMessage(msg);
	}
	function onClose() {
		var nickname= $('#nickname').val();
		appendMessage(nickname+"님이 퇴장하였습니다");
	}
	function appendMessage(msg) {
		$('#chatMessage').append(msg+'<br>');
		// scrollBar 아래로 내려라
		var objDiv = document.getElementById("chatMessage");
		objDiv.scrollTop = objDiv.scrollHeight;
	}
	function disconnect() {
		websocket.close();
	}
</script>
</head>
<body>
<!-- <nav class="navbar navbar-fixed-right"> -->
<div>	
<table id="chatTable" class="table table-hover">
<tr>
	<th colspan="2">실시간 문의</th>
</tr>
 	<tr>
 		<td>별명</td>
 		<td>
 		<input type="text" id="nickname"/>
 		<input type="button" id="enterBtn" value="입장" class="btn btn-sm btn-info" />
 		<input type="button" id="exitBtn" value="퇴장" class="btn btn-sm btn-warning"/> 		
 		</td>
 	</tr>
 	<tr>
 		<td>메세지</td>
 		<td>
 		<input type="text" id="message"/>
 		<input type="button" id="sendBtn" value="전송" 
 		class="btn btn-success btn-sm" /> 		
 		</td>
 	</tr>
 	<tr>
 		<td>대화영역</td>
 		<td><div id="chatMessage"></div></td>
 	</tr>
</table>
</div>
<!-- </nav> -->
</body>
</html>