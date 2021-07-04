<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:include page="../layout/header.jsp">
	<jsp:param value="아이디찾기" name="title" />
</jsp:include>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		searchId();
	});
	
	function searchId(){
		$('#serchId_btn').click(function(){
			if($('#name').val() == ''){
				alert('이름을 입력해주세요.');
				return false;
			} else if($('#phone').val() == ''){
				alert('전화번호를 입력해주세요.');
				return false;
			} else{
				$('#f').attr('action', 'showIdByNamePhone.do');
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
	.container{
		margin: 30px auto;
		width: 800px;
        height: 500px;
	}
	.searchId_wrap{
		width: 100%;
        height: 40px;
        display: flex;
        justify-content: center;
        margin-top: 100px;
	}
	.searchId{
		width: 30%;
		height: 40px;
        background-color: #f4e68f;
		border-bottom: 1px solid #eed538;
		line-height: 30px;
		margin: 0 10px;
		text-align: center;
	}
    .searchId:hover{
        border-bottom: 1px solid #b1c254;
    }
    .searchId:nth-of-type(2) a{
        background-color: lightgray;
    }
	.searchId a{
        display: block;
        width: 100%;
        height: 100%;
        background-color: #f4e68f;
        line-height: 40px;
		text-decoration: none;
		color: black;
	}
	.searchId_form{
        margin-top: 20px;
		width: 600px;
        padding: 0 200px;
        height: 500px;
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
    .input:nth-of-type(1){
        border-radius: 5px 5px 0 0;
    }
    .input:nth-of-type(2){
        border-radius: 0 0 5px 5px;
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
        font-size: 18px;
    }
    #serchId_btn:hover{
        cursor: pointer;
        background-color: #b1c254;
    }
    .findPw{
        width: 400px;
        margin-top: 10px;
        text-align: center;
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
	<div class="searchId_wrap">
		<div class="searchId">
			<b><a href="findIdByNamePhone.do">이름/전화번호로 찾기</a></b>
		</div>
		<div class="searchId">
			<a href="findIdByEmail.do">이메일로찾기</a>
		</div>
	</div>
    <div class="searchId_form">
        <form id="f" method="post">
            <div class="input">
             <input type="text" name="name" id="name" class="inp_tex" placeholder="이름">
             </div>
             <div class="input">
             <input type="text" name="phone" id="phone" class="inp_tex" placeholder="전화번호" maxlength="13">
             </div>
             <input type="button" value="아이디찾기" id="serchId_btn">
         </form>
        <div class="findPw">
            <a href="findPwPage.do">비밀번호 찾기</a>
        </div>
    </div>
</div>

	
<%@ include file="../layout/footer.jsp" %>