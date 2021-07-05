<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../layout/header.jsp">
	<jsp:param value="비밀번호변경" name="title" />
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
	.showPw.jsp{
		width: 100%;
        margin-top: 30px;
        height: 500px;
        padding: 0 200px;
        text-align: center;
	}
	p{
		text-align: center;
	}
   
</style>
<div class="container">
	<div class="result">
		<p>
			회원탈퇴가 완료되었습니다.
			그동안 이용해주셔서 감사합니다.
			보다 나은 서비스로 찾아 뵙겠습니다.
		</p>
		<input type="button" value="첫화면으로 가기" id="goIndex_btn" onclick="location.href='index.do'">
	</div>
</div>

	
<%@ include file="../layout/footer.jsp" %>