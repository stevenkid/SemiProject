<%@page import="dto.QnaDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<QnaDto> list = (List<QnaDto>)request.getAttribute("_qnalist");
System.out.println("qna.jsp 호출");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

<%-- GNB --%>
<div id="gnb"></div>
<script type="text/javascript">
$(function () {
	$("#gnb").load("./GNB/gnb.jsp");
})
</script>

<%--페이지 시작. --%>
<h1>QNA 페이지</h1>

<%-- 세션
<%
	Object ologin = session.getAttribute("login");
				// request.getSession().getAttribute(name)
	MemberDto mem = null;
	if(ologin == null){				
		%>
		<script type="text/javascript">
		alert("로그인 해 주십시오");
		location.href = "login.jsp";
		</script>
		<%
	}
	mem = (MemberDto)ologin;
%>	
 --%>

<div align="center">
<table border="1">
<col width="70"><col width="500"><col width="100"><col width="100"><col width="150">

<tr>
   <th>seq</th><th>title</th><th>id</th><th>답변유무</th><th>wdate</th>
</tr>

<%
if(list == null || list.size() == 0){
	%>
	<tr>
		<td colspan="5">작성된 글이 없습니다</td>
	</tr>
	<%
}else{
	for(int i = 0;i < list.size(); i++){
		QnaDto dto = list.get(i);
	%>
	<tr>
		<th><%=i + 1 %></th>
		<%
			if(dto.getDel() == 0) {	
		%>	
				<td>
					<a href="qnadetail?seq=<%=dto.getSeq() %>"><%=dto.getTitle() %></a>
				</td>		 
		 <%
			} else {
		 %>
		 		<td>
		 			<font color="#ff0000">이 글은 작성자에 의해서 삭제되었습니다</font>
		 		</td> 
		 <%
			}
		 %>		 
		<td align="center"><%=dto.getId() %></td>
		<% if(dto.getIs_answer() == 0) { %>
			<td align="center">답변대기</td>
		<% } else { %>
			<td align="center">답변완료</td>
		<% } %>
		
		
		<td align="center"><%=dto.getWdate() %></td>
	</tr>
	<%
	}
}
%>


</table>
<input type="button" onclick="location.href='qnaWrite?action=write'" value="등록하기">
</div>


<div align="center">

<select id="choice">
   <option value="sel">선택</option>
   <option value="title">제목</option>
   <option value="writer">작성자</option>
   <option value="content">내용</option>
</select>

<input type="text" id="search" value="">

<button onclick="searchBbs()">검색</button>

</div>








</body>
</html>