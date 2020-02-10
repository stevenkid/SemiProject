<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<%-- GNB --%>
<div id="gnb"></div>
<script type="text/javascript">
$(function () {
	$("#gnb").load("./GNB/gnb.jsp");
});
</script>

<%--페이지 시작. --%>

<h1>아이디 찾기</h1>
<form action="find?command=findId" id="frm1">
<table>
	<tr>
		<td><input type="text" name="name" placeholder="이름을 입력해주세요" ></td>
	</tr>
	<tr>	
		<td><input type="text" name="idEmail" placeholder="가입하신 이메일 주소를 입력해주세요."></td>
	</tr>
	<tr>
		<td align="center"><button type="button" onclick="findId()" >아이디찾</button>></td>
	</tr>
</table>
</form>

<div id="foundId"></div>


<h1>비밀번호 찾기</h1>
<form action="find?command=findId" id="frm2">
<table>
	<tr>
		<td><input type="text" name="name" placeholder="아이디를 입력해주세요" ></td>
	</tr>
	<tr>	
		<td><input type="text" name="idEmail" placeholder="가입시 입력하신 이메일 주소를 입력해주세요."></td>
	</tr>
	<tr>
		<td align="center"><input type="submit" value="비밀번호찾기"></td>
	</tr>
</table>
</form>

<script type="text/javascript">
 function findId() {
	$.ajax({ 
		type :
		url :
		data :
		success	
		
		
		
		
	});
	
}








</script>

</body>
</html>