<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">

<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var subject = "";
						var area = "";
						//과목검색 체크박스 설정
						subjectCheck = function(object, value) {
							subject = value;
							//과목체크박스 중복방지
							var Obj = document.getElementsByName("subject");
							for (var i = 0; i < Obj.length; i++) {
								if (Obj[i] != object) {
									Obj[i].checked = false;
								}
							}
							$("#pTemp").html("");
							if (area == "") {
								$("#pTemp")
										.append(
												"<a class='btn' data-toggle='collapse' href='#multiCollapseExample1' role='button' aria-expanded='false' aria-controls='multiCollapseExample1' id='areaBtn'>"
														+ subject + "</a>");
								$("#pTemp")
										.append(
												"<a class='btn' data-toggle='collapse' href='#multiCollapseExample2' role='button' aria-expanded='false' aria-controls='multiCollapseExample2' id='areaBtn'>지역선택</a>");
							} else {
								$("#pTemp")
										.append(
												"<a class='btn' data-toggle='collapse' href='#multiCollapseExample1' role='button' aria-expanded='false' aria-controls='multiCollapseExample1' id='areaBtn'>"
														+ subject + "</a>");
								$("#pTemp")
										.append(
												"<a class='btn' data-toggle='collapse' href='#multiCollapseExample2' role='button' aria-expanded='false' aria-controls='multiCollapseExample2' id='areaBtn'>"
														+ area + "</a>");
							}
						}
						//지역검색 체크박스 설정
						areaCheck = function(object, value) {
							area = value;
							//지역체크박스 중복방지
							var Obj = document.getElementsByName("area");
							for (var i = 0; i < Obj.length; i++) {
								if (Obj[i] != object) {
									Obj[i].checked = false;
								}
							}
							$("#pTemp").html("");
							if (subject == "") {
								$("#pTemp")
										.append(
												"<a class='btn' data-toggle='collapse' href='#multiCollapseExample1' role='button' aria-expanded='false' aria-controls='multiCollapseExample1' id='areaBtn'>과목선택</a>");
								$("#pTemp")
										.append(
												"<a class='btn' data-toggle='collapse' href='#multiCollapseExample2' role='button' aria-expanded='false' aria-controls='multiCollapseExample2' id='areaBtn'>"
														+ area + "</a>");
							} else {
								$("#pTemp")
										.append(
												"<a class='btn' data-toggle='collapse' href='#multiCollapseExample1' role='button' aria-expanded='false' aria-controls='multiCollapseExample1' id='areaBtn'>"
														+ subject + "</a>");
								$("#pTemp")
										.append(
												"<a class='btn' data-toggle='collapse' href='#multiCollapseExample2' role='button' aria-expanded='false' aria-controls='multiCollapseExample2' id='areaBtn'>"
														+ area + "</a>");
							}
						}
						var mySwiper = new Swiper('.swiper-container', {
							// 그룹수가 맞지 않을 경우 빈칸으로 메우기
							// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
							loopFillGroupWithBlank : true,
							// If we need pagination
							// 페이징 설정
							pagination : {
								el : '.swiper-pagination',
							},
							// 네비게이션 설정
							// Navigation arrows
							//버튼 클래스명
							navigation : {
								nextEl : '.swiper-button-next',
								prevEl : '.swiper-button-prev',
							}
						})
						link = function() {
							location.href = "/www.IBC.co.kr/InstitutionInfo/reg";
						}
						//검색어 작성했을 때 키보드 이벤트발생
						searchIname.onkeyup = function() {
							var str = "";
							searchIname = $(this).val();
							if (searchIname != "") {
								$("#multiCollapseExample1").show();
								$
										.getJSON({
											url : '/check/searchIname/'
													+ searchIname,
											success : function(result) {
												
												//이벤트가 발생할 때 마다 새로고침하기 위해서
												$("#searchTbody").html("");
												for (var i = 0; i < result.length; i++) {
													str += "<tr>"
															+"<td>"
															+"<img src='/upload/"+result[i].ilogo+"' style='width: 30px; height: 30px' alt='학원로고' class='rounded-circle' />"
															+ result[i].iname
															+ "</td>"
															+"<td>"
															+ result[i].iaddress
															+ "</td>"
															+"<td>"
															+result[i].ievaluation
															+"</td>"
															+ "<td>"
															+ result[i].isubject
															+ "</td></tr>";
												}
												$("#searchTbody").append(str);
												str = "";
											}
										});
							}
						}
					});
