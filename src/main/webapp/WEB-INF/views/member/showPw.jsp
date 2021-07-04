<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../layout/header.jsp">
	<jsp:param value="비밀번호변경" name="title" />
</jsp:include>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		updatePw();
	});
	//비밀번호 변경
	function updatePw(){
		$('#updatePw_btn').click(function(){
			if($('#pw').val() == ''){
				alert('새 비밀번호를 입력하세요.');
			} else if($('#pw').val() != $('#pw2').val()){
				alert('비밀번호를 확인하세요.');
				return false;
			} else{
				$('#f').attr('action', 'updatePw.do');
				$('#f').submit();
			}
		});
	}
	//정규식통과
	function regPW(){
		$('#pw').keyup(function(){
			var regPW = /^(?=.*[A-Z])(?=.*[~!@#$%^&*])[A-Za-z0-9~!@#$%^&*]{4,8}$/;
			if( !regPW.test($('#pw').val()) ){
				$('#Check').text('비밀번호는 대문자와 특수문자를 포함한 4~8자리 이어야합니다.').css('color', 'red');
				pwPass =  false;
			}else{
				$('#pw1Check').text('사용가능한 비밀번호 입니다.').css('color', 'green');
				pwPass = true;
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
	}
	.updatePw_form{
		width: 100%;
        margin-top: 30px;
        height: 500px;
        padding: 0 200px;
        text-align: center;
	}
	.input_text{
		width: 100%;
	}
	.input_text input{
		width: 100%;
        padding: 10px;
        outline: none;
        border: none;
        font-size: 14px;
        background-color: #f4e68f;
	}
    #updatePw_btn{
        margin-top: 20px;
        width: 400px;
        height: 40px;
        background-color: #eed538;
        outline: none;
        border: none;
        font-weight: bolder;
        font-size: 16px;
    }
    #updatePw_btn:hover{
        cursor: pointer;
        background-color: #b1c254;
    }
   
</style>
<div class="container">
	<div class="updatePw_form">
		<form id="f" method="post">
			<input type="hidden" name="email" value="${eamil}">
			<input type="text" name="email" value="${eamil}">
			<div class="input_text">
				<input type="password" name="pw" id="pw" placeholder="새 비밀번호">
			</div>
			<div class="input_text">
				<input type="password" id="pw2" placeholder="비밀번호 확인">
			</div>
			<span id="Check"></span>
			<input type="button" value="비밀번호변경" id="updatePw_btn">
		</form>
	</div>
</div>

	
<%@ include file="../layout/footer.jsp" %>