<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:include page="../layout/header.jsp">
	<jsp:param value="회원가입" name="title" />
</jsp:include>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" referrerpolicy="no-referrer" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function(){
		idCheck();
		idUniqueCheck();
		pwCheck();
		pwCheck2();
		nameCheck();
		phoneCheck();
		emailCheck();
		getVerifyNum();
		addressCheck();
		join();
	});
	
	// 회원가입함수
	function join(){
		$('#join_btn').click(function(){
			if(!idPass){
				alert('아이디를 확인하세요');
				return false;
			}else if(!idUnique){
				alert('아이디 중복 체크해주세요.');
				return false;
			}else if(!pwPass){
				alert('비밀번호를 확인하세요');
				return false;
			}else if(!pw2Pass){
				alert('비밀번호 재확인하세요.');
				return false;
			}else if(!namePass){
				alert('이름을 확인하세요.');
				return false;
			}else if(!phonePass){
				alert('전화번호를 확인하세요.');   verifyPass = false
				return false;
			}else if(!emailPass){
				alert('이메일을 확인하세요.');	
				return false;
			}else if(!authPass){
				alert('이메일 인증을 받으세요.');	
				return false;
			}else if(!addressPass){
				alert('주소를 확인하세요.');
				return false;
			}else{
				$('#f').attr('action', 'join.do');
				$('#f').submit();
			}
		});
	}
	
	//아이디체크
	var idPass = false;
	function idCheck(){
		$('#id').keyup(function(){
			var regID = /^[a-z][a-zA-Z0-9]{4,9}$/;
			if (!regID.test($('#id').val())) {
				$('#idCheck').text('소문자로 시작하여 숫자를 포함한5~20자리 이어야합니다.').css('color','red');
				$('#id').focus();
				idPass = false;
			} else{
				$('#idCheck').text('아이디가 입력되었습니다.').css('color','green');
				$('#id').focus();
				idPass = true;
			}
		});
	}
	//아이디 중복체크
	var idUnique = false;
	function idUniqueCheck(){
		$('#id_btn').click(function(){
			$.ajax({
				url: 'idCheck.do',
				type: 'get',
				data: 'id='+ $('#id').val(),
				dataType: 'json',
				success : function(resultMap){
					if(resultMap.count != 0){
						alert('사용중인 아이디입니다.');
						idUnique = false;
					}else{
						alert('가입가능한 아이디 입니다.');
						idUnique = true;
					}
				},
				error : function(){
					
				}
			});
		});
	}
	//비밀번호체크
	var pwPass = false;
	function pwCheck(){
		$('#pw1').keyup(function(){
			var regPW = /^(?=.*[A-Z])(?=.*[~!@#$%^&*])[A-Za-z0-9~!@#$%^&*]{4,8}$/;
			if(!regPW.test($('#pw1').val())){
				$('#pw1Check').text('비밀번호는 대문자와 특수문자를 포함한 4~8자리 이어야합니다.').css('color', 'red');
				pwPass = false;
			}else{
				$('#pw1Check').text('사용가능한 비밀번호 입니다.').css('color', 'green');
				pwPass = true;
			}
		});
	}
	
	//비밀번호 재확인
	var pw2Pass = false;
	function pwCheck2(){
		$('#pw2').keyup(function(){
			if( $('#pw1').val() != $('#pw2').val()){
				$('#pw2Check').text('비밀번호 재확인이 필요합니다.').css('color', 'red');
				pw2Pass = false;
			}else{
				$('#pw2Check').text('비밀번호가 재확인 되었습니다.').css('color', 'green');
				pw2Pass = true;
			}
		});
	}
	
	//이름 확인
	var namePass = false;
	function nameCheck(){
		$('#name').keyup(function(){
			var regName = /^[가-힣a-zA-Z]{2,5}$/;
			if(!regName.test($('#name').val())){
				$('#nameCheck').text('이름을 확인해주세요.').css('color', 'red');
				namePass = false;
			}else{
				$('#nameCheck').text('이름이 입력되었습니다.').css('color', 'green');
				namePass = true;
			}
		});
	}
	
	//전화번호확인
	var phonePass = false;
	var regPhone2 = /^[0-9]{3,4}$/;
	var regPhone3 = /^[0-9]{4}$/;
	function phoneCheck(){
		$('#phone2').keyup(function(){
			if(!regPhone2.test($('#phone2').val()) || !regPhone3.test($('#phone3').val())){
				phonePass = false;
				$('#phoneCheck').text('전화번호를 확인해주세요').css('color', 'red');
			}else if(regPhone2.test($('#phone2').val()) && regPhone3.test($('#phone3').val())){
				phonePass = true;
				$('#phoneCheck').text('전화번호가 입력되었습니다.').css('color', 'green');
			}
		});
		$('#phone3').keyup(function(){
			if(!regPhone2.test($('#phone2').val()) || !regPhone3.test($('#phone3').val())){
				phonePass = false;
				$('#phoneCheck').text('전화번호를 확인해주세요').css('color', 'red');
			}else if(regPhone2.test($('#phone2').val()) && regPhone3.test($('#phone3').val())){
				phonePass = true;
				$('#phoneCheck').text('전화번호가 입력되었습니다.').css('color', 'green');
			}
		});
	}
	
	//이메일확인
	var emailPass = false;
	function emailCheck(){
		$('#email').keyup(function(){
			var regEmail = /^[a-z0-9][a-z0-9_-]*@[a-zA-Z0~9]+([.][a-zA-Z]{2,}){1,2}/;
			if(!regEmail.test($('#email').val())){
				$('#emailCheck').text('이메일을 확인해주세요.').css('color', 'red');
				emailPass = false;
			}else{
				emailPass = true;
			}
		});
	}
	
	// 이메일 인증번호 받기
	var verifyPass = false;
	function getVerifyNum(){
		$('#verify_num_btn').click(function(){
			$.ajax({
				url: 'verifyNum.do',
				type: 'get',
				data: 'email=' + $('#email').val(),
				dataType: 'json',
				success: function(resultMap){
					alert('인증코드가 발송되었습니다.');
					fn_verify(resultMap.authCode);  // 인증번호 검증 함수로 발행된 인증코드 전달
					verifyPass = true;
				},
				error: function(xhr, textStatus, errorThrown) {
					
				}
			});
		});
	}
	
	// 이메일 인증번호 검증 함수
	var authPass = false;  // 이메일 인증 통과여부
	function fn_verify(authCode){
		$('#verify_btn').click(function(){
			if(authCode == $('#user_key').val()){
				alert('인증되었습니다.');
				authPass = true;
			} else {
				alert('인증에 실패했습니다.');
				authPass = false;
			}
		});
	}
	
	//주소확인
	var addressPass = false;
	function addressCheck(){
		$('#address').keyup(function(){
			if($('#address').val() == ''){
				$('#addressCheck').text('주소를 확인하세요.').css('color', 'red');
				addressPass = false;
			}else{
				$('#addressCheck').text('주소가입력되었습니다.').css('color', 'green');
				addressPass = true;
			}
		});
	}
</script>
<style>
	.phone{
		width: 100px;
	}
</style>

	<form id="f" method="post">
		<table>
			<thead>
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="id" id="id">
						<input type="button" value="아이디 중복검사" id="id_btn">
					</td>
					<td><i class="far fa-check-circle"></i></td>
				</tr>
				<tr>
					<td colspan="3" id="idCheck">
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw1" id="pw1"></td>
					<td><i class="far fa-check-circle"></i></td>
					
				</tr>
				<tr>
					<td colspan="3" id="pw1Check"></td>
				</tr>
				<tr>
					<td>비밀번호 재확인</td>
					<td><input type="password" id="pw2"></td>
					<td><i class="far fa-check-circle"></i></td>
				</tr>
				<tr>
					<td colspan="3" id="pw2Check"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" id="name"></td>
					<td><i class="far fa-check-circle"></i></td>
				</tr>
				<tr>
					<td colspan="3" id="nameCheck"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>
						<select name="phone1" id="phone1" class="phone">
							<option value="010">010</option>
							<option value="010">011</option>
							<option value="010">016</option>
						</select> - 
						<input type="text" name="phone2" id="phone2" class="phone" maxlength="4"> - 
						<input type="text" name="phone3" id="phone3" class="phone" maxlength="4"></td>
						<td><i class="far fa-check-circle"></i></td>
				</tr>
				<tr>
					<td colspan="3" id="phoneCheck"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="text" name="email" id="email">
						<input type="button" value="인증번호받기" id="verify_num_btn"><br>
						<input type="text" id="user_key">
						<input type="button" value="인증하기" id="verify_btn">
					</td>
					<td><i class="far fa-check-circle"></i></td>
				</tr>
				<tr>
					<td colspan="3" id="emailCheck"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" id="address"></td>
					<td><i class="far fa-check-circle"></i></td>
				</tr>
				<tr>
					<td colspan="3" id="addressCheck"></td>
					<td><i class="far fa-check-circle"></i></td>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="3">
						<input type="button" id="join_btn" value="회원가입">
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
	
<%@ include file="../layout/footer.jsp" %>