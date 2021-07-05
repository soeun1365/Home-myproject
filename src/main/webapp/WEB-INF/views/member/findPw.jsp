<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:include page="../layout/header.jsp">
	<jsp:param value="아이디찾기" name="title" />
</jsp:include>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		verify_num();
	});
	
	//인증번호 받기
	function verify_num(){
		$('#verify_num_btn').click(function(){
			if($('#email').val() == ''){
				alert('이메일을 입력해주세요.');
				return false;
			//탈퇴한 회원의 email인지 확인하기
			} else if($('#email').val() != ''){
				$.ajax({
					url: 'verifyEmail.do',
					type: 'get',
					data: 'email=' + $('#email').val(),
					dataType: 'json',
					success: function(resultMap){
						if(resultMap.state == 1){
							alert('탈퇴한 회원입니다.');
							return false;
						}
					}
				});
			}else{
				$.ajax({
					url: 'verifyNum.do',
					type: 'get',
					data: 'email=' + $('#email').val(),
					dataType: 'json',
					success: function(resultMap){
						alert('인증코드가 발송되었습니다.');
						fn_verify(resultMap.authCode);
					}
				});
			}
		});
	}
	
	//인증하기
	function fn_verify(authCode){
		$('#findPw_btn').click(function(){
			if(authCode == $('#user_key').val()){
				alert('인증되었습니다. 비밀번호 변경 페이지로 이동합니다.');
				location.href="showPwPage.do?email=" + $('#email').val();
			} else{
				alert('인증번호가 틀렸습니다.');
				history.back();
			}
		});
	}
</script>
<style>
	*{
		padding: 0;
		margin: 0;
		box-sizing: border-box;
        background-color: beige;
	}
	.container{
		margin: 30px auto;
		width: 800px;
        height: 500px;
        display: flex;
        justify-content: center;
	}
	.findPw{
		width: 400px;
	}
	.inputBox{
		width: 400px;
	}
	input{
		border: none;
		outline: none;
        height: 40px;
	}
	#email{
		width: 60%;
		padding: 10px;
		font-size: 16px;
		background-color: #f4e68f;
	}
	#verify_num_btn{
		width: 40%;
		float: right;
		font-size: 16px;
        font-weight: 500;
        background-color: #eed538;
	}
    #verify_num_btn:hover{
        cursor: pointer;
        background-color: #b1c254;
    }
	#user_key{
		width: 100%;
		padding: 10px;
		font-size: 16px;
        margin-top: 10px;
        border: 1px solid #eed538;
	}
	#findPw_btn {
        width: 100%;
		font-size: 18px;
        text-align: center;
        background-color: #eed538;
        height: 40px;
        margin-top: 10px;
        font-weight: bolder;
	}
     #findPw_btn:hover{
        cursor: pointer;
        background-color: #b1c254;
    }
    .inputBox > a{
        margin-top: 10px;
        display: block;
    	font-size: 14px;
    	text-align: center;
        color: black;
        text-decoration: none;
    }
    .inputBox > a:hover{
        color: #b1c254;
        font-weight: bolder;
    }
</style>

<div class="container">
	<div class="findPw">
		<div class="inputBox">
			<input type="text" name="email" id="email" placeholder="email">
			<input type="button" value="인증번호 받기" id="verify_num_btn">
			<input type="text" id="user_key" placeholder="인증코드">
			<input type="button" value="비밀번호 찾기" id="findPw_btn">
			<a href="findIdByNamePhone.do">아이디 찾기</a>
		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp" %>