<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>스크립트 3 - display</title>
    <style>
		#accordian li{ list-style:none;}
		#accordian li >h1{ cursor:pointer;}
		li > ul{ display:none;}
		li > ul >li{ color:#00F;}

    </style>
    
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script>
              
$(function(){
	$("#accordian h1").click(function(){
		$("#accordian ul ul").slideUp();
		$('.ico_ar').css('transform','none');
		if(!$(this).next().is(":visible"))
		{
			$(this).next().slideDown();
			$(this).find('.ico_ar:eq(0)').css('transform','rotate(180deg)');
		}
	});
});


</script>

</head>
<body>
<div id="accordian">
	<ul>
		<li>
			<h1>자 타이틀입니다<span class="ico_ar">▼</span></h1>
			<ul>
				<li>여기엔 내용이 들어가겠졍</li>
			</ul>
		</li>
		<li class="active">
			<h1>자 타이틀입니다<span class="ico_ar">▼</span></h1>
			<ul>
				<li>여기엔 내용이 들어가겠졍</li>
			</ul>
		</li>
		<li>
			<h1>자 타이틀입니다<span class="ico_ar">▼</span></h1>
			<ul>
				<li>여기엔 내용이 들어가겠졍</li>
			</ul>
		</li>
		<li>
			<h1>자 타이틀입니다<span class="ico_ar">▼</span></h1>
			<ul>
				<li>여기엔 내용이 들어가겠졍</li>
			</ul>
		</li>
	</ul>
</div>

</body>
</html>