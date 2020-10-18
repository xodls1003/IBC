<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$('#FAQListDisp').load('${path}/list/pageNum/${pageNum}');
		$('#FAQReplyListDisp').load('${path}/FAQReplyList/fno/${faq.fno}');
		$('#deleteBtn').click(function(){
			alert("삭제하시겠습니까?");
		});
		$('#rInsert').click(function() {
			 		/* var sendData = 'fno='+frm.fno.value+
						'&fid='+frm.fid.value+
						'&content='+frm.content.value;  */
					var sendData = $('#frm').serialize();
					$.post('${path}/rInsert', sendData, function(data) {
						alert('댓글이 작성 되었습니다');
						$('#FAQReplyListDisp').html(data);						
						frm.content.value="";
						frm.fid.value="";
			});
		});
	});
</script>
</head>
<body>
<div class="container" align="center">
	<h2 class="text-primary">FAQ 상세 내역</h2>
	<input type="hidden" name="fno" value="${faq.fno }">
	<input type="hidden" name="pageNum" value="${pageNum }">
<table class="table table-striped table-bordered">
	<tr><td>질문</td><td>${faq.question}</td></tr>
	<tr><td>작성자</td><td>${faq.admin_id}</td></tr>	
	<tr><td>조회수</td><td>${faq.readcount}</td></tr>
	<tr><td>답변내용</td><td><pre>${faq.answer}</pre></td></tr>
	<tr><td colspan="2"><a href="${path}/list/pageNum/${pageNum}" class="btn btn-info">게시글 목록</a>
		<a href="${path}/updateForm/fno/${faq.fno}/pageNum/${pageNum}" class="btn btn-warning">수정</a>
		<a href="${path}/delete/fno/${faq.fno}/pageNum/${pageNum}" class="btn btn-danger" id="deleteBtn">삭제</a>
		<%-- <a href="${path}/insertForm/fno/${faq.fno}/pageNum/${pageNum}" class="btn btn-success">답글</a> --%>
</table>
<!-- 댓글작성form -->
<form action="" name="frm" id="frm">
	<input type="hidden" name="fno" value="${faq.fno}">	
<table class="table table-hover">
	<caption>댓글 작성</caption>
	<!-- 회원 게시판은 로그인한 사람의 아이디나 또는 이름 -->
	<tr><td>작성자</td>
		<td><input type="text" name="fid" value="${faq.admin_id}" size="4" ></td>
		
		<td>댓글</td>
		<td><textarea rows="3" cols="30" name="content"></textarea></td>
			
		<td colspan="2"><input type="button" value="댓글 입력" id="rInsert"></td></tr>
</table>
</form>
<div id="FAQReplyListDisp"></div>
<div id="FAQListDisp"></div>
</div>
</body>
</html>