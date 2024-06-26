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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
table {
  	border-collapse: collapse;
  	border-spacing: 0;
}

section.notice {
  	padding: 80px 0;
}

.page-title {
  	margin-bottom: 70px;
}

.page-title h3 {
  	font-size: 28px;
  	color: #333333;
  	font-weight: 400;
  	text-align: center;
}

#board-minfo {
	position: relative;
	bottom: 12px;
  	width: 1100px;
  	margin: 0 auto;
}

.member-table {
	border-collapse: collapse;
	font-size: 13px;
	width: 24%;
  	border-top: 1px solid #ccc;
  	border-bottom: 1px solid #ccc;
}

.member-table th {
	background-color: #f9f7f9;
	text-align: center;
	width: 107px;
	border: 1px solid #ccc;
	padding: 12px;
}

.member-table td {
  padding: 8px;
  text-align: left;
  padding-left: 17px;
  border: 1px solid #ccc;
}

#search-from {
	margin-left: 80px
}

.search-keyword {
	position: relative;
	margin: 0 auto;
	max-width: 691px;
	width: 60%;
}

.search-keyword select {
	position: absolute;
	width: 81px;
	height: 40px;
	border: 1px solid #ccc;
	font-size: 12px;
	padding-left: 12px;
}

.search-keyword select:hover {
  border-color: #ccc;
}

.search-keyword select:focus {
  border-color: #aaa;
  outline: none;
}

.search-keyword select:disabled {
  opacity: 0.5;
}

#board-search .search-window {
  	padding: 15px 0;
  	background-color: #f9f7f9;
}

#board-search .search-window .search-wrap {
  	position: relative;
/*   padding-right: 124px; */
  	margin: 0 auto;
  	width: 80%;
  	max-width: 440px;
}

#board-search .search-window .search-wrap input {
  	height: 40px;
  	width: 98%;
  	font-size: 13px;
  	padding: 7px 14px;
  	border: 1px solid #ccc;
}

#board-search .search-window .search-wrap input:focus {
  	border-color: #333;
  	outline: 0;
  	border-width: 1px;
}

#board-search .search-window .search-wrap .btn {
  	position: absolute;
  	right: 0;
  	top: 0;
  	bottom: 0;
  	width: 108px;
  	padding: 0;
  	font-size: 16px;
}

.board-table {
  	font-size: 13px;
  	width: 100%;
  	border-top: 1px solid #ccc;
  	border-bottom: 1px solid #ccc;
}

.board-table a {
  	color: #333;
  	display: inline-block;
  	line-height: 1.4;
  	font-weight: 400;
  	word-break: break-all;
  	vertical-align: middle;
}

.board-table a:hover {
  	color: #CF0A0A;
}

.board-table th {
  	text-align: center;
}

.board-table .th-num {
  	width: 100px;
  	text-align: center;
}

.board-table .th-date {
  	width: 200px;
}

.board-table th, .board-table td {
  	padding: 14px 9px;
}

.board-table tbody td {
  	border-top: 1px solid #e7e7e7;
  	text-align: center;
}

.board-table tbody th {
  	padding-left: 28px;
  	padding-right: 14px;
  	border-top: 1px solid #e7e7e7;
  	text-align: left;
}

.board-table tbody th p{
  	display: none;
}

.btn {
  	display: inline-block;
  	padding: 0 30px;
  	font-size: 15px;
  	font-weight: 400;
  	background: transparent;
  	text-align: center;
  	white-space: nowrap;
  	vertical-align: middle;
  	-ms-touch-action: manipulation;
  	touch-action: manipulation;
  	cursor: pointer;
  	-webkit-user-select: none;
  	-moz-user-select: none;
  	-ms-user-select: none;
  	user-select: none;
  	border: 1px solid transparent;
  	text-transform: uppercase;
  	-webkit-border-radius: 0;
  	-moz-border-radius: 0;
  	border-radius: 0;
  	-webkit-transition: all 0.3s;
  	-moz-transition: all 0.3s;
  	-ms-transition: all 0.3s;
  	-o-transition: all 0.3s;
  	transition: all 0.3s;
}

.btn-dark {
  	background: #555;
  	color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  	background: #373737;
  	border-color: #373737;
  	color: #fff;
}

/* reset */

* {
  	list-style: none;
  	text-decoration: none;
  	padding: 0;
  	margin: 0;
  	box-sizing: border-box;
}

