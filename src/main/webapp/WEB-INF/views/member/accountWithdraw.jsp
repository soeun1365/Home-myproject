<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:include page="../layout/header.jsp">
	<jsp:param value="로그인" name="title" />
</jsp:include>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		withdraw();
	});

	function withdraw(){
		$('#login_btn').click(function(){
			if($('#pw').val() == ''){
				alert('비밀번호를 입력하세요.');
				$('#pw').focus();
				return false;
			} else if($('#pw').val() != $('#UserPw').val()){
				alert('비밀번호가 일치하지 않습니다. ');
				return false;
			} else{
				$('#f').attr('action', 'accountWithdrawResult.do');
				$('#f').submit();
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
	.loginContainer{
		margin: 30px 200px;
		width: 800px;
        height: 500px;
	}
    .inp_box{
        width: 400px;
        height: 50px;
        margin: 10px 0;
        border: 1px solid #eed538;
    }
    .inp_box:nth-of-type(3){
        margin-top: 20px;
        border: none;
    }
    .inp_text{
        width: 100%;
        height: 100%;
        padding: 10px;
        outline: none;
        border: none;
        background-color: #f4e68f;
        font-size: 16px;
    }
    #login_btn{
        width: 100%;
        height: 100%;
        background-color: #eed538;
        outline: none;
        border: none;
        border-radius: 5px;
        font-weight: bolder;
        font-size: 18px;
    }
    #login_btn:hover{
        cursor: pointer;
        background-color: #b1c254;
    }
</style>
<div class="loginContainer">
    <form id="f" method="post">
        <div class="inp_box">
            <input type="text" id="id" name="id" class="inp_text" value="${loginUser.id}" readonly>	
        </div>
        <div class="inp_box">
            <input type="password" id="pw" placeholder="비밀번호" class="inp_text">
        </div>
        <div class="inp_box">
            <input type="button" value="탈퇴하기" id="login_btn" class="inp_text">
        </div>
    	<input type="hidden" name="mno" value="${loginUser.mno}">
    	<input type="hidden" value="${loginUser.pw}" id="UserPw">
    </form>
</div>
    
<%@ include file="../layout/footer.jsp" %>