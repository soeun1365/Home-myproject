<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../layout/header.jsp">
	<jsp:param value="아이디찾기" name="title" />
</jsp:include>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
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
	.searchId_form{
		width: 600px;
        margin-top: 30px;
        height: 500px;
        padding: 0 200px;
        text-align: center;
	}
    .input{
        width: 400px;
        height: 40px;
        border: 1px solid #f4e68f;
        padding: 10px;
        background-color: #f4e68f;
    }
    input[type:text]{
        border: none;
        outline: none;
        background-color: #f4e68f;
    }
    .inp_tex{
        width: 100%;
        border: none;
        outline: none;
        background: #f4e68f;
        font-size: 16px;
        color: black;
    }
    #serchId_btn{
        margin-top: 20px;
        width: 400px;
        height: 40px;
        background-color: #eed538;
        outline: none;
        border: none;
        border-radius: 5px;
        font-weight: bolder;
        font-size: 16px;
    }
    #serchId_btn:hover{
        cursor: pointer;
        background-color: #b1c254;
    }
    .searchId_form{
    	width: 100%;
    }
    .login_btn{
        margin-top: 20px;
        width: 400px;
        height: 40px;
        background-color: #eed538;
        outline: none;
        border: none;
        border-radius: 5px;
        font-weight: bolder;
        font-size: 16px;
    }
    .login_btn:hover{
        cursor: pointer;
        background-color: #b1c254;
    }
    .findPw{
        width: 100%;
        height: 50px;
        line-height: 50px;
        margin-top: 10px;
        text-align: center;
    	display: block;
    }
    .findPw > a{
    	text-align:center;
    	text-decoration: none;
    	color: black;
        font-size: 14px;
    }
    .findPw > a:hover{
    	color: #b1c254;
    	font-weight: bolder;
    }
</style>
<div class="container">
	<div class="searchId_form">
		<c:if test="${empty id}">
	        <p>일치하는 id가 없습니다.</p>
			<div class="findPw">
				<a href="findIdByNamePhone.do">아이디 찾기</a> |
		        <a href="findPw.do">비밀번호 찾기</a>
		    </div>
		</c:if>
		<c:if test="${not empty id}">
			<p>아이디는 ${id}입니다.</p>
			<input type="button" value="로그인하기" class="login_btn" onclick="location.href='loginPage.do'">
			<div class="findPw">
		        <a href="findPwPage.do">비밀번호 찾기</a>
		    </div>
		</c:if>
	</div>
</div>

	
<%@ include file="../layout/footer.jsp" %>