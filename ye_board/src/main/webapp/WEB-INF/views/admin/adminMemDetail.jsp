<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
.modal_wrapper {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 9999;
	background: rgba(0, 0, 0, 0.5);
	display: flex;
	justify-content: center;
	align-items: center;
}

.modal {
	position: relative;
	width: 600px;
	height: 750px;
	background: white;
	padding: 26px 16px;
	border-radius: 4px;
}

.modal_title {
	display: inline-block;
	font-size: 24px;
	font-weight: bold;
	text-align: left;
	margin-left: 18px;
	margin-top: 11px;
}

.modal-info {
	margin: 13px 6px;
	font-size: 14px;
}

.modal-info p {
	padding-left: 12px;
}

.close_wrapper {
	position: relative;
	margin-left: 12px;
}

#close_btn {
    display: inline-block;
    padding: 10px 20px;
    background-color: rgb(116, 0, 0);
    border: none;
    border-radius: 5px;
    color: #fff;
    cursor: pointer;
    transition: box-shadow 0.2s;
    margin-left: 195px;
}

#modify_btn {
    display: inline-block;
    padding: 10px 20px;
    background-color: #365486;
    border: none;
    border-radius: 5px;
    color: #fff;
    cursor: pointer;
    transition: box-shadow 0.2s;
}

#modal-table {
	border: 1px solid #ccc;
	width: 552px;
	height: 42px;
}

#modal-table th {
	border: 1px solid #ccc;
	background: #f9f7f9;
	width: 125px;
}

#modal-table tr {
	border: 1px solid #ccc;
}

#modal-table td {
	padding: 13px;
}

#pwBtn {
	padding: 6px 11px;
	color: #fff;
	background: #555;
	border: none;
	border-radius: 4px;
	transition: box-shadow 0.2s;
	cursor: pointer;
}

.smallBtn {
	padding: 6px 6px;
	color: #fff;
	background: #555;
	border: none;
	border-radius: 24px;
	transition: box-shadow 0.2s;
	font-size: 10px;
	cursor: pointer;
}

#pw_text {
	display: none;
	position: absolute;
	top: 183px;
	height: 30px;
	padding-left: 6px;
	margin-top: 3px;
}

input:focus {
	outline: none;
}

#me_phone {
	height: 30px;
	padding-left: 5px;
}

.addrNum {
	width: 56px;
	height: 26px;
	padding-left: 5px;
}

.addr {
	width: 300px;
	height: 30px;
	margin-top: 4px;
	padding-left: 5px;
}

#point_text {
	display: none;
	height: 30px;
	width: 49px;
	padding-left: 5px;
	margin-top: 9px;
}

input[type="number"]::-webkit-inner-spin-button,
input[type="number"]::-webkit-outer-spin-button {
	-webkit-appearance: inner-spin-button;    
    opacity: 1;
}
</style>
</head>
<body>
	<div class="modal_wrapper">
		<div class="modal">
			<div class="modal_title">
				<p>회원 상세보기</p>
			</div>
			<form id="modifyMemFrm">
				<div class="modal-info">
					<table id="modal-table">
						<tr>
							<th>아이디</th>
							<td>${member.m_id}<input type="hidden" name="m_id" value="${member.m_id}" id="memId"></td>
						</tr>
						<tr>
							<th>이름</th>
							<td>
								<span>${member.m_name}</span>
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td>
								<button type="button" id="pwBtn">비밀번호 변경</button>
								<div>
									<input type="password" name="m_pw" id="pw_text" value="m_pw">
								</div>
							</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td id="me_birth"></td>
						</tr>
						<tr>
							<th>휴대폰 번호</th>
							<td>
								<span><input type="text" name="m_phone" id="me_phone" value="" readonly></span>
								<button type="button" class="smallBtn" id="phone_btn">수정</button>
							</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>
								<div><input type="text" name="m_addr_num" value="${member.m_addr_num}" id="sample6_postcode" class="addrNum" readonly></div>
								<div>
									<input type="text" name="m_addr" value="${member.m_addr}" id="sample6_address" class="addr" readonly><br>
									<input type="text" name="m_addr_det" value="${member.m_addr_det}" id="sample6_detailAddress" class="addr" placeholder="상세주소" readonly>
									<button type="button" class="smallBtn" id="addr_btn" onclick="sample6_execDaumPostcode()">수정</button>
								</div>
							</td>
						</tr>
						<tr>
							<th>포인트</th>
							<td>
								<span>${member.m_point}</span>
								<button type="button" class="smallBtn" id="pointBtn">수정</button>
								<div><input type="number" name="m_point" id="point_text" min="0" max="100" value="${member.m_point}"></div>
							</td>
						</tr>
						<tr>
							<th>등급</th>
							<td>${member.g_name}</td>
						</tr>
						<tr>
							<th>가입일</th>
							<td>${member.m_date}</td>
						</tr>
					</table>
				</div>
				<div class="close_wrapper">
					<button type="button" id="close_btn">닫기</button>
					<button type="button" id="modify_btn" onclick="modifyMember('${member.m_id}');">수정</button>
				</div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function() {
	var modal = document.querySelector('#modal-list');
	var modalClose = document.querySelector('#close_btn');
	
	//모달 닫기
	modalClose.addEventListener('click', function() {
		modal.classList.remove('open');
	});
})

$(document).ready(function() {
	var phone = "${member.m_phone}";
	var phoneDate = phone.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
	
	$("#me_phone").val(phoneDate);
	
	
	var birth = "${member.m_birth}";
	var birthDate = birth.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3');
	
	$("#me_birth").text(birthDate);
})


$("#pwBtn").click(function() {
	var text = document.getElementById("pw_text");
	var button = document.getElementById("pwBtn");
	
	if(text.style.display == 'block') {
		text.style.display = 'none';
		button.style.marginLeft = '0px';
	}else {
		text.style.display = 'block';
		button.style.marginLeft = '176px';
	}
})


$("#pointBtn").click(function() {
	var text = document.getElementById("point_text");
	
	if(text.style.display == 'block') {
		text.style.display = 'none';
	}else {
		text.style.display = 'block';
	}
})

$("#phone_btn").click(function() {
	$("#me_phone").prop('readonly', false);
})

//주소 api
function sample6_execDaumPostcode() {
	$("#sample6_detailAddress").prop('readonly', false);
	var width = 500;
	var height = 600;
	
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

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open({
    	left: (window.screen.width /2) - (width / 2),
    	top: (window.screen.height /2) - (height / 2)
    });
}


function modifyMember(id) {
	console.log(id);
	var obj = $("#modifyMemFrm").serialize();
	
	$.ajax({
		url: '/ye/admin/modifyMember',
		type: 'post',
		data: obj,
		success: function(data) {
			console.log("성공");
			alert("해당회원의 정보를 수정하였습니다.");
			location.reload();
		},
		error: function(err) {
			console.log(err);
		}
	})
}

</script>
</html>