.clearfix:after {
  	content: '';
  	display: block;
  	clear: both;
}

.container {
  	width: 1100px;
  	margin: 0 auto;
}

.blind {
  	position: absolute;
  	overflow: hidden;
  	clip: rect(0 0 0 0);
  	margin: -1px;
  	width: 1px;
  	height: 1px;
}

.logoutBtn {
	margin-bottom: 13px;
	margin-left: 18%;
}

.logoutBtn a {
	/*color: #ee6a7b;*/
	color: #fff;
	font-size: 12px;
	border: 1px solid #333;
	border-radius: 20px;
	padding: 8px;
	background: #555;
}

.logoutBtn a:hover {
  	/*text-decoration: underline;*/
  	background: #373737;
}

#btn-wrap {
	float: right;
	margin: 15px 31px;
}

#btn-wrap div {
	position: relative;
	width: 55px;
	height: 31px;
	padding: 0;
	font-size: 13px;
}

#btn-wrap button {
	background-color: #555;
	border: none;
	color: #fff;
	width: 60px;
	height: 33px;
	cursor: pointer;
}

#btn-wrap button:hover {
	background: #373737;
}

#paging {
	display: block;
	text-align: center;
	margin-top: 15px;
	margin-left: 120px;
	padding-bottom: 12px;
}

#replyCnt {
	font-size: 12px;
	font-weight: normal;
	padding-left: 6px;
	color: #F25287;
}

.noiceA {
	background: #f9f7f9;
	/*#F8F1F1;*/
}

.noiceA a {
	font-weight: 600;
}

.lock_icon {
	margin-right: 6px;
}

#info-wrap {
	position: absolute;
	top: 10px;
}

#info-wrap span {
	font-size: 12px;
}

#info-wrap a:hover {
	text-decoration: underline;
	color: #686D76;
}

#myInfo {
	font-size: 13px;
	color: #333;
}

#memInfo {
	font-size: 13px;
	color: #333;
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

<script type="text/javascript">
	function logout(){
		$('#logoutFrm').submit();
	};
</script>
</head>
<body>
	<section class="notice">
		<div class="page-title">
			<div class="container">
				<h3>NOTICE</h3>
			</div>
		</div>
		<div id="board-minfo">
			<form action="logout" id="logoutFrm" method="post">
				<div class="logoutBtn"><a href="javascript:logout()">로그아웃</a></div>	
			</form>
			<div id="info-wrap">
				<a href="javascript:modalLink();" id="myInfo">내정보</a>
				<c:if test="${id == 'landey559'}">
					<span>|</span>
					<a href="/ye/admin/adminInfo" id="memInfo">관리자모드</a>
				</c:if>
			</div>
			
			<table class="member-table">
				<tr>
					<th>아이디</th>
					<td>
						${mb.m_id} 
						<input type="hidden" id="memId" value="${mb.m_id}">
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${mb.m_name}</td>
				</tr>
				<tr>
					<th>등급</th>
					<td>${mb.g_name}</td>
				</tr>
				<tr>
					<th>포인트</th>
					<td>${mb.m_point}</td>
				</tr>
			</table>
		</div>
		
		<!-- board search area -->
		<div id="board-search">
			<div class="container">
				<div class="search-window">
					<div id="search-from">
						<div class="search-keyword">
							<select id="choice">
								<option value="b_title">제목</option>
								<option value="b_writer">작성자</option>
							</select>
						</div>
						<div class="search-wrap">
							<label for="search" class="blind">공지사항 내용 검색</label>
							<input type="text" id="search" name="" placeholder="검색어를 입력해주세요.">
							<button type="button" id="searchBtn" class="btn btn-dark">검색</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- board list area -->
		<div id="board-list">
			<div class="container">
				<table class="board-table">
					<thead>
						<tr>
							<!--  th scope="col" class="th-unm">번호</th-->
							<th scope="col"></th>
							<th scope="col" class="th-title">제목</th>
							<th scope="col" class="th-writer">작성자</th>
							<th scope="col" class="th-date">등록일</th>
							<th scope="col" class="th-view">조회수</th>
						</tr>
					</thead>
					<tbody class="tbody"></tbody>
				</table>
				
				<div id="btn-wrap">
					<div><button onclick="location.href='./write'">글쓰기</buttoN></div>
				</div>
			</div>
		</div>
		<div id="paging-list">
			<div class="container">
				<div id="paging">${paging}</div>
			</div>
		</div>
		
		<!-- Modal -->
		<div id="modal-list">
			<div class="container">
				<div id="modal_popup"></div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
