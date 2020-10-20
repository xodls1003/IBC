<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<!-- ckeditor js파일 연결 -->
<script src="/resources/ckeditor/ckeditor.js"></script>


<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Forum Register</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->





<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">Forum Register</div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				<form role="form" action="/forum/register"
					method="post">
					<div class="form-group">
						<label>Title</label> <input class="form-control" name='ftitle'>
					</div>

					<div class="form-group">
						<label>Text area</label>
						<textarea class="form-control" rows="10" name='fcontent'
							id="editor"></textarea>

					</div>

					<div class="form-group">
						<label>Writer</label> <input class="form-control" name='fwriter'>
					</div>
					<button type="submit" class="btn btn-default">Submit
						Button</button>
					<button type="reset" class="btn btn-default">Reset Button</button>
				</form>

			</div>
			<!--  end panel-body -->

		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->
<script>

 var ckeditor_config = {
   resize_enaleb : false,
   enterMode : CKEDITOR.ENTER_BR,
   shiftEnterMode : CKEDITOR.ENTER_P,
   filebrowserUploadUrl : "/admin/ckUpload"
   
 };
 
 CKEDITOR.replace("editor", ckeditor_config);
</script>






<%@include file="../includes/footer.jsp"%>
