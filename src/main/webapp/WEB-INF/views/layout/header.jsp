<%@page import="java.util.Optional"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ASE Project</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<style>
	*{
		padding: 0;
		margin: 0;
		box-sizing: border-box;	
		background-color: beige;
	}
	.indexContainer{
		margin: auto;
		width: 800px;
        height: 500px;
	}
	.logo_name{
		margin-top: 30px;
		text-align: center;
	}
	.logo_name a{
		text-align: center;
		color: black;
	}
	h1 a{
		text-decoration: none;
		color: black;
		font-weight: bolder;
	}
	.member_info{
		width: 300px;
        height: 30px;
        margin-bottom: 20px;
        display: block;
		float: right;
		text-align: right;
	}
	.member_info a{
		text-decoration: none;
		font-weight: bolder;
		color: black;
	}
	.member_info a:hover{
		text-decoration: none;
		color: #b1c254;
	}
	ul{
		width: 100%;
		height: 52px;
		list-style: none;
		padding-left: 0;
		background-color: #b1c254;
		border-top: 1px solid #eed538;
        border-bottom: 1px solid #eed538;
        display: flex;
        justify-content: center;
	}
	li{
		width: 30%;
		height: 50px;
		display: inline-block;
		background-color: #b1c254;
	}
	li a{
        display: block;
        line-height: 50px;
        text-align: center;
		text-decoration: none;
		background-color: #b1c254;
        font-weight: bold;
        font-size: 16px;
		color: black;
	}
    .nav a:hover{
       background-color: #eed538;
    }
</style>
<body>
<div class="indexContainer">
	<header>
		<a href="index.do">
			<img src="">
		</a>
		<div class="logo_name">
			<h1><a href="index.do">키.사.모</a></h1>
			<p>키위를 사랑하는 모임</p>
		</div>
		<div class="member_info">
			<c:if test="${loginUser == null}">
				<a href="loginPage.do">로그인</a> |
				<a href="joinPage.do">회원가입</a>
			</c:if>
			<c:if test="${loginUser != null}">
				<p>${loginUser.name}님 반갑습니다</p>
				<a href="logout.do">로그아웃</a> |
				<a href="myPage.do">마이페이지</a>	
			</c:if>
		</div>
	<nav>
		<ul class="nav">
            <li><a href="galaryPage.do">갤러리</a></li>
			<li><a href="freePage.do">자유게시판</a></li>
		</ul>
	</nav>
	</header>
	<section>