<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container" align="center">
	<h2 class="text-primary">FAQ 게시글 입력</h2>
<form action="${path }/insert" method="post">
<%-- 	<input type="text" name="fno" value="${fno }">
	<input type="text" name="pageNum" value="${pageNum}"> --%>
	<table class="table table-hover table-bordered">
			<tr>
				<td>질문</td>
				<td><input type="text" name="question"
					required="required" autofocus="autofocus"></td>
			</tr>
			<tr><td>작성자</td><td><input type="text" name="admin_id" 
				required="required"></td></tr>
			<tr>
				<td>답변내용</td>
				<td><input type="text" name="answer"
					required="required"></td>
			</tr>
			<tr><td colspan="2"><input type="submit"></td></tr>
	</table>
</form>	
</div>
</body>
</html>