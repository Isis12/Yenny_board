<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>회원가입</title>
<!-- 돋보기 아이콘 -->
<style type="text/css">
@charset "UTF-8";

#wrap {
	width: 100%;
}

#wrap #formSection {
	width: 100%;
}

#wrap #formSection .container {
	width: 100%;
	max-width: 640px;
	margin: 0 auto;
}

#wrap #formSection .container .content {
	width: 100%;
}

/* 타이틀*/
#wrap #formSection .container .content h2 {
	width: 100%;
	text-align: center;
	font-size: 28px;
	color: rgb(51, 51, 51);
	padding: 60px 0 50px 0;
}

#wrap #formSection .container .content .sub-title {
	width: 100%;
	text-align: right;
	padding: 0 0 10px 0;
	border-bottom: 2px solid rgb(51, 51, 51);
}

#wrap #formSection .container .content .sub-title span {
	font-size: 12px;
	padding-left: 5px;
}

#wrap #formSection .container .content .sub-title span i {
	color: rgb(238, 106, 123);
	padding-right: 2px;
}

.title-home a {
	text-decoration: none;
	color: #333333;
}

.title-home a:hover {
	color: #ee6a7b;
}

/* 폼디자인 */
#wrap #formSection .container .content #memberForm {
	width: 100%;
}

#wrap #formSection .container .content #memberForm ul li {
	width: 100%;
	display: flex;
	padding: 10px 20px;
}

/* 폼 왼쪽 항목 */
.left-box {
	width: 139px;
	height: 48px;
	padding-top: 15px;
	display: flex;
	/* 왼쪽으로 수평 정렬 */
	justify-content: start;
	/* 수직정렬 */
	align-items: cneter;
}

.left-box span {
	font-size: 14px;
	font-weight: 400;
	color: #333333;
}

.left-box span i {
	color: #ee6a7b;
}

/* 폼 오른쪽 항목 */
.right-box {
	width: 461px;
	/* 입력상장 넓이가 줄어듬 */
	padding: 0 130px 0 0;
	position: relative;
}

/* 폼 오른쪽 항목 중 input 공통 스타일 */
 .right-box input {
	width: 100%;
	height: 46px;
	border: 1px solid #c5c4c4;
	border-radius: 4px;
	color: #333333;
	font-size: 16px;
	padding: 0 15px;
	/* transparent : 투명한 색 */
	background: transparent;
	/* input을 눌렀을때 0.3초 동안 outline이 1px solid transparent -> 1px solid #333으로 바뀜 */
	transition: all 0.3s;
	outline: 1px solid transparent;
	/* outline-offset을 안쓰면 input을 눌렀을때 외곽선이 두개로 겹쳐서 보임, -1px을 쓰면 그만큼 안으로 들어오게끔 만들어줌 */
	outline-offset: -1px; 
}

 .right-box input::placeholder {
	font-size: 16px;
	font-weight: 200;
	color: #999;
}

.right-box input:focus {
	outline: 1px solid #333;
}

/* 폼 오른쪽 항목 중 버튼 */
#wrap #formSection .container .content #memberForm ul li .right-box .right-btn {
	position: absolute;
	top: 0;
	right: 0;
	width: 120px;
	height: 44px;
	background: transparent;
	border: 1px solid #2C4E80;
	color: #2C4E80;
	font-size: 14px;
	font-weight: 600;
	border-radius: 4px;
	padding: 0 10px;
	cursor: pointer;
}	

#wrap #formSection .container .content #memberForm ul li .right-box .right-btn.off{
	border: 1px solid rgb(221, 221, 221);
	color: rgb(221, 221, 221);
	cursor: default;
}

#wrap #formSection .container .content #memberForm ul li .right-box .right-btn i {
	margin: 0 4px 2px 0;
}

#wrap #formSection .container .content #memberForm ul li .right-box .right-btn .addr {
	position: relative;
	top: 0;
	left: 0;
	width: 100%;
	height: 46px;
} 

#wrap #formSection .container .content #memberForm ul li .right-box .right-btn .address {
	margin: 0 0 8px 0;
	display: none;
}

#wrap #formSection .container .content #memberForm ul li .right-box .right-btn .addr_det {
	display: none;
}

.addr-box {
	margin-bottom: 10px;
}

/* 가입버튼 */
.join-box {
	position: relative;
	left: 59%;
	/*margin-right: 35%;*/
}

