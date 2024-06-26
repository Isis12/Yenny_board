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
html, body {
	width:100%;
	height:100%
}
#wrap {
	padding: 80px 0;
}
#container {
	width: 1100px;
	margin: 0 auto;
}
.page-title {
	margin-bottom: 17px;
}

.page-title a,h2 {
	font-size: 28px;
	color: #333333;
	font-weight: 400;
	text-align: left; 
}
table {
	border-collapse: separate;
	border-spacing: 0;
	line-height:1.5;
}
.table01 {
	font-size: 13px;
	width: 100%;
}
.table01 th {
	text-align: center;
}
.table01 th, .table01 td {
	padding: 14px 0;
	border: 1px solid #ccc;
}
.table01 tbody th{
	padding-left: 28px;
	padding-right: 14px;
	border-top: 1px solid #e7e7e7;
	text-align: left;
	background-color: #f9f7f9;
}
.table01 tbody td{
	border-top: 1px solid #e7e7e7;
	text-align: left;
	padding-left: 20px;
}

.btn_rigth {
	position: relative;
	margin-top: 20px;
	text-align:right;
	/*width: 100%;*/
	/*max-width: 554px;*/
}
.btn_rigth .btn {
	position: relative;
	width: 55px;
	height: 31px;
	padding: 0;
	font-size: 13px;
}

.black {
	background-color: #555;
	border: none;
	color: #fff;
}

.btn:hover{
	background-color: #373737;
}

.mr5 {
	margin-right: 5px;
}

.not-file {
	color: #9E9FA5;
}

/* 댓글 css */
#form-commentInfo {
	margin-top: 15px;
	/*width: 100%;*/
}

#comment-count {
	font-size: 15px;
	margin-bottom: 10px;
}

#reply {
	width: 94%;
	height: 38px;
	padding-left: 12px;
	font-size: 13px;
}

#reply:focus {
	outline: none;	
}

#reply_btn {
	width: 55px;
	height: 37px;
	font-size: 12px;
	border-radius: 4px;
	background: #f9f7f9;
	border: 1px solid #e7e7e7;
}

#voteUp, #voteDown{
    width: 3.5em;
    height: 1.9em;
    background-color: aqua;    
}

#comments{
    margin-top: 10px;
}

.eachComment{   
    width :50%; 
    margin: 10px;  
    padding: 0.5em; 
    border-bottom: 1px solid #c1bcba;
}

.eachComment .name{
    font-size: 1.5em;
    font-weight: bold;
    margin-bottom: 0.3em;
    display: flex;
    justify-content: space-between;
}

.eachComment .inputValue{
    font-size: 1.2em;
    font-style: italic;    
}

.eachComment .time{
    font-size: 0.7em;
    color: #c1bcba;
    font-style: oblique;
    margin-top: 0.5em;
    margin-bottom: 0.5em;
    
}

.eachComment .voteDiv{
    display: flex;
    justify-content: flex-end;
}

.eachComment .deleteComment{
    background-color: red;
    color: aliceblue;
}

/*.reply_view {
	width: 900px;
	margin-top: 100px;
	word-break: break-all;
}*/

.reply_head {
	padding: 20px 0 15px 0;
	border-bottom: 1px solid #ccc;
	font-size: 15px;
}

.dat_view {
	font-size: 13px;
	padding: 15px 0 13px 0;
	border-bottom: solid 1px #ccc;
}

.dap_to {
	padding-top: 10px;
}

.dap_date {
	font-size: 12px;
	padding: 5px 0 4px 0;
}

.rep_me {
	padding-top: 7px;
}

.dat_del_btn {
	color: blue;
	cursor: pointer;
	padding: 2px;
}

.rep_btn {
	color: #333;
	font-size: 13px;
	border-right: 1px solid black;
	padding-right: 4px;
	cursor: pointer;
}

.common-btn:hover {
	color: #ee6a7b;
}

.repUpdate {
	width: 95%;
	height: 30px;
	padding-left: 8px;
	font-size: 13px;
	margin-top: 11px;
}

.repUpdate:focus {
	outline: none;	
}

.repUpdate_btn {
	width: 41px;
	height: 31px;
	font-size: 12px;
	border-radius: 4px;
	background: #f9f7f9;
	border: 1px solid #e7e7e7;
}

