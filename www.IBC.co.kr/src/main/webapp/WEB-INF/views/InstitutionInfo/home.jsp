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
	width: 1200px;
	height: 400px;
}
</style>
</head>
<body>
	<div class="searchMenu container">
		<div class="btn-group" role="group" aria-label="Basic example">
			<div class="d-flex justify-content-center" style="margin-top: 40px">
				<p id="pTemp">
					<a class="btn" data-toggle="collapse" href="#multiCollapseExample1"
						role="button" aria-expanded="false"
						aria-controls="multiCollapseExample1" id="subjectBtn">과목선택</a> <a
						class="btn" data-toggle="collapse" href="#multiCollapseExample2"
						role="button" aria-expanded="false"
						aria-controls="multiCollapseExample2" id="areaBtn">지역선택</a>

				</p>
			</div>
		</div>

		<!-- 과목검색 -->
		<div class="row">
			<div class="col">
				<div class="collapse multi-collapse" id="multiCollapseExample1">
					<div class="card card-body">
						<table class="table table-borderless">

							<tbody>
								<tr>

									<td><input type="checkbox" name="subject"
										aria-label="Checkbox for following text input"
										id="checkboxValue" value="IT·프로그래밍"
										onclick="subjectCheck(this,this.value);"> IT·프로그래밍</td>
									<td><input type="checkbox" name="subject"
										aria-label="Checkbox for following text input"
										id="checkboxValue" value="VR·게임"
										onclick="subjectCheck(this,this.value);"> VR·게임</td>
									<td><input type="checkbox" name="subject"
										aria-label="Checkbox for following text input"
										id="checkboxValue" value="기계"
										onclick="subjectCheck(this,this.value);"> 기계</td>

								</tr>
								<tr>
									<td><input type="checkbox" name="subject"
										aria-label="Checkbox for following text input"
										id="checkboxValue" value="건축·인테리어"
										onclick="subjectCheck(this,this.value);"> 건축·인테리어</td>
									<td><input type="checkbox" name="subject"
										aria-label="Checkbox for following text input"
										id="checkboxValue" value="웹디자인"
										onclick="subjectCheck(this,this.value);"> 웹디자인</td>
									<td><input type="checkbox" name="subject"
										aria-label="Checkbox for following text input"
										id="checkboxValue" value="자격증"
										onclick="subjectCheck(this,this.value);"> 자격증</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="subject"
										aria-label="Checkbox for following text input"
										id="checkboxValue" value="편집·크리에이티브"
										onclick="subjectCheck(this,this.value);"> 편집·크리에이티브</td>
									<td><input type="checkbox" name="subject"
										aria-label="Checkbox for following text input"
										id="checkboxValue" value="세무회계"
										onclick="subjectCheck(this,this.value);"> 세무회계</td>

								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- 과목검색 -->

		<!-- 지역검색 -->
		<div class="row">
			<div class="col">
				<div class="collapse multi-collapse" id="multiCollapseExample2">
					<div class="card card-body">
						<table class="table table-borderless">
							<tbody>
								<tr>
									<td><input type="checkbox" name="area"
										aria-label="Checkbox for following text input"
										id="checkboxValue" value="서울"
										onclick="areaCheck(this,this.value);"> 서울</td>
									<td><input type="checkbox" name="area"
										aria-label="Checkbox for following text input"
										id="checkboxValue" value="경기"
										onclick="areaCheck(this,this.value);"> 경기</td>
									<td><input type="checkbox" name="area"
										aria-label="Checkbox for following text input"
										id="checkboxValue" value="인천"
										onclick="areaCheck(this,this.value);"> 인천</td>


								</tr>
								<tr>
									<td><input type="checkbox" name="area"
										aria-label="Checkbox for following text input"
										id="checkboxValue" value="강원"
										onclick="areaCheck(this,this.value);"> 강원</td>

									<td><input type="checkbox" name="area"
										aria-label="Checkbox for following text input"
										id="checkboxValue" value="충청"
										onclick="areaCheck(this,this.value);"> 충청</td>
									<td><input type="checkbox" name="area"
										aria-label="Checkbox for following text input"
										id="checkboxValue" value="전라"
										onclick="areaCheck(this,this.value);"> 전라</td>

								</tr>
								<tr>
									<td><input type="checkbox" name="area"
										aria-label="Checkbox for following text input"
										id="checkboxValue" value="경상"
										onclick="areaCheck(this,this.value);"> 경상</td>
									<td><input type="checkbox" name="area"
										aria-label="Checkbox for following text input"
										id="checkboxValue" value="제주"
										onclick="areaCheck(this,this.value);"> 제주</td>

								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- 지역검색 -->
	</div>
	<!-- 전체 학원 리스트  -->
	<!-- Slider main container -->
	<div class="swiper-container">
		<!-- Additional required wrapper -->
		<div class="swiper-wrapper">
			<!-- Slides -->
			<div class="swiper-slide">
				<c:forEach items="${list}" var="list" varStatus="status">
					<div class="d-flex bd-highlight mb-2"
						style="float: left; width: 33%; padding: 10px;">
						<c:out value="${status.current.ino }"></c:out>
						<c:out value="${status.count }"></c:out>
						<div class="p-2 bd-highlight">
							<c:out value="${list.iname }"></c:out>
						</div>
						<div class="p-2 bd-highlight">
							<c:out value="${list.iintro }"></c:out>
						</div>
						<div class="p-2 bd-highlight">
							<c:out value="${list.iname }"></c:out>
						</div>
					</div>
				</c:forEach>

			</div>

		</div>

		<!-- If we need navigation buttons -->
		<div class="swiper-button-prev"></div>
		<div class="swiper-button-next">
			<script type="text/javascript">
				
			$.ajax({
			var currentPage = $("#currentPage");
			
				currentPage =currentPage.val() + 1;

					url : '/www.IBC.co.kr/InstitutionInfo/filter'+ currentPage,
					type : 'post',
					success : function(result) {
						$(".swiper-slide").clone().appendTo(".swiper-wrapper");
					}
				});
			</script>
		</div>
	</div>

	<form action="" id="actionForm">
		<input type="hidden" name="currentPage" id="currentPage" value="${page.currentPage}" />
	</form>

</body>
</html>