var bList=${bList};

$(document).ready(function() {
	var str = "";
	
	for(var i=0; i<bList.length; i++) {
		var type = bList[i].b_type;
		var name = bList[i].b_writer;
		var maksName = name.replace(/(?<=.{2})./gi, "*");
		
		if(type == "A") {
			str+= "<tr class='noiceA'>";
		}else {
			str+= "<tr>";
		}
		str+= "<td><input type='hidden' id='bNum' value='"+bList[i].b_num+"'></td>";
		
		if(type == "S") {
			str+= "<th><a href='javascript:secret(\""+bList[i].b_num+"\",\""+bList[i].b_pw+"\");'><i class='fa fa-lock lock_icon' aria-hidden='true'></i>비밀글입니다.</a>";
		}else {
			str+= "<th><a href='./boardContents?bNum="+bList[i].b_num+"'>"+bList[i].b_title+"</a>";
		}
		
		if(bList[i].RCNT != 0) {
			str+="<small id='replyCnt'>"+bList[i].RCNT+"</small></th>";
		}else{
			str+="</th>";
		}
		
		if(name == 'landey559') {
			str+= "<td>관리자</td>";
		}else {
			str+= "<td>"+maksName+"</td>";	
		}
		
		str+= "<td>"+bList[i].b_date.substr(0, 10)+"</td>";	
		str+= "<td>"+bList[i].b_views+"</td></tr>";	
	}
	$(".tbody").append(str);
	console.log(bList);
	//console.log(bList.b_num);	
});

function secret(num, password) {
	var id = "${id}";
	if(id == 'landey559') {
		location.href = "./boardContents?bNum="+num;
	}else {
		var passwordNum = prompt("비밀글입니다! 비밀번호를 입력해주세요.");
		if(passwordNum == password) {
			location.href = "./boardContents?bNum="+num;
		}else {
			alert("비밀번호가 틀립니다.");
		}
	}
};

$("#searchBtn").click(function() {
	var choice = $("#choice").val();
	var search = $("#search").val();
	var pattern = /\s/g; 
	
	console.log(choice);
	console.log(search);
	
	if(search == "" || search == null || search.length < 2) {
		alert("2자이상의 검색어를 입력해주세요.");	
	}else if(search.match(pattern)) {
		alert("검색어를 입력해주세요.");
	}else {
		$.ajax({
			url: '/ye/rest/board/boardSearch',
			type: 'post',
			data: 'choice='+choice+'&search='+search,
			dataType: 'json',
			success: function(data) {
				console.log("성공");
				var str="";
				
				for(var i in data.bList){
					var type = data.bList[i].b_type;
					var name = data.bList[i].b_writer;
					var maksName = name.replace(/(?<=.{2})./gi, "*");
					
					if(type == "A") {
						str+= "<tr class='noiceA'>";
					}else {
						str+= "<tr>";
					}
					str+= "<td><input type='hidden' id='bNum' value='"+data.bList[i].b_num+"'></td>";
					
					if(type == "S") {
						str+= "<th><a href='javascript:secret(\""+data.bList[i].b_num+"\",\""+data.bList[i].b_pw+"\");'><i class='fa fa-lock lock_icon' aria-hidden='true'></i>비밀글입니다.</a></th>";
					}else {
						str+= "<th><a href='./boardContents?bNum="+data.bList[i].b_num+"'>"+data.bList[i].b_title+"</a></th>";
					}
					
					/*if(data.bList[i].RCNT != 0) {
						str+="<small id='replyCnt'>"+data.bList[i].RCNT+"</small></th>";
					}else{
						str+="</th>";
					}*/
					
					if(name == 'landey559') {
						str+= "<td>관리자</td>";
					}else {
						str+= "<td>"+maksName+"</td>";	
					}
					
					str+= "<td>"+data.bList[i].b_date.substr(0, 10)+"</td>";	
					str+= "<td>"+data.bList[i].b_views+"</td></tr>";	
				}
				
				$(".tbody").html(str);
			},
			error: function(err) {
				console.log("실패");
			}
		})
	}
})


function modalLink() {
	var m_id = $("#memId").val();
	console.log(m_id);
	
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


</script>
</html>