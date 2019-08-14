<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
	<title>회원가입 화면</title>
	<link rel="stylesheet" href="assets/css/main.css"/>
<style>
		<!--.table #memberBir {display:inline}
		.table tr th {text-align:center;}
		.table tr .birthday { width :70%} -->
		.table #gender {display:inline}
		body .btn { text-align:center;}
		.table #email {display:inline; }
		</style>

	<script type="text/javascript">
	
		// 회원가입 화면의 입력값들을 검사한다.
		function checkValue()
		{
			var form = document.userInfo;
		
			if(!form.id.value){
				alert("아이디를 입력하세요.");
				return false;
			}
			
			if(form.idDuplication.value != "idCheck"){
				alert("아이디 중복체크를 해주세요.");
				return false;
			}
			
			if(!form.password.value){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			
			// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
			if(form.password.value != form.passwordcheck.value ){
				alert("비밀번호를 동일하게 입력하세요.");
				return false;
			}	
			
			if(!form.name.value){
				alert("이름을 입력하세요.");
				return false;
			}
			
			if(!form.birthyy.value){
				alert("년도를 입력하세요.");
				return false;
			}
			
			if(isNaN(form.birthyy.value)){
				alert("년도는 숫자만 입력가능합니다.");
				return false;
			}
			
			if(form.birthmm.value == "00"){
				alert("월을 선택하세요.");
				return false;
			}
			
			if(!form.birthdd.value){
				alert("날짜를 입력하세요.");
				return false;
			}
			
			if(isNaN(form.birthdd.value)){
				alert("날짜는 숫자만 입력가능합니다.");
				return false;
			}
			
			if(!form.mail1.value){
				alert("메일 주소를 입력하세요.");
				return false;
			}
			
			if(!form.phone.value){
				alert("전화번호를 입력하세요.");
				return false;
			}
			
			if(isNaN(form.phone.value)){
				alert("전화번호는 - 제외한 숫자만 입력해주세요.");
				return false;
			}
			
			if(!form.address.value){
				alert("주소를 입력하세요.");
				return false;
			}
		}
		
		// 취소 버튼 클릭시 첫화면으로 이동
		function goFirstForm() {
			location.href="MainForm.do";
		}	
		
		// 아이디 중복체크 화면open
		function openIdChk(){
		
			window.name = "parentForm";
			window.open("member/IdCheckForm.jsp",
					"chkForm", "width=500, height=300, resizable = no, scrollbars = no");	
		}

		// 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
		// 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
		// 다시 중복체크를 하도록 한다.
		function inputIdChk(){
			document.userInfo.idDuplication.value ="idUncheck";
		}
		
	</script>
	
</head>
<body>
		<br><br>
		<b><font size="6" color="gray">회원가입</font></b>
		<br><br><br>
		
		
		<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
		<!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 JoinPro.jsp -->
		<form method="post" action="MemberJoinAction.do" 
				name="userInfo" onsubmit="return checkValue()">
			<table class = "table" style="width:50%; margin:0 auto;">
				<tr>
					<th id="title"><br/>아이디</th>
					<td>
						<input type="text" name="id" maxlength="50" onkeydown="inputIdChk()">
						<input type="button" value="중복확인" onclick="openIdChk()">	
						<input type="hidden" name="idDuplication" value="idUncheck" >
					</td>
				</tr>
						
				<tr>
					<th id="title">비밀번호</th>
					<td>
						<input type="password" name="password" maxlength="50">
					</td>
				</tr>
				
				<tr>
					<th id="title">비밀번호 확인</th>
					<td>
						<input type="password" name="passwordcheck" maxlength="50">
					</td>
				</tr>
					
				<tr>
					<th id="title">이름</th>
					<td>
						<input type="text" name="name" maxlength="50">
					</td>
				</tr>
					
				<tr><th>생년월일-성별</th>
					<td>
						<input type="text" name="MemberBir" style="width:45%" id="memberBir" maxlength="6" minlength="6"  placeholder="예:960202" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
						 &nbsp- &nbsp<input type="text" name="MemberBir" id="gender" maxlength="1" placeholder="1" style="width:10%"; />
					&nbsp*&nbsp *&nbsp *&nbsp * &nbsp*&nbsp *
					</td>
				</tr><tr></tr>
					
				<tr>
					<th id="title">이메일</th>
					<td>
						<input type="text" name="mail1" id="email"style="width:51%" maxlength="50">&nbsp@&nbsp
						<select name="mail2" id="email" style="width:45%">
							<option>naver.com</option>
							<option>daum.net</option>
							<option>gmail.com</option>
							<option>nate.com</option>						
						</select>
					</td>
				</tr>
					
				<tr>
					<th id="title">휴대전화</th>
					<td>
						<input type="text" name="phone" maxlength="11" minlength ="10"/>
					</td>
				</tr>
				<tr>
					<th id="title"><br/><br/><br/>주소</th>
					<td>
								<input type="text" id="sample6_postcode" placeholder="우편번호">
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" id="sample6_address" placeholder="주소" size = 45><br>
<input type="text" id="sample6_detailAddress" placeholder="상세주소">
<input type="text" id="sample6_extraAddress" placeholder="참고항목">
				</td>
				</tr>
					<th>관심분야</th>
						<td><input type ="checkbox" name="like"  checked value ="Y"/>축구
							<input type ="checkbox" name="like" value ="Y"/>야구
							<input type ="checkbox" name="like" value ="Y"/>풋살
							<input type ="checkbox" name="like" value ="Y"/>여행
							<input type ="checkbox" name="like" value ="Y"/>운동
							<input type ="checkbox" name="like" value ="Y"/>요리
							<input type ="checkbox" name="like" value ="Y"/>방탈출
							</td>
								</tr>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
					</td>
			</tr>
			<tr><td colspan = 2>
			<input type="submit" value="가입"/>  
			<input type="button" value="취소" onclick="goFirstForm()">
			</td></tr>
			</table>
			
		</form>
			

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

</body>
</html>