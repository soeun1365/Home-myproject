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
</style>
	
<div class="indexContainer">
	여기는메인
</div>
	
<%@ include file="layout/footer.jsp" %>