#reg_submit {
	position: absolute;
	top: 0;
	right: 0;
	width: 180px;
	height: 58px;
	background: transparent;
	border: 1px solid #2C4E80;
	color: #2C4E80;
	font-size: 14px;
	font-weight: 600;
	border-radius: 4px;
	padding: 0 10px;
	cursor: pointer;	
}

#reg_submit:focus {
	background: #1B3C73;
	color: #ffff;
}

.check-font {
	font-size: 13px;
	color: #ee6a7b;
}
</style>
</head>
<body>
<div id="wrap">
	<section id="formSection">
		<div class="container">
			<div class="content">
				<h2>회원가입</h2>
				<div class="sub-title">
					<span><i>*</i> 필수입력사항</span>
					<span>/</span>
					<span class="title-home"><a href="/ye">홈으로</a></span>
				</div>
				
				<!-- autocomplete는 자동완성이라는 뜻이고 기본적으로 켜져있음 -->
				<form action="memJoin" id="memberForm" method="post" autocomplete="off">
					<ul>
						<li>
							<div class="left-box">
								<span>아이디<i>*</i></span>
							</div>
							<div class="right-box">
								<input type="text" id="userId" name="m_id" placeholder="아이디를 입력해주세요.">
								<!-- <button class="right-btn">중복확인</button> -->
								<span id="dupleId" class="check-font"></span>
							</div>
						</li>
						<li>
							<div class="left-box">
								<span>비밀번호<i>*</i></span>
							</div>
							<div class="right-box">
								<input type="password" id="userPw" name="m_pw" placeholder="비밀번호를 입력해주세요." autocomplete="off">
								<span id="duplePw" class="check-font"></span>
							</div>
						</li>
						<li>
							<div class="left-box">
								<span>비밀번호 확인<i>*</i></span>
							</div>
							<div class="right-box">
								<input type="password" id="pw2" name="pw2" placeholder="비밀번호를 한번 더 입력해주세요." autocomplete="off">
								<span id="duplePw2" class="check-font"></span>
							</div>
						</li>
						<li>
							<div class="left-box">
								<span>이름<i>*</i></span>
							</div>
							<div class="right-box">
								<input type="text" id="userName" name="m_name" placeholder="이름을 입력해주세요.">
								<span id="dupleName" class="check-font"></span>
							</div>
						</li>
						<li>
							<div class="left-box">
								<span>생년월일<i>*</i></span>
							</div>
							<div class="right-box">
								<input type="text" id="userBirth" name="m_birth" placeholder="ex)19910101">
								<span id="dupleBirth" class="check-font"></span>
							</div>
						</li>
						<li>
							<div class="left-box">
								<span>휴대폰<i>*</i></span>
							</div>
							<div class="right-box">
								<input type="text" id="userPn" name="m_phone" placeholder="숫자만 입력해주세요.">
								<span id="duplePhone" class="check-font"></span>
							</div>
						</li>
						<li>
							<div class="left-box">
								<span>주소<i>*</i></span>
							</div>
							<div class="right-box">
								<input type="text" id="sample6_postcode" class="addr-box addr_num" name="m_addr_num" placeholder="우편주소" readonly>
								<input type="text" id="sample6_address" class="addr-box address" name="m_addr" placeholder="검색주소" readonly>
								<input type="text" id="sample6_detailAddress" class="addr-box addr_det" name="m_addr_det" placeholder="나머지 주소를 입력해주세요.">
								<button type="button" onclick="sample6_execDaumPostcode()" class="right-btn addr"><i class="fa fa-search"></i>주소 검색</button>
								<span id="dupleAddrs" class="check-font"></span>
							</div>
						</li>
						<li>
							<div class="join-box"><button type="submit" id="reg_submit">회원가입</button></div>
						</li>
					</ul>
				</form>
			</div>
		</div>
	</section>
</div>
</body>
<script>
//공백체크
function memberJoinCheck() {
	var id = document.getElementById("userId");
	var pw = document.getElementById("userPw");
	var pw2 = document.getElementById("pw2");
	var name = document.getElementById("userName");
	var birth = document.getElementById("userBirth");
	var phone = document.getElementById("userPn");
	
	if(id.value == ""){
		alert("아이디를 입력해 주세요.");
		id.focus();
		return false;
	}else if(pw.value == ""){
		alert("패스워드를 입력해 주세요.");
		pw.focus();
		return false;
	}else if(pw2.value == ""){
		alert("동일한 패스워드를 입력해 주세요.");
		pw2.focus();
		return false;
	}else if(name.value == ""){
		alert("이름을 입력해 주세요.");
		name.focus();
		return false;
	}else if(birth.value == ""){
		alert("생년월일을 입력해 주세요.");
		birth.focus();
		return false;
	}else if(phone.value == ""){
		alert("휴대폰번호를 입력해 주세요.");
		phone.focus();
		return false;
	}
};

