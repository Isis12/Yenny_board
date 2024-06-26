<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style type="text/css">
* {
	padding: 0;
	margin: 0;
	list-style: none;
	text-decoration: none;
	box-sizing: border-box;
}

html, body {
	width: 100%;
	height: 100%;
}

#wrap{
	padding: 80px 0;
}

.container {
	width: 1100px;
	margin: 0 auto;
}

.page-title {
	margin-bottom: 37px;
}

.page-title a, h3 {
	font-size: 28px;
	color: #333333;
	font-weight: 400;
	text-align: center;
}

.page-title h4 {
	font-size: 20px;
	text-align: left;
	color: #333333;
	font-weight: normal;
	margin-top: 70px;
}

.page-title p{
	font-size: 12px;
	margin: 3px;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

.board-table {
	font-size: 13px;
	width: 100%;
	/*border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;*/
}

.board-table a {
	color: #333;
	display: inline-block;
	line-height: 1.4;
	font-weight: 400;
	word-break: break-all;
	vertical-align: middle;
}

.board-table th {
	border-bottom: 1px solid #ccc;
	background: #f9f7f9;
	text-align: center;
	width: 107px;
	padding: 12px;
}

.board-table th, .board-table td {
	padding: 14px 9px;
}

.board-table td {
	padding: 8px;
	text-align: center;
	padding-left: 17px;
	border-bottom: 1px solid #ccc;
}

#memCnt {
	font-size: 13px;
	margin-bottom: 8px;
}

select {
	width: 77px;
	height: 26px;
	cursor: pointer;
}

select:focus{
	outline: none;
}

.permuteBtn {
	width: 51px;
	height: 31px;
	background: #555;
	color: #fff;
	border-radius: 4px;
	border: 1px solid #ccc;
	cursor: pointer;
}

.permuteBtn:hover {
	background: #373737;
}

#sub-menu {
	font-size: 13px;
	margin-bottom: -19px;
	text-align: right;
}

#sub-menu a {
	color: #333;
}

#sub-menu a:hover {
	color: #ee6a7b;
	text-decoration: underline;
}

.secessionBtn {
	width: 63px;
	height: 31px;
	margin: 6px;
	border-radius: 4px;
	background: #365486;
	color: #fff;
	border: 1px solid #ccc;
}
	
.secessionBtn:hover {
	background: #2D3250;
}

.pointBtn {
	margin-left: 9px;
	background: #555;
	color: #fff;
	border-radius: 8px;
	font-size: 11px;
	border: 1px solid #ccc;
	padding: 2px;
}

#modalOpen:hover {
	text-decoration: underline;
	color: #CF0A0A;
}

/* 모달팝업 */
.modal_btn {
	display: block;
	margin: 40px auto;
	padding: 10px 20px;
	background-color: royalblue;
	border: none;
	border-radius: 5px;
	color: #fff;
	cursor: pointer;
	transition: box-shadow 0.2s;
}

.modal_btn:hover {
	box-shadow: 3px 4px 11px 0px #00000040;	
}

#modal-list {
	display: none;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100vh;
	overflow: hidden;
	background: rgba(0, 0, 0, 0.5);
}

#modal-list.open {
	display: block;
}

</style>
</head>
<body>
	<div id="wrap">
		<div class="container">
			<div class="page-title">
				<h3><a href="/ye/board/boardList">NOTICE</a></h3>
				<h4>회원관리</h4>
				<p>회원의 권한을 변경하거나 계정을 삭제할 수 있습니다.</p>
			</div>
			<div id="sub-menu">
				<a href="/ye/admin/memWithdrawal">탈퇴회원</a>
			</div>
			<div id="memCnt">회원 수 : <span>${memCnt}</span></div>
			<div id="board-list">
				<div class="container">
					<table class="board-table">
						<thead>
							<tr>
								<th scope="col" style="width:63px;">번호</th>
								<th scope="col" style="width:69px;">이름</th>
								<th scope="col" style="width:58px;">아이디</th>
								<th scope="col">가입일</th>
								<th scope="col" style="width:49px">등급</th>
								<th scope="col" style="width:91px">등급변경</th>
								<th scope="col">-</th>
							</tr>
						</thead>
						<tbody class="tbody"></tbody>
					</table>
				</div>
			</div>
			<!-- Modal -->
			<div id="modal-list">
				<div class="container">
					<div id="modal_popup"></div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
var aList = ${aList};

console.log(aList);

$(document).ready(function() {
	var str="";
	
	for(var i=0; i<aList.length; i++) {
		var type = aList[i].m_gcode;
		
		str+="<tr>";
		str+="<td>"+aList[i].RN+"<input type='hidden' id='memId_"+aList[i].RN+"' value='"+aList[i].m_id+"'></td>";
		str+="<td>"+aList[i].m_name+"</td>";
		str+="<td><a href='javascript:modalLink("+aList[i].RN+")'; id='modalOpen'>"+aList[i].m_id+"</a></td>";
		str+="<td>"+aList[i].m_date+"</td>";
		str+="<td>"+aList[i].g_name+"</td>";
		str+="<td><select name='m_gcode' id='gcode_"+aList[i].RN+"'><option value='A'>브론즈</option>";
		str+="<option value='B'>실버</option>";
		str+="<option value='C'>골드</option><option value='G'>관리자</option></select></td>";
		str+="<td><button type='button' class='permuteBtn' onclick='permute("+aList[i].RN+")'>변경</button>";
		str+= "<button type='button' class='secessionBtn' onclick='secession("+aList[i].RN+")'>회원탈퇴</button></td>";
		str+="</tr>";
	}
	$(".tbody").append(str);
})

function permute(index) {
	var idx = document.getElementById("gcode_"+index);
	var code = idx.value;
	var id = $("#memId_"+index).val();
	
	console.log(code);
	console.log(id);
	
	$.ajax({
		url: '/ye/admin/updateGrade',
		type: 'post',
		data: {code: code, id:id},
		success: function(data) {
			console.log("성공");
			alert('등급이 변경되었습니다.');
			location.reload();
		},
		error: function(err) {
			console.log("실패");
			alert("등급변경 실패햐였습니다.");
		}
	})
}

function modalLink(index) {
	var m_id = $("#memId_"+index).val();
	
	$("#modal-list").addClass('open');
		
	$.ajax({
		type: 'get',
		url: '/ye/admin/getModalInfo',
		data: {m_id:m_id},
		dataType: 'html',
		success: function(data) {
			$("#modal_popup").html(data);
		},
		error: function(err) {
			console.log("실패");
		}
	})
}

function secession(index) {
	var id = $("#memId_"+index).val();
	console.log(id);
	
	$.ajax({
		url: '/ye/admin/MemSecession',
		type: 'post',
		data: {id:id},
		success: function(data) {
			console.log("성공");
			alert(id+"님의 회원정보를 탈퇴하였습니다. \n탈퇴회원 목록에서 최종탈퇴해주십시오.");
			location.reload();
		},
		error: function(err) {
			console.log(err);
		}
	})
}

</script>
</html>