</script>
<style type="text/css">
.searchMenu a {
	font-size: 80px;
	border-radius: 30px;
	background-color: white;
	color: grey;
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}
.swiper-container {
	width: 1100px;
	height: 400px;
}
a.visited {
	color: black;
}
a.link {
	color: black;
}
a.active {
	color: black;
}
a.hover {
	color: black;
}
</style>
</head>
<body>

	<div class="container">
		<h4>
			<a href="/www.IBC.co.kr/InstitutionInfo/filter">필터링</a> <a
				href="/www.IBC.co.kr/InstitutionInfo/name">학원명</a>
		</h4>
	</div>
	<div class="searchMenu container">
		<div class="btn-group" role="group" aria-label="Basic example">
			<div class="justify-content-center" style="margin-top: 40px">
				<input class="form-control form-control-lg" type="text"
					placeholder="학원명을 입력해주세요" id="searchIname">
			</div>
		</div>

		<!-- 과목검색 -->
		<div class="row">
			<div class="col">
				<div class="collapse multi-collapse" id="multiCollapseExample1">
					<div class="card card-body">
						<table class="table table-borderless">
							<tbody id="searchTbody">


							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 전체 학원 리스트  -->
	<!-- Slider main container -->
	<div class="swiper-container">
		<br />
		<h3>
			<b>전체학원목록</b>
		</h3>
		<br />
		<c:out value="${amount }" />
		개의 학원
		<button type="button" onclick="link();">임시 학원등록 버튼</button>
		<!-- Additional required wrapper -->
		<div class="swiper-wrapper">
			<!-- Slides -->
			<c:forEach items="${list}" var="list" varStatus="status">
				<div class="swiper-slide">

					<div class="conatainer">
						<div class="mx-auto" style="width: 200px;">
							<img src="/upload/<c:out value='${list.ilogo }'/>" alt="학원로고"
								class="rounded-circle" />
						</div>
						<div class="mx-auto" style="width: 200px;">
							<c:out value="${list.iname }"></c:out>
						</div>
						<div class="mx-auto" style="width: 200px;">
							<b><c:out value="${list.isubject }"></c:out></b>
						</div>
						<div>
							<c:out value="${list.iintro }"></c:out>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>

		<!-- If we need navigation buttons -->
		<div class="swiper-button-prev"></div>
		<div class="swiper-button-next"></div>
	</div>
	<!-- 전체 학원 리스트  -->



	<!-- best5 리스트  -->
	<div class="container">
		<br />
		<h3>
			<b>Best5 학원목록</b>
		</h3>
		<br />
		<table class="table table-borderless">
			<tbody>
				<c:forEach items="${bestlist }" var="bestlist">
					<tr>
						<th scope="row"><img
							src="/upload/<c:out value='${bestlist.ilogo }'/>"
							style="width: 60px; height: 60px" alt="학원로고"
							class="rounded-circle" /><br /> ${bestlist.iname }</th>
						<td>${bestlist.isubject }</td>
						<td>${bestlist.iintro }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 평점 리스트  -->

	<!-- 최신학원 리스트  -->
	<div class="container">
		<br />
		<h3>
			<b>최신 학원목록</b>
		</h3>
		<br />
		<table class="table table-borderless">
			<tbody>
				<c:forEach items="${newlist }" var="newlist">
					<tr>
						<th scope="row"><img
							src="/upload/<c:out value='${newlist.ilogo }'/>"
							style="width: 60px; height: 60px" alt="학원로고"
							class="rounded-circle" /><br /> ${newlist.iname }</th>
						<td>${newlist.isubject }</td>
						<td>${newlist.iintro }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 최신학원 리스트  -->



</body>
</html>