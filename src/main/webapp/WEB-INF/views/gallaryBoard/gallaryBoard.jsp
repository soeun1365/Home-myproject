<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:include page="../layout/header.jsp">
	<jsp:param value="자유게시판" name="title" />
</jsp:include>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		write();
	});
	function write(){
		$('#write_btn').click(function(){
			if($('#mno').val() == ''){
				alert('로그인 후 이용 가능합니다.');
			}else{
				location.href="writeBoardPage.do";
			}
		});
		$.ajax({
			url: '',
			
		});
	}
</script>
<style>
	p{
		display:inline-block;
		font-size: 12px;
	}
	table{
		width: 100%;
		border-collapse: collapse;
		border: 1px solid #eed538; 
	}
	.bottom_box{
		width: 100%;
	}
	#write_btn{
		margin: 20px 0;
        width: 100px;
        height: 25px;
        background-color: #eed538;
        outline: none;
        border: none;
        border-radius: 5px;
        font-weight: bolder;
        font-size: 16px;
	}
	#write_btn:hover{
		cursor: pointer;
		background-color: #b1c254;
	}
	.top_box{
		width: 100%;
	}
	td{
		padding: 10px;
	}
	thead td{
		text-align: center;
		font-weight: bolder;
	}
	thead td:nth-of-type(1){width:10%;}
	thead td:nth-of-type(2){width:50%;}
	thead td:nth-of-type(3){width:30%;}
	thead td:nth-of-type(4){width:10%;}
	#nolist{
		text-align: center;
	}
</style>
<div class="container">
	<div class="top_box">
		<input type="button" value="새글작성" id="write_btn">
		<c:if test="${empty loginUser.id}">
			<p>로그인 후 작성 가능합니다.</p>
		</c:if>
		<input type="hidden" value="${loginUser.id}" id="mno">
	</div>
	<div class="bottom_box">
	<br>
		<table border="1">
			<thead>
				<tr>
					<td>작성자</td>
					<td>제목</td>
					<td>작성일</td>
					<td>조회수</td>
				</tr>
			</thead>
			<tbody id="list">
				<c:if test="${empty list}">
					<tr>
						<td colspan="4" id="nolist">게시글이 없습니다.</td>
					</tr>
				</c:if>
				
			</tbody>
			<tfoot>
				<div id="paging"></div>
			</tfoot>
		</table>
	</div>
</div>
<%@ include file="../layout/footer.jsp" %>