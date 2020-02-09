<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<%-- GNB --%>
	<div id="gnb"></div>
	<script type="text/javascript">
		$(function() {
			$("#gnb").load("./GNB/gnb.jsp");
		})
	</script>

	<%--페이지 시작. --%>
	<div align="center">
		<h1>회원가입</h1>
		<form id="frm" name="frm" action="addmember" method="post">
			<input type="hidden" name="command" value="addAf">
			<table>
				<col width="150">
				<col width="500">
				<tr>
					<td>아이디:</td>
					<td><input type="text" class="del" id="_id" name="id"
						not_null="true" hg_nm="아이디">
						<button type="button" id="dupl" onclick="idDuplChk()">ID중복체크</button></td>
				</tr>
				<tr>
					<td>비밀번호:</td>
					<td><input type="password" class="del" id="pwd1"
						name="password" not_null="true" hg_nm="비밀번호"></td>
				</tr>
				<tr>
					<td>비밀번호 확인:</td>
					<td><input type="password" class="del" id="pwd2"
						name="passchk"></td>
				</tr>
				<tr>
					<td></td>
					<td>
						<!-- 비밀번호 일치여부 확인문구 -->
						<div class="alert-notice" id="alert-notice">위와 동일한 비밀번호를
							다시한번 입력해주세요.</div>
						<div class="alert alert-success" id="alert-success">비밀번호가
							일치합니다.</div>
						<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지
							않습니다.</div>
					</td>
				</tr>
				<tr>
					<td>이름:</td>
					<td><input type="text" class="del" id="_name" name="name"
						not_null="true" hg_nm="이름"></td>
				</tr>
				<tr>
					<td>휴대폰번호:</td>
					<td><input type="text" class="del" id="phoneNum"
						name="call_number" not_null="true" hg_nm="휴대폰번호"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" class="del" id="_emailFront"
						name="emailFront" not_null="true" hg_nm="이메일">@ <input
						type="text" class="del" id="_emailBack" name="emailBack"
						placeholder="직접입력해주세요" value="" not_null="true" hg_nm="아이디">
						<!-- 이메일 뒷부분 주소 선택 --> <select id="_email">
							<option value="" selected="selected">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="hanmail.net">hanmail.net</option>
					</select>
				</tr>
				<tr>
					<td></td>
					<td colspan="2">
						<!-- 이메일주소 양식 맞는지 여부 -->
						<div class="alert-wrong" id="_alert-wrong">이메일주소를 다시 확인해주세요</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><br>
						<!--  <button type="button" id="_submit" onclick="register()"
							disabled="disabled">회원가입</button> -->
						<input type="submit" id="_submit" value="회원가입" disabled="disabled">
						<button type="button" id="restart">다시작성</button></td>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		var idck = 0; // id 중복검사 여부 확인
		var checkedId;


		$(function() {
			$("#_id").focus();
			
			// 이메일 앞부분 양식에 맞는지 확인
			$("#_alert-wrong").hide();
			$("#_emailFront").keyup(function() {
				var inputBack = $("#_emailBack").val();
				var emailChk = /\w/ + g; // 정규표현식 알맞게 쓰기
				if (emailChk.test(inputBack)) {
					alert("양식에 맞습니다");
					$("#_alert-wrong").hide();
				} else if (!emailChk.test(inputBack)) {
					$("#_alert-wrong").show();
					alert("양식에 맞지않습니다");
				}
			});
			//이메일 뒷부분 선택
			$("#_email").change(function() {
				//직접입력, 양식에 맞는지 확인하는 코드 작성하기
				if ($("#_email").val() == "") {
					$("#_emailBack").attr('value', "");
					$("#_emailBack").removeAttr('readonly');

				} else if ($("#_email").val() == "naver.com") {
					$("#_emailBack").attr({
						value : "naver.com",
						readonly : "readonly",
					});
				} else if ($("#_email").val() == "gmail.com") {
						alert("gmail.com")
					$("#_emailBack").attr({
						value : "gmail.com",
						readonly : "readonly",
					});
				} else if ($("#_email").val() == "hanmail.net") {
					$("#_emailBack").attr({
						value : "hanmail.net",
						readonly : "readonly",
					});
				}
			});

			// 다시작성 클릭시 입력된 정보들 지우기
			$("#restart").click(function() {
				// alert("click");
				$(".del").val("");
				$("#alert-notice").hide();
				$("#alert-success").hide();
				$("#alert-danger").hide();
			});
			// id 중복체크
		 /*
			$("#dupl").click(function() {
				var inputId = $("#_id").val();
				if (inputId != "") {
					$.ajax({
						type : "POST",
						url : 'addmember?command=duplCheck&id=' + inputId,
						data : {
							"id" : inputId
						},
						success : function(data) {
							if (data.cnt > 0) {
								alert("이미 사용자가 있는 아이디 입니다");
								$("#_id").val("");
								$("#_id").focus();
							} else {
								alert("사용 가능한 아이디 입니다");
								idck = 1;
								chcekdId = inputId;
								System.out.println("idcheck" + idck);
							 	System.out.println("checkedId" + checkedId);
							}
						},
						error : function() {
							alert("실패")
						}

					});
				} else {
					alert("아이디를 입력해주세요.");
					$("#_id").focus();
				}

			});
			/**/
			
			$("#alert-notice").hide();
			$("#alert-success").hide();
			$("#alert-danger").hide();
			//비밀번호 확인칸에 포커스 이동시 문구 보이도록
			$("#pwd2").focus(function() {
				if ($("#pwd1") != "" && $("#pwd2") == "") {
					$("#alert-notice").show();
				}
			});
			//비밀번호 재입력 제대로 입력했는지 확인문구 띄우기
			$("input").keyup(function() {
				var pwd2 = $("#pwd2").val();
				var pwd1 = $("#pwd1").val();
				if (pwd1 != "" && pwd2 != "") {
					if (pwd1 == pwd2) { // 비밀번호 일치할때
						$("#_submit").removeAttr("disabled");
						$("#alert-notice").hide();
						$("#alert-success").show();
						$("#alert-danger").hide();

					} else if (pwd1 != pwd2) { // 비밀번호 일치하지 않을때
						$("#alert-notice").hide();
						$("#alert-success").hide();
						$("#alert-danger").show();
						$("#submit").attr("disabled", "disabled");
					}
				} else { // 둘중하나라도 입력되지 않았을때
					$("#alert-notice").hide();
					$("#alert-success").hide();
					$("#alert-danger").hide();
					$("#submit").attr("disabled", "disabled");
				}
			});
			
			
			// form 유효성 검사
			function register() {
				alert("확인");
			// 	System.out.println("idcheck" + idck);
			// 	System.out.println("checkedId" + checkedId);
			 	
				//if(idcheck == 1 && checkedId.equals($("#_id").val())){	
					alert("id 중복검사를 하였습니");
					if (valchk('#frm')) {
						//모든 항목 입력 되면 회원가입 controller로 이동
						alert("true");
						document.getElementById('frm').submit();
				//	}
				
				}else{
					alert("아이디 중복검사를 해주세요");
				}
			}

			function valchk(formId) {
				// 입력해야하는 항목 가져오기
				var formObj = $("" + formId + "");
				var objs = formObj.find("[not_null]");

				// alert(objs.length);

				// 항목의 값 검증
				for (var i = 0; i < objs.length; i++) {
					if (objs.eq(i).val() == '') {
						alert("확인33")
						alert('"' + objs.eq(i).attr("hg_nm") + '"을(를)입력해주십시오');
						objs.eq(i).focus();

						return false;
					}
				}
				return true;
			}
		});
	</script>
</body>
</html>