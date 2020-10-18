<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%-- <%@ include file="toggleHeader.jsp"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>



<style type="text/css">
/* .panel-heading {
	padding: 0;
}
.panel-heading a {
	padding: 10px 15px;
	display: block;
	text-decoration: none;
} */

#accordian li {
	list-style: none;
}
#accordian li>h2 {
	cursor: pointer;
}
li>ul {
	display: none;
}
li>ul>li {
	color: black;
} 

#ChatDisp {
	float: right;
	width: 30%;
}
#ListMain {
	float: left;
	width: 70%;
}
</style>
<script type="text/javascript">
	$(function() {
		$('#ChatDisp').load('${path}/chat.do');
	});
	
	$(function(){
		$("#accordian h2").click(function(){
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
	<div id="ListMain" class="container" align="center">
		<h2 class="text-primary"><a href="${path }/list">FAQ 목록</a></h2>
		<table class="table table-striped table-bordered table-hover">
			<tr>
				<td>번호</td>
				<td>작성자</td>
				<td>질문</td>
				<td>조회수</td>
				<td>작성일</td>
			</tr>
			<c:if test="${empty list }">
				<tr>
					<td colspan="5">데이터가 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="faq" items="${list}">
					<tr>
						
						<c:if test="${faq.del == 'y' }">
							<td colspan="5" class="text-muted" hidden=""></td>
						</c:if>
						<c:if test="${faq.del != 'y' }">
							<td>${faq.fno }</td>
							<td>${faq.admin_id }</td>
							<td>
							<a href="${path}/view/fno/${faq.fno}/pageNum/${fb.currentPage}"
								class="btn">${faq.question}</a></td>
							<td>${faq.readcount }</td>
							<td>${faq.regdate }</td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
		</table>

		<%-- 		<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
		<c:forEach var="faq" items="${list}">
			<div class="panel panel-default">
				<div class="panel-heading" role="tab">
					<a role="button" data-toggle="collapse" data-parent="#accordion"
						href="#${faq.fno }" aria-expanded="false"> ${faq.question } </a>
				</div>
				<div id="${faq.fno }" class="panel-collapse collapse" role="tabpanel">
					<div class="panel-body">${faq.answer }</div>
				</div>
			</div>
		</c:forEach>
		</div> --%>

		<%-- <section class="content16 cid-sdn5udUmce" id="content16-15">
	<h2>FAQ 목록</h2>
	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
	<c:forEach var="faq" items="${list}" varStatus="status">
	  <div class="panel panel-default">
	    <div class="panel-heading" role="tab" id="${status.count}">
	      <h4 class="panel-title">
		<a data-toggle="collapse" data-parent="#accordion" href="#${faq.fno }" aria-expanded="true" aria-controls="collapseOne">
		  ${faq.question } <br /> ${status.count } <br /> ${status.current }
		</a>
	      </h4>
	    </div>
	    <div id="${faq.fno }" class="panel-collapse collapse" role="tabpanel" aria-labelledby="${status.count}">
	      <div class="panel-body">
			${faq.answer } 
	      </div>
	    </div>
	  </div>
	  </c:forEach>
	</div>
</section> --%>


<%-- 		<div class="mbr-section-head align-center mb-4">
			<h3 class="mbr-section-title mb-0 mbr-fonts-style display-2">
				<strong>FAQ 목록</strong>
			</h3>
		</div>
		<div id="accordian">
			<ul>
				<c:forEach var="faq" items="${list}" varStatus="status">
					<li>
						<h2>${faq.question }<span class="sign mbr-iconfont mbri-arrow-down"></span><hr />
						</h2>
						
						<ul>
							<li>${faq.answer }</li>
						</ul>
					</li>
				</c:forEach>
			</ul>
		</div> --%>


<%-- 	<section class="content16 cid-sdn5udUmce" id="content16-15">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 col-md-10">
					<div class="mbr-section-head align-center mb-4">
						<h3 class="mbr-section-title mb-0 mbr-fonts-style display-2">
							<strong>Accordion FAQ</strong>
						</h3>
					</div>
					
					
					<div id="bootstrap-accordion_1" class="panel-group accordionStyles accordion" 
						role="tablist" aria-multiselectable="true">
						<c:forEach var="faq" items="${list}">		
						<div class="card mb-3">
							<div class="card-header" role="tab" id="headingOne">
								<a role="button" class="panel-title collapsed"
									data-toggle="collapse" data-core="" href="#${faq.fno }"
									aria-expanded="false" aria-controls="collapse1">
									<h6 class="panel-title-edit mbr-fonts-style mb-0 display-7">
										<strong>${faq.question }</strong>
									</h6> <span class="sign mbr-iconfont mbri-arrow-down"></span>
								</a>
							</div>
							<div id="${faq.fno }" class="panel-collapse noScroll collapse"
								role="tabpanel" aria-labelledby="headingOne"
								data-parent="#bootstrap-accordion_1">
								<div class="panel-body">
									<p class="mbr-fonts-style panel-text display-4">${faq.answer }</p>
								</div>
								
							</div>
						</div>
						</c:forEach>
					</div>
					
				</div>
			</div>
		</div>
	</section> --%>

		<%-- 		<section class="content17 cid-sdn5uu2O5w" id="content17-16">
			<div class="container">

				<div class="row justify-content-center">
					<div class="col-12 col-md-10">

						<div class="section-head align-center mb-4">
							<h2 class="mbr-section-title mb-0 mbr-fonts-style display-2 ">
								<a href="${path }/list"><strong>FAQ 목록</strong></a>
							</h2>
						</div>
						
						<c:forEach var="faq" items="${list}">	
						<div id="bootstrap-toggle" class="toggle-panel accordionStyles tab-content">
							
							<div class="card mb-3">
								<div class="card-header" role="tab" id="headingOne">
									<a role="button" class="collapsed panel-title text-black"
										data-toggle="collapse" data-core="" href="#${faq.fno }"
										aria-expanded="false" aria-controls="collapse1">
										<h3 class="panel-title-edit mbr-fonts-style">
											<strong>${faq.question }</strong>
										</h3> <span class="sign mbr-iconfont mbri-arrow-down"></span>
									</a>
								</div>
								<div id="${faq.fno }" class="panel-collapse noScroll collapse"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<h4 class="mbr-fonts-style panel-text display-7">${faq.answer }</h4>
									</div>
								</div>
							</div>
							</c:forEach>
						</div>
						
					</div>
				</div>
			</div>
		</section> --%>





		<!-- papination start -->
		<div align="center">
			<ul class="pagination">
				<c:if test="${fb.startPage > fb.pagePerBlock}">
					<li><a
						href="${path}/list/pageNum/1?search=${faq.search}&keyword=${faq.keyword}">
							<span class="glyphicon glyphicon-backward"></span>
					</a></li>
					<li><a
						href="${path}/list/pageNum/${fb.startPage-1}?search=${faq.search}&keyword=${faq.keyword}">
							<span class="glyphicon glyphicon-triangle-left"></span>
					</a></li>
				</c:if>
				<c:forEach var="i" begin="${fb.startPage}" end="${fb.endPage}">
					<c:if test="${i==fb.currentPage}">
						<li class="active"><a
							href="${path}/list/pageNum/${i}?search=${faq.search}&keyword=${faq.keyword}">${i}</a></li>
					</c:if>
					<c:if test="${i!=fb.currentPage}">
						<li><a
							href="${path}/list/pageNum/${i}?search=${faq.search}&keyword=${faq.keyword}">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${fb.endPage < fb.totalPage }">
					<li><a
						href="${path}/list/pageNum/${fb.endPage+1}?search=${faq.search}&keyword=${faq.keyword}">
							<span class="glyphicon glyphicon-triangle-right"></span>
					</a></li>
					<li><a
						href="${path}/list/pageNum/${fb.totalPage}?search=${faq.search}&keyword=${faq.keyword}">
							<span class="glyphicon glyphicon-forward"></span>
					</a></li>
				</c:if>
			</ul>
		</div>
		<!-- 검색 -->
		<form action="${path}/list/pageNum/1" method="post">
			<select name="search">
				<c:forTokens var="item" items="admin_id,question,answer,subcon"
					delims="," varStatus="i">
					<c:if test="${faq.search==item }">
						<option value="${item }" selected="selected">${tit[i.index]}</option>
					</c:if>
					<c:if test="${faq.search!=item }">
						<option value="${item }">${tit[i.index]}</option>
					</c:if>
				</c:forTokens>
			</select> <input type="text" name="keyword" value="${faq.keyword }"> <input
				type="submit" value="확인">
		</form>
		<a href="${path}/insertForm/no/null/pageNum/1" class="btn btn-info">게시글 입력</a>
	</div>
	<div id="ChatDisp"></div>
	<%-- <%@ include file="toggleFooter.jsp"%> --%>
</body>
</html>