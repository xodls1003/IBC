<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>title</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
	div#container-fluid{
		min-height: calc(100vh - 136px);
	}
</style>
</head>
<body>
	<div class="container">
		<!-- 그룹 태그로 role과 aria-multiselectable를 설정한다. -->
		<div class="panel-group" id="accordion" role="tablist"
			aria-multiselectable="true">
			<!-- 하나의 item입니다. data-parent 설청과 href 설정만 제대로 하면 문제없이 작동합니다. -->
			<div class="panel panel-default">
				<div class="panel-heading" role="tab">
					<a role="button" data-toggle="collapse" data-parent="#accordion"
						href="#collapse1" aria-expanded="false"> Item #1 </a>
				</div>
				<div id="collapse1" class="panel-collapse collapse" role="tabpanel">
					<div class="panel-body">Hello world1</div>
				</div>
			</div>
			<!-- -->
			<!-- 하나의 item입니다. -->
			<div class="panel panel-default">
				<div class="panel-heading" role="tab">
					<a role="button" data-toggle="collapse" data-parent="#accordion"
						href="#collapse2" aria-expanded="false"> Item #2 </a>
				</div>
				<div id="collapse2" class="panel-collapse collapse" role="tabpanel">
					<div class="panel-body">Hello world2</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading" role="tab">
					<a role="button" data-toggle="collapse" data-parent="#accordion"
						href="#collapse3" aria-expanded="false"> Item #3 </a>
				</div>
				<div id="collapse3" class="panel-collapse collapse" role="tabpanel">
					<div class="panel-body">Hello world3</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>