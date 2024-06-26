<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Home</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

* {
  	margin: 0;
  	padding: 0;
}

body {
  	font-family: 'Noto Sans KR', sans-serif;
  	display: flex;
  	justify-content: center;
  	align-items: center;
  	height: 100vh;
}

.login-form h1 {
  	font-size: 32px;
  	text-align: center;
  	margin-bottom: 50px;
	color: rgb(51, 51, 51);
}

.int-area {
  	width: 400px;
  	position: relative;
  	margin-top: 20px;
}

.int-area:first-child {
  	margin-top: 0;
}

.int-area input {
  	width: 100%;
  	padding: 20px 10px 10px;
  	background-color: transparent;
  	border: none;
  	border-bottom: 1px solid #333333;
  	font-weight: 400;
  	font-size: 15px;
  	outline: none;
}

.int-area label {
  	position: absolute;
  	left: 10px;
  	top: 15px;
  	color: #333333;
  	font-size: 15px;
  	transition: top 0.5s ease;
}

/*.int-area label.warning {
  color: red !important;
  animation: warning 0.3s ease;
  animation-iteration-count: 3;
}*/

@keyframes warning {
  	0% {
    	transform: translateX(-8px);
  	}
  	25% {
   	 transform: translateX(8px);
 	 }
  	50% {
    	transform: translateX(-8px);
  	}
  	75% {
  	  transform: translateX(8px);
  	}
}

.int-area input:focus + label,
.int-area input:valid + label {
  	top: -2px;
  	font-size: 14px;
  	color: #2C4E80;
}

.btn-area {
 	 margin-top: 30px;
}

.btn-area button {
 	width: 100%;
	height: 50px;
	margin: 0px 2px;
 	color: #fff;
	background: #555;
	border: none;
	border-radius: 12px;
 	font-size: 20px;
	cursor: pointer;
}

.caption {
  	margin-top: 20px;
  	text-align: center;
}

.caption a {
  	margin: 0 20px;
  	font-size: 15px;
  	color: #555;
  	text-decoration: none;
}

#check_font, #id_check {
	color: #ee6a7b;
	font-size: 13px;
	font-weight: 200;
	margin-top: 5px;
}
</style>
</head>
<body>
<section class="login-form">
 	<h1>Login</h1>
	<form action="access" method="post">
		<div class="int-area">
			<input type="text" name="m_id" id="userId" autocomplete="off" required>
			<label for="userId">username</label>
		</div>
		<div id="id_check"></div>
		<div class="int-area">
			<input type="password" name="m_pw" id="userPw" autocomplete="off" required>
			<label for="userPw">password</label>
		</div>
		<div id="check_font"></div>
		<div class="btn-area">
			<button id="btn" type="submit">LOGIN</button>
		</div>
	</form>
	<div class="caption">
		<a href="">Forgot Password?</a>
		<a href="home/join">회원가입</a>
	</div>
</section>
</body>
<script type="text/javascript">
//공백체크
$(document).ready(function() {
	$("#userId").blur(function() {
		if($("#userId").val() == "") {
			$("#id_check").text("아이디를 다시 확인해주세요.");
		}else {
			$("#id_check").text('');
		}
	});
	
	$("#userPw").blur(function() {
		if($("#userPw").val() == "") {
			$("#check_font").text("비밀번호를 다시 확인해주세요.");
		}else {
			$("#check_font").text('');
		}
	});
});

$("#btn").click(function() {
	if($("#userId").val() == "" || $("#userPw").val() == "") {
		$("#id_check").text("아이디를 다시 확인해주세요.");
		$("#check_font").text("비밀번호를 다시 확인해주세요.");
	}else {
		$("#id_check").text("");
		$("#check_font").text("");
	};
	
});

//required 메세지 없앰
document.querySelectorAll("input").forEach(input => {
	input.addEventListener("invalid", e => {
		// 브라우져 툴팁 숨김
		e.preventDefault()
	});
});

</script>
</html>