//유효성 검사
$(document).ready(function() {
	var ExpReg = /^[a-z0-9]{4,12}$/;
	var nameReg = /^[가-힣]{2,5}$/;
	var phoneReg = /(^02.{0}^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;
	var birthReg = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/

	//아이디
	$('#userId').blur(function() {
		var userId = $('#userId').val();
		
		console.log(userId);
		
		$.ajax({
			type: 'get',
			url: '/ye/home/dupleID',
			data: {m_id:userId},
			dataType: 'text',
			success: function(data){
				console.log('1=중복, 0=중복x : '+ data);
				
				if(data == 1){
					//아이디 중복
					$('#dupleId').text('이미 사용중인 아이디');
				}else {
					if(ExpReg.test(userId)) {
						//0: 아이디길이/문자열검사
						$('#dupleId').text('사용 가능한 아이디 입니다.');
					}else if(userId == "") {
						$('#dupleId').text("아이디를 입력해 주세요.");
					}else {
						$('#dupleId').text('4자 이상 12자 이하의 영문과 숫자를 조합');
					}
				}
				
			}, error: function(err){
				console.log('실패');
			}
		});
	});
	
	//비밀번호
	 $('#userPw').blur(function() {
		if(ExpReg.test($('#userPw').val())) {
			$('#duplePw').text('');
			//$('#reg_submit').attr('disabled', false);
		}else {
			$('#duplePw').text('최소 4자 이상 입력');
		}
	 });
	 
	//비밀번호 확인
	$('#pw2').blur(function() {
		var pw = $('#userPw').val();
		var pw2 = $('#pw2').val();
		
		if(pw2 == '') {
			$('#duplePw2').text('비밀번호를 한번 더 입력해 주세요.');
		}else {
			if(pw2 == pw) {
				$('#duplePw2').text('');
			}else {
				$('#duplePw2').text('동일한 비밀번호를 입력');
				//$('#reg_submit').attr('disabled',true)
			}
		};
	});
	
	//이름
	$('#userName').blur(function() {
		if(nameReg.test($('#userName').val())) {
			$('#dupleName').text('');
		}else {
			$('#dupleName').text('이름을 입력하세요.');
		}
	});
	
	//생년월일
	$('#userBirth').blur(function() {
		if(birthReg.test($('#userBirth').val())) {
			$('#dupleBirth').text('');
		}else {
			$('#dupleBirth').text('생년월일을 입력해 주세요.');
		}
	});
	
	//휴대폰번호
	$('#userPn').blur(function() {
		var phone = $('#userPn').val();
		
		console.log(phone);
		
		$.ajax({
			type: 'get',
			url: '/ye/home/duplePhone',
			data: {m_phone:phone},
			dataType: 'text',
			success: function(data) {
				console.log('1=중복, 0=중복x : ' + data);
				
				if(data == 1) {
					//1:번호중복
					$('#duplePhone').text('이미 등록된 휴대폰 번호 입니다.');
				}else {
					//0:번호길이/문자열검사
					if(phoneReg.test(phone)) {
						$('#duplePhone').text('');
					}else if(phone == '') {
						$('#duplePhone').text('휴대폰 번호를 입력해 주세요.');
					}
				}
			}, error: function(err){
				console.log('실패');
			}
		})
	});
	
	
})

//주소 api
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            //if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                //if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                //    extraAddr += data.bname;
                //}
                // 건물명이 있고, 공동주택일 경우 추가한다.
                //if(data.buildingName !== '' && data.apartment === 'Y'){
                  //  extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                //}
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                //if(extraAddr !== ''){
                 //   extraAddr = ' (' + extraAddr + ')';
                //}
                // 조합된 참고항목을 해당 필드에 넣는다.
                //document.getElementById("sample6_extraAddress").value = extraAddr;
            
            //} /*else {
                //document.getElementById("sample6_extraAddress").value = '';
            //}

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
</script>
</html>
