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
}

.info_detail {
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

.bt_wrap a.on:hover {
	background: #373737;
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

.check-input {
	cursor: pointer;
}

.chkBox_s {
	display: inline-block;
	/*margin-left: 15px;*/
}

.chkBox_a {
	display: inline-block;
	margin-left: 15px;
}

.chkBox_c {
	display: inline-block;
}

#checkId {
	display: none;
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
							<input type="hidden" id="bnum" value="${board.b_num}">
						</div>
						<div class="title">
							<div class="title_dl">
								<span class="title_dt">제목</span>
								<div class="title_dd"><input type="text" id="bTitle" name="b_title" placeholder="제목을 작성해주세요."></div>
							</div>
						</div>
						<div class="info">
							<div class="info_dl">
								<span class="info_dt" id="write">작성자</span>
								<div class="info_dd"><input type="text" name="b_writer" value="${id}" readonly placeholder="아이디를 작성해주세요."></div>
							</div>
							<div class="info_dl">
								<span class="info_dt">첨부파일</span>
								<div class="info_dd form-group form_file">
									<input class="form-control form_point_color01" type="text" title="첨부된 파일명" style="width: 250px;" readonly placeholder="선택된 파일이 없습니다.">
									<input type="hidden" id="fileCheck" name="fileCheck" value="0">
									<span class="file_load">
										<input type="file" id="find_file01" name="files">
										<label class="btn-default" for="find_file01">찾아보기</label>
									</span>
								</div>
							</div>
							
						</div>
						<div class="info info_detail">
							<div class="info_dl">
								<span class="info_dt">비밀글 여부</span>
								<div class="info_dd">
									<div class="icheck-primary chkBox_c">
										<input type="checkbox" name="b_type" class="check-input" id="checkbox_C" value="C" checked style="display: none;">
									</div>
									<div class="icheck-primary chkBox_s">
										<input type="checkbox" name="b_type" class="check-input" id="checkbox_S" value="S">
										<label for="checkbox_S" class="check-input">비밀글</label>
									</div>
									<c:if test="${mb.g_name == '관리자'}">
										<div class="icheck-primary chkBox_a">
											<input type="checkbox" name="b_type" class="check-input" id="checkbox_A" value="A">
											<label for="checkbox_A" class="check-input">공지사항</label>
										</div>
									</c:if>
								</div>
							</div>
							<div class="info_dl">
								<span class="info_dt">비밀번호</span>
								<div class="info_dd"><input type="password" name="b_pw" id="checkId" autocomplete="off" placeholder="4~10자 이내"></div>
							</div>
						</div>
						<div class="cont">
							<textarea maxlength="100" name="b_contents" id="bContents" placeholder="내용입력"></textarea>
						</div>
					</div>
					<div class="bt_wrap">
						<a href="javascript:writeBoard();" class="on">등록</a>
						<a href="./boardList">취소</a>
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

function writeBoard() {
	var title = $("#bTitle").val();
	var content = $("#bContents").val();
	var obj = $("#boardDate").serialize();
	
	//공백체크
	if(title == "" || title == null) {
		alert("제목을 입력해주세요.");
		title.focus();
		return false;
	}else if(content == "" || content == null) {
		alert("본문을 입력해주세요.");
		content.focus();
		return false;
	};
	
	
	$.ajax({
		url: '/ye/rest/board/writeBoard',
		type: 'post',
		data: obj,
		dataType: 'json',
		success: function(data) {
			console.log("성공");
			if(data == 1) {
				alert("게시물이 등록되었습니다.");
				location.href = "./boardList";
			}else {
				alert("오류가 발생하였습니다.\n관리자에게 문의해주십시오.");
			}
		},
		error: function(err) {
			console.log("실패");
			alert("오류가 발생하였습니다. \n관리자에게 문의하십시오. ");
		}
	})
}

$(document).ready(function() {
	var boxC = document.querySelector("#checkbox_C");
	var boxS = document.querySelector("#checkbox_S");
	var boxA = document.querySelector("#checkbox_A");
	
	var checkPw = document.getElementById("checkId");
	
	$("#checkbox_C").click(function() {
		if(boxC.checked == true) {
			boxS.checked = false;
			boxA.checked = false;
		}
	});
	
	$("#checkbox_S").click(function() {
		if(boxS.checked == true) {
			checkPw.style.display = "block";
			boxC.checked = false;
			boxA.checked = false;
		}else {
			checkPw.style.display = "none";
			boxC.checked = true;
		}
	});
	
	$("#checkbox_A").click(function() {
		if(boxA.checked == true) {
			checkPw.style.display = "none";
			boxC.checked = false;
			boxS.checked = false;
		}else {
			boxC.checked = true;
		}
	});
});


</script>
</html>