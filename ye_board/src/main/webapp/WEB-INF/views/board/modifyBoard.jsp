<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
* {
	padding: 0;
	margin: 0;
	list-style: none;
	text-decoration: none;
	box-sizing: border-box;
}

#wrap {
	padding: 112px 0;
}

.container {
	width: 1100px;
	margin: 0 auto;
}

.page-title {
	margin-bottom: 50px;
	margin-top: 40px;
}

.page-title a, h2 {
	font-size: 34px;
	color: #333333;
	font-weight: 400;
	text-align: center;
}

.board_write {
	border-top: 1px solid #ccc;
	margin-left: 90px;
}

.board_write .title,
.board_write .info {
	padding: 15px;
}

.board_write .info {
	border-top: 1px dashed #ddd;
	border-bottom: 1px solid #ccc;
}

.title_dl {
	font-size: 0;
}

.info_dl {
	display: inline-block;
	width: 49%;
	vertical-align: middle;
}

.title_dt, .title_dd, .info_dt, .info_dd {
	display: inline-block;
	vertical-align: middle;
	font-size: 13px;
}

.title_dt, .info_dt {
	width: 100px;
}

.title_dd {
	width: calc(100% - 100px);
}

.title input[type="text"],
.info input[type="text"],
.info input[type="password"] {
	padding: 10px;
 	box-sizing: border-box;
  	width: 133%;
}

.title input[type="text"] {
  	width: 84%;
}

input:focus {
	outline: none;
}

textarea:focus {
	outline: none;
}

#write {
	margin-left: -4px;
}

.cont {
  	border-bottom: 1px solid #ccc;
}

.cont textarea {
  	display: block;
  	width: 100%;
  	height: 380px;
  	box-sizing: border-box;
  	border: 0;
  	resize: none;
  	padding: 24px 21px;
  	font-family: arial;
}

.bt_wrap {
  	margin-top: 30px;
  	text-align: center;
  	font-size: 0;
}

.bt_wrap a {
  	display: inline-block;
  	min-width: 80px;
  	margin-left: 10px;
  	padding: 10px;
  	border: 1px solid #000;
  	border-radius: 2px;
  	color: #000;
  	font-size: 14px;
}

.bt_wrap a:first-child {
  	margin-left: 0;
}

.bt_wrap a.on {
  	background: #555;
  	color: #fff;
}

.form-group {
	display: inline-block;
	margin-bottom: 0;
	/*margin-top: 27px;*/
	vertical-align: middle;
}

.form-control {
	display: inline-block;
	width: 100%;
	height: 30px;
	font-size: 12px;
	line-height: 1.42857;
	color: rgb(85, 85, 85);
	background-color: rgb(255, 255, 255);
	background-image: none;
	box-shadow: rgba(0, 0, 0, 0.0745098) 0 1px 1px inset;
	padding: 6px 9px;
	border: 1px solid rgb(204, 204, 204);
	border-image: initial;
	border-radius: 2px;
 	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.file_dt {
	display: inline-block;
	vertical-align: middle;
	font-size: 13px;
	margin-left: -37px;
	margin-right: 15px;
}

.form-control[readonly],
fieldset[disabled] .form-control {
  	/*background-color: rgb(238, 238, 238);*/
  	opacity: 1;
  	height: 38px;
}

.form_file .file_load {
	display: inline-block;
	position: relative;
	width: 65px;
	height: 31px;
	cursor: pointer;
}

.form_file .file_load [type="file"] {
	display: inline-block;
	position: absolute;
	width: inherit;
	height: inherit;
	z-index: 1;
	opacity: 0;
}

.form_file .file_load label {
	position: relative;
	z-index: 5;
	cursor: pointer;
	height: 35px;
	padding-top: 9px;
}

.btn-default {
	display: inline-block;
  	margin-bottom: 0;
  	font-weight: normal;
  	text-align: center;
  	vertical-align: middle;
  	touch-action: manipulation;
  	cursor: pointer;
  	background-image: none;
  	white-space: nowrap;
  	font-size: 12px;
  	user-select: none;
  	border: 1px solid rgb(204, 204, 204);
  	background-color: #555;
  	/*background-color: rgb(255, 255, 255);*/
  	border-image: initial;
  	padding: 6px 9px;
  	border-radius: 2px;
  	color: #ffff;
  	/*color: rgb(51, 51, 51);*/
}
</style>
</head>
<body>
	<div id="wrap">
		<div class="container">
			<div class="inner">
				<div class="page-title">
					<h2><a href="./boardList">NOTICE</a></h2>
				</div>
			</div>
			<form id="boardDate" enctype="multipart/form-data">
				<div class="board_write_wrap">
					<div class="board_write">
						<div>
							<input type="hidden" id="bnum" name="b_num" value="${board.b_num}">
						</div>
						<div class="title">
							<div class="title_dl">
								<span class="title_dt">제목</span>
								<div class="title_dd"><input type="text" name="b_title" placeholder="제목을 작성해주세요." value="${board.b_title}"></div>
							</div>
						</div>
						<div class="info">
							<div class="info_dl">
								<span class="info_dt" id="write">작성자</span>
								<div class="info_dd"><input type="text" value="${id}" readonly placeholder="아이디를 작성해주세요."></div>
							</div>
							<!-- <div class="info_dl">
								<span class="info_dt">비밀번호</span>
								<div class="info_dd"><input type="password"></div>
							</div>-->
						
							<div class="form-group form_file">
								<span class="file_dt">첨부파일</span>
								<input class="form-control form_point_color01" type="text" title="첨부된 파일명" style="width: 250px;" readonly placeholder="선택된 파일이 없습니다.">
								<input type="hidden" id="fileCheck" name="fileCheck" value="0">
								<span class="file_load">
									<input type="file" id="find_file01" name="files">
									<label class="btn-default" for="find_file01">찾아보기</label>
								</span>
							</div>
						</div>
						<div class="cont">
							<textarea maxlength="100" name="b_contents" placeholder="내용입력">${board.b_contents}</textarea>
						</div>
					</div>
					<div class="bt_wrap">
						<a href="javascript:modifyContent(${board.b_num});" class="on">수정</a>
						<a href="./boardContents?bNum=${board.b_num}">취소</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
//input-file 커스텀 - 파일명 붙이기
$(document).ready(function() {
	$("#find_file01").on('change', function() {
		var fileName = $("#find_file01").val();
		$(".form_point_color01").val(fileName);
	});
})

function modifyContent(bNum) {
	var obj = $("#boardDate").serialize();
	var num = bNum;
	var title = $('input[name=b_title]').val();
	var contents = $('textarea[name=b_contents]').val();
	
	//console.log("b_title: " + title);
	//console.log("b_contnets: " + contents);
	
	//공백체크
	if(title == "" || title == null) {
		alert("제목을 입력해주세요.");
		title.focus();
		return false;
	}else if(contents == "" || contents == null) {
		alert("본문을 입력해주세요.");
		contents.focus();
		return false;
	};
	
	$.ajax({
		url: '/ye/rest/board/modifyContent',
		type: 'post',
		data: obj,
		dataType: 'json',
		success: function(data) {
			console.log("성공");
			if(data == 1) {
				alert("게시물이 수정되었습니다.");
				location.href = "./boardContents?bNum="+num;
			}else {
				alert("오류가 발생하였습니다.\n관리자에게 문의해주십시오.");
			}
		},
		error: function(err) {
			console.log("실패");
			alert("오류가 발생하였습니다.\n관리자에게 문의해주십시오.");
		}
	})
}


</script>
</html>