<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qnaWrite.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

<%-- GNB --%>
<div id="gnb"></div>
<script type="text/javascript">
$(function () {
	$("#gnb").load("./GNB/gnb.jsp");
})
</script>

<h1>질문 작성 페이지</h1>


<div align="center">
<form id="writeForm" action="qnaWrite?action=writeAf" method="post"> 
	<table border="1">
	<col width="150"><col width="600">
	<tr>
		<th>아이디</th>
		<td>
			<%-- <input type="text" name="id" size="50px" value="<%=mem.getId() %>"> --%>
			<%-- <input type="text" name="id" size="50px" value=${login.id } readonly="readonly"> --%>
			<input type="text" id="_id" name="_id" required>
		</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>
			<input type="text" id="email" name="email" maxlength="50" placeholder="이메일" required>
			<!-- maxlength="50" 필드 최대 문자 갯수 50자 -->
		</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>
			<input type="text" id="title" name="title" size="50px" placeholder="제목" required>
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<textarea rows="20" cols="70px" id="content" name="content" placeholder="질문" required></textarea>
		</td>
	</tr>
	<tr>
		<th>옵션</th>
		<td>
			<label>
				<input type="checkbox" id="secretChk" >비밀글
				<input type="hidden" id="secret" name="secret" value="0">
			</label>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" onclick="location.href='qnaList'" value="목록">
			<input type="submit" id="writeBtn" value="등록하기">
		</td>
	</tr>
	</table>
</form>
</div>




 
<script type="text/javascript">

// 비밀글 선택 처리 (기본:(0) / 비밀글:(1))
$(document).ready(function() {
	$("#secretChk").change(function(){
	    if($("#secretChk").is(":checked")){
	        $("#secret").val("1");	    	
	    //    alert("체크박스 체크했음!");
	    }
	   	/* 
	    else{
	    //    alert("체크박스 체크 해제!");
	    	$("#secret").val("2");
	    } 
	    */
	});
});


/* 
$("#writeBtn").click(function () {
	 
	if( $("#title").val().trim() == "") {
		alert("제목을 입력해 주세요");
		$("#title").focus();
	} else if( $("#content").val().trim() == "" ){
		alert("내용을 입력해 주세요");
		$("#content").focus();	
	} else if ($("#secret").is(":checked")) {
		$("#secret").val("1");	
	} else {
		$("#writeForm").attr({"action":"qnaWrite?action=writeAf"}).submit();		
	}
	var b = $("#secret").val();
	alert(b);
	
});
*/
 
</script>
</body>
</html>