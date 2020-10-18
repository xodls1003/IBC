<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function rDelete(fno, rno){
		var sendData = 'fno=' + fno + '&rno=' + rno;
		$.post('${path}/rDelete', sendData, function(data){
			alert("삭제되었습니다");
			$('#FAQReplyListDisp').html(data);
		});
	}
	function rUpdate(fno, rno){
/* 		데이터를 읽을 때 input/textarea라는 form형식에서는 val()
		td/span같이 form형식이 아닐 때는 text() */
		var txt = $('#td_' + rno).text();
		// 읽은 글을 편집할 수 있도록 textarea에 넣어야 한다
		$('#td_'+rno).html('<textarea rows="3" cols="30" id="rt">'+
				txt+'</textarea>');
		$('#btn_'+rno).html('<input type="button" onclick="up('+fno+
				','+rno+')" class="btn btn-sm btn-danger" value="확인"> '+
			'<input type="button" onclick="lst('+fno+
				')" class="btn btn-sm btn-info" value="취소">'	);
	}
	function up(fno,rno){
		var sendData = 'content=' + $('#rt').val() + '&fno=' + fno +
		'&rno=' + rno;
		$.post('${path}/rUpdate', sendData, function(data){
			alert("수정되었습니다");
			$('#FAQReplyListDisp').html(data);
		});
	}
	function lst(fno) {
		$('#FAQReplyListDisp').load('${path}/FAQReplyList/fno/'+fno);
	}
</script>
</head>
<body>
<c:if test="${not empty frList }">
<table class="table table-striped"><caption>댓글 목록</caption>
			<tr>
				<td>작성자</td>
				<td>내용</td>
				<td>작성일</td>
				<td>수정일</td>
			</tr>
			<c:forEach var="faqr" items="${frList}">
	<c:if test="${faqr.del=='y' }">
		<tr><td colspan="4">삭제된 댓글입니다</td></tr>
	</c:if>
	<c:if test="${faqr.del != 'y' }">
		<tr>
			<td>${faqr.fid }</td>
			<td id="td_${faqr.rno }">${faqr.content }</td>			
			<td>${faqr.regdate }</td>
			<td>${faqr.updatedate }</td>
			<td id="btn_${faqr.rno }"></td>
			<td>
			<!-- 원래는 댓글 작성자와 로그인 회원의 아이디나 이름이 같으면 -->
				<c:if test="${faqr.fid==faq.admin_id}">
					<input type="button" class="btn btn-sm btn-warning" 
						onclick="rUpdate(${faqr.fno},${faqr.rno})" value="수정">
					<input type="button" class="btn btn-danger btn-sm" 
						onclick="rDelete(${faqr.fno},${faqr.rno})" value="삭제">
				</c:if>
			</td>
		</tr>	
	</c:if>
</c:forEach>
</table>
</c:if>
</body>
</html>