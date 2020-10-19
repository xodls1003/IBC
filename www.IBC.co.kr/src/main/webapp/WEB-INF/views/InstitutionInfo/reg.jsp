<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL사용하기 위한 태그 : 사용할 태그는 코어태그! -->
<!-- 태그는 대부분 'c'  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- JSTL사용하기 위한 태그 : 사용할 태그는 함수태그! -->
<!-- 태그는 대부분 'fn'  -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	$(document).ready(
			function() {
				var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)");
				var maxSize = 5242880;
				var inuptFile = "";
				var files = "";
				var formData = new FormData();

				var iname = "";
				var ilogo = "";
				var iaddress = "";
				var iphonenum = "";
				var iintro = "";
				var ihomepage = "";
				var iestablishment = "";
				var isubject = "";
				var iarea = "";

				var inameCheck = "";

				function checkExtenSize(fileName, fileSize) {
					if (fileSize >= maxSize) {
						alert("파일 사이즈가 큽니다");
						return false;
					}
					if (regex.test(fileName)) {
						alert("해당 파일은 업로드 할 수 있는 파일이 아닙니다");
						inuptFile = $("input[name='ilogo']").val("");
						return false;
					}
					return true;
				}
				//이미지 확인
				$("#ilogo").change(
						function() {
							inuptFile = $("input[name='ilogo']");
							files = inuptFile[0].files;
							//사이즈와 이름 체크
							for (var i = 0; i < files.length; i++) {
								if (!checkExtenSize(files[i].name,
										files[i].size)) {
									return false;
								}
								formData.append("uploadFile", files[i]);
							}

							if (this.files && this.files[0]) {
								var reader = new FileReader;
								reader.onload = function(data) {
									$(".select_img img").attr("src",
											data.target.result).width(161);
								}
								reader.readAsDataURL(this.files[0]);
							}
						});

				//학원이름 중복확인
				$("#inameBtn").on("click", function() {
					iname = $("input[name='iname']").val();
					if (iname == "") {
						alert("공백없이 입력해주세요");
						return false;
					}
					$.ajax({
						url : '/check/iname/' + iname,
						type : 'post',
						success : function(result) {
							if (result == "success") {
								inameCheck = 'check';
								console.log(inameCheck);
								alert("등록가능한 학원입니다");
							} else {
								inameCheck = '';
								console.log(inameCheck);
								alert("등록되어있는 학원입니다");
							}
						}
					});
				});

				//빈칸 체크
				nullCheck = function() {
					ilogo = $("input[name='ilogo']").val();
					iaddress = $("input[name='iaddress']").val();
					iphonenum = $("input[name='iphonenum']").val();
					iintro = $("input[name='iintro']").val();
					ihomepage = $("input[name='ihomepage']").val();
					iestablishment = $("input[name='iestablishment']").val();
					isubject = $("input[name='isubject']").val();
					iarea = $("input[name='iarea']").val();
					if (iname == "" || ilogo == "" || iaddress == ""
							|| iphonenum == "" || iintro == ""
							|| ihomepage == "" || iestablishment == ""
							|| isubject == "" || iarea == "") {
						alert("빈칸 없이 입력해주세요");
					} else {
						$("#actionForm").submit();
					}
				}

			});
</script>
</head>
<body>
	<div class="container">
		학원등록 <br /> <br />
		<c:if test="${fail ne null } ">
			<script type="text/javascript">
				alert("등록이 실패되었습니다");
			</script>
		</c:if>
		<form action="/www.IBC.co.kr/InstitutionInfo/reg" method="post" enctype="multipart/form-data"
			id="actionForm">
			<div class="form-group">
				<label for="exampleFormControlInput1">학원이름</label>
				<div class="input-group mb-3">
					<input type="text" class="form-control" name="iname" id="iname">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="button" id="inameBtn">중복확인</button>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">로고</label> <input type="file"
					name="ilogo" id="ilogo" multiple="multiple"> <br />
				<div class="select_img">
					<img src="" />
				</div>
			</div>

			<div class="form-group">
				<label for="exampleFormControlInput1">주소</label> <input type="text"
					class="form-control" name="iaddress">
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">홈페이지</label> <input
					type="text" class="form-control" name="ihomepage">
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">전화번호</label> <input type="tel"
					class="form-control" name="iphonenum"
					pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="-까지 입력해주세요">
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">설립날짜</label> <input
					type="date" class="form-control" name="iestablishment">
			</div>
			<div class="form-group">
				<label for="exampleFormControlSelect1">과목</label> <select
					class="form-control" id="isubject" name="isubject">
					<option selected="selected">선택</option>
					<option value="IT·프로그래밍">IT·프로그래밍</option>
					<option value="VR·게임">VR·게임</option>
					<option value="기계">기계</option>
					<option value="건축·인테리어">건축·인테리어</option>
					<option value="웹디자인">웹디자인</option>
					<option value="자격증">자격증</option>
					<option value="편집·크리에이티브">편집·크리에이티브</option>
					<option value="세무회계">세무회계</option>
				</select>
			</div>
			<div class="form-group">
				<label for="exampleFormControlSelect1">지역</label> <select
					class="form-control" id="iarea" name="iarea">
					<option selected="selected">선택</option>
					<option value="서울">서울</option>
					<option value="경기">경기</option>
					<option value="인천">인천</option>
					<option value="강원">강원</option>
					<option value="충청">충청</option>
					<option value="전라">전라</option>
					<option value="경상">경상</option>
					<option value="제주">제주</option>
				</select>
			</div>

			<div class="form-group">
				<label for="exampleFormControlTextarea1">소개</label>
				<textarea class="form-control" id="iintro" name="iintro" rows="3"></textarea>
			</div>
			<div class="form-group">
				<button type="button" id="regBtn" class="w3-button"
					onclick="nullCheck();">가입</button>
			</div>
		</form>
	</div>
</body>
</html>