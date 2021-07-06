<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:include page="../layout/header.jsp">
	<jsp:param value="자유게시판" name="title" />
</jsp:include>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" referrerpolicy="no-referrer" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		writeNewBoard();
	});
	
	function writeNewBoard(){
		$('#insert_btn').click(function(){
			if($('#title').val()==''){
				alert('제목은 필수입니다.');
			} else{
				$('#f').attr('action', 'insertGallaryBoard.do');
				$('#f').submit();
			}
		});
	}
</script>
<style>
	.top_box{
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
	.listbox{
		display: block;
	}
	table{
		width: 100%;
		border-collapse: collapse;
		border: 1px solid #eed538;
	}
	tfoot td, thead td{
		text-align: center;
	}
	.inp{
		padding: 10px;
		outline: none;
		border: none;
		width: 100%;
		height: 100%;
	}
	tr:nth-of-type(2){
		height: 100px;
	}
	tr > td:nth-of-type(1) {
		width: 20%;	
		text-align: center;
		font-weight: bolder;
		
	}
	tr > td:nth-of-type(2) {
		width: 70%;	
	}
	#insert_btn{
		margin: 10px 0;
        width: 200px;
        height: 50px;
        background-color: #eed538;
        outline: none;
        border: none;
        border-radius: 5px;
        font-weight: bolder;
        font-size: 16px;
	}
	#insert_btn:hover{
		cursor: pointer;
		background-color: #b1c254;
	}
</style>
<div class="container">
	<div class="top_box">
		<input type="button" value="목록보기" id="write_btn" onclick="location.href='galaryBoardPage.do'"><br>
		<br>
	</div>
	<div class="bottom_box">
	<form id="f" method="post" enctype="multipart/form-data">
		<table border="1">
			<input type="hidden" name="id" value="${loginUser.id}">
			<tbody>
				<tr>
					<td>제목</td>
					<td colspan="2">
						<input type="text" name="title" id="title" class="inp">
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="2">
						<textarea name="content" id="content" class="inp" cols="10" rows="10"></textarea>
					</td>	
				</tr>
				<tr>
					<td>이미지 첨부</td>
					<td colspan="2">
						<input type="file" name="filename"  id="filename" class="inp">
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="3">
						<input type="button" value="저장하기" id="insert_btn">
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
	</div>
</div>
<%@ include file="../layout/footer.jsp" %>