/*#closeBtn {
	background: #E72929;
	color: #ffff;
}*/



</style>
</head>
<body>
	<div id="wrap">
		<div id="container">
			<div class="inner">
				<div class="page-title">
					<h2><a href="./boardList">NOTICE</a></h2>
				</div>
				<table class=table01>
					<colgroup>
						<col width="15%">
						<col width="35%">
						<col width="15%">
						<col width="*%">
					</colgroup>
					<tbody id="tbody">
						<tr>
							<th>제목</th>
							<td>${board.b_title}</td>
							<th>조회수</th>
							<td>${board.b_views}</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>${board.b_writer}</td>
							<th>등록일</th>
							<td>${board.b_date}</td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<c:set var="file" value="${board.bfList}"/>
							<c:if test="${empty file}"><td colspan="3" class="not-file">첨부된 파일이 없습니다.</td></c:if>
							<c:if test="${!empty file}">
								<c:forEach var="file" items="${board.bfList}">
									<img src="upload/${file.bf_sysname}" width="50">
									<a href="./download?sysFileName=${file.bf_sysname}&oriFileName=${file.bf_origname}">${file.bf_origname}</a>
								</c:forEach>
							</c:if>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3" style="white-space: pre;">${board.b_contents}</td>
						</tr>
					</tbody>
				</table>
				<div class="btn_rigth mt15">
					<button type="button" class="btn black mr5" onclick="javascript:goBoardList();">목록</button>
					<c:choose>
						<c:when test="${id == board.b_writer}">
							<button type="button" class="btn black mr5" onclick="javascript:modifyBoard(${board.b_num});">수정</button>
							<button type="button" class="btn black mr5" onclick="javascript:deleteContents(${board.b_num});">삭제</button>
						</c:when>
						<c:when test="${id eq 'landey559'}">
							<button type="button" class="btn black mr5" onclick="javascript:deleteContents(${board.b_num});">삭제</button>
						</c:when>
					</c:choose>
				</div>
			</div><br>
			
			<!-- 댓글 -->
			<hr size="1" width="100%">
			
			<div id="form-commentInfo">
				<form id="reply_from" method="post">
					<div id="comment-count">댓글 <span>${replyCnt}</span></div>
					<input type="hidden" name="r_id" value="${board.b_writer}" id="writer">
					<input type="hidden" name="r_bnum" id="rBnum"  value="${board.b_num}">
					<input id="reply" name="r_contents" placeholder="댓글을 입력해 주세요." autocomplete="off">
					<button type="button" id="reply_btn" onclick="commit(${board.b_num})">등록</button>
				</form>
			</div>
			
			<c:if test="${replyCnt != 0}">
				<div id="comments">
					<div class="reply_view">
						<div class="reply_head">댓글목록</div>
						<div id="det_view">
							<c:forEach var="reply" items="${rList}" varStatus="status">
								<div class="dat_view">
									<div><b>${reply.r_id}</b></div>
									<div class="dap_to comt_adit">${reply.r_contents}</div>
									<div class="dap_to dap_date">${reply.r_date}</div>
									<c:choose>
										<c:when test="${id == reply.r_id}">
											<div class="rep_me rep_menu">
												<a class="rep_btn common-btn" href="javascript:updateReply(${status.index});">수정</a>
												<a class="dat_del_btn common-bnt" href="javascript:deleteReply(${reply.r_num});">삭제</a> 
											</div>
										</c:when>
										<c:when test="${id eq 'landey559'}">
											<a class="dat_del_btn common-bnt" href="javascript:deleteReply(${reply.r_num});">삭제</a> 
										</c:when>
									</c:choose>
									<c:if test="${id == reply.r_id}">
										<div id="modifyViews_${status.index}" style="display: none;">
											<form id="modifyFrm_${status.index}" method="post">
												<div>
													<input type="text" class="repUpdate" id="modifyContents_${status.index}" name="r_contents" value="${reply.r_contents}" autocomplete="off">
													<input type="button" id="replyUpdate" class="repUpdate_btn" onclick="modifyReply(${reply.r_num}, ${status.index});" value="수정">
													<!-- <input type="button" id="closeBtn" class="repUpdate_btn modify_close" value="닫기">-->
												</div>
											</form>
										</div>
									</c:if>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</c:if>
		</div>
	</div>
