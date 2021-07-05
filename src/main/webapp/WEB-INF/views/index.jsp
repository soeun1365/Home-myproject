<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<jsp:include page="layout/header.jsp">
	<jsp:param value="키사모" name="title" />
</jsp:include>
<style>
	*{
		padding: 0;
		margin: 0;
		box-sizing: border-box;
	}
	.indexContainer{
		width: 800px;
		margin: auto;
		text-align: center;
	}
	.img_box{
		margin-top: 20px;
		width: 100%;
		display: flex;
		justify-content: center;
	}
	.main_img{
		width: 100%;
		height: auto;
		background-size: cover;
		background-position: center;
		background-repeat: no-repeat;
	}
</style>
	
<div class="indexContainer">
	<div class="img_box">
		<img class="main_img" alt="메인 이미지" src="assets/images/main_image.jpg" >
	</div>
</div>
	
<%@ include file="layout/footer.jsp" %>