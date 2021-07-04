<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:include page="../layout/header.jsp">
	<jsp:param value="로그인" name="title" />
</jsp:include>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		login();
	});
	
	function login(){
		$('#login_btn').click(function(){
			if($('#id').val() == ''){
				alert('아이디를 입력하세요.');
				$('#id').focus();
				return false;
			} else if($('#pw').val() == ''){
				alert('비밀번호를 입력하세요.');
				$('#pw').focus();
				return false;
			} else{
				$('#f').attr('action', 'login.do');
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
    .search_box{
        width: 100%;
        display: flex;
    }
    .search_box_{
        margin-top: 10px 0;
        width: 200px;
        height: 40px;
        line-height: 40px;
        text-align: center;
        background-color: light-gray;
    }
    .search_box_ a{
        text-align: center;
        color: black;
        background-color: light-gray;
        text-decoration: none;
        font-weight: bolder;
        font-size: 14px;
        display: block;
    }
    .search_box_ a:hover{
        border-bottom: 1px solid #b1c254;
    }
</style>
<div class="loginContainer">
    <form id="f" method="post">
        <div class="inp_box">
            <input type="text" name="id" id="id" placeholder="아이디" class="inp_text">	
        </div>
        <div class="inp_box">
            <input type="password" name="pw" id="pw" placeholder="비밀번호" class="inp_text">
        </div>
        <div class="inp_box">
            <input type="button" value="로그인" id="login_btn" class="inp_text">
        </div>
    </form>
    <div class="search_box">
        <div class="search_box_">
            <a href="findIdByNamePhone.do">아이디 찾기</a>
        </div>
        <div class="search_box_">
            <a href="findPwPage.do">비밀번호 찾기</a>
        </div>
    </div>
</div>
    
<%@ include file="../layout/footer.jsp" %>