</body>
<script type="text/javascript">
//게시판 - 목록페이지 이동
function goBoardList(){
	location.href = "./boardList";
};


//게시판 - 수정페이지 이동
function modifyBoard(bNum) {
	location.href = "./modifyBoard?bNum="+bNum;
};


function deleteContents(bNum) {
	var bnum = bNum;
	console.log(bnum);
	
	var confirmflag = confirm("게시물을 삭제하시겠습니까?");
	
	//확인버튼
	if(confirmflag) {
	
		$.ajax({
			url: '/ye/rest/board/deleteBoard',
			type: 'post',
			data: {bnum:bnum},
			success: function(data) {
				console.log("성공");
				if(data == 1) {
					alert("게시물이 삭제되었습니다.");
					location.href = '/ye/board/boardList';
				}else {
					alert("오류가 발생하였습니다. \n관리자에게 문의해주십시오.");
				}
			},
			error: function(err) {
				console.log("실패");
				alert("오류가 발생되었습니다. \n관리자에게 문의해주십시오.");
			}
		})
	}else {
		//취소버튼
		location.reload();
	}
};


function commit(bNum) {
	var obj = $("#reply_from").serialize();
	var reply = $("#reply").val();
	
	console.log(obj);
	
	if(reply == "" || reply == null) {
		alert("댓글을 입력해주세요.");
		reply.focus();
		return false;
	}
	
	$.ajax({
		url: '/ye/rest/board/insertReply',
		type: 'post',
		data: obj,
		success: function(data) {
			location.reload();
		},
		error: function(err) {
			console.log(err);
			alert("오류가 발생하였습니다.\n관리자에게 문의해주십시오.");
		}
	})
};


function deleteReply(rNum) {
	var num = rNum;
	var Bnum = $("#rBnum").val();
	console.log("rBnum= " + Bnum);
	console.log("num= " + num );
	
	var confirmflag = confirm("댓글을 삭제하시겠습니까?");
	
	//확인버튼
	if(confirmflag) {
		$.ajax({
			url: '/ye/rest/board/deleteReply',
			type: 'post',
			data: {num:num, Bnum:Bnum},
			dataType: 'json',
			success: function(data){
				console.log("성공");
				if(data == 1) {
					alert("댓글이 삭제되었습니다.");
					location.reload();
				}else {
					alert("오류가 발생하였습니다.\n관리자에게 문의해주십시오.");
				}
			},
			error: function(err){
				console.log("실패");
				alert("오류가 발생하였습니다.\n관리자에게 문의해주십시오.");
			}
		})
	}else {
		//취소버튼
		location.reload();
	}
}


//댓글수정 버튼
function updateReply(index) {
	var modify = document.getElementById("modifyViews_"+index);
	var txtfocus = document.getElementById("modifyContents_"+index);
	var value = txtfocus.value;
	
	$(modify).find('div').each(function() {
		if(modify.style.display === 'block') {
			modify.style.display = 'none';
		}else {
			modify.style.display = 'block';
			txtfocus.focus();
			txtfocus.value = '';
			txtfocus.value = value;
		}
	});
}


function modifyReply(rNum, index) {
	var num = rNum;
	var bnum = $("#rBnum").val();
	var r_contents = $("#modifyContents_"+index).val();
	
	//console.log("r_contents: " + r_contents);
	//console.log("num: " + num);
	//console.log("bnum: " + bnum);
	//console.log("obj: " + obj);
	
	$.ajax({
		url: '/ye/rest/board/updateReply',
		type: 'post',
		data: {r_contents:r_contents, num:num, bnum:bnum},
		dataType: 'json',
		success: function(data) {
			//console.log("성공");
			if(data == 1) {
				alert("댓글 수정하였습니다.");
				location.reload();
			}else {
				alert("오류가 발생하였습니다. \n관리자에게 문의해주십시오.");
			}
		},
		error: function(err) {
			console.log("실패");
			alert("오류가 발생하였습니다. \n관리자에게 문의해주십시오.");
		}
	});
}


</script>
</html>