<%@page import="dto.MemberDto"%>
<%@page import="dto.NoticeDto"%>
<%@page import="java.util.List"%>
<%@page import="MainAndNotice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
    request.setCharacterEncoding("utf-8");
    %>
    
    
    <%
   	MemberDto memberDto = (MemberDto)session.getAttribute("login");
  
    String searchWord = request.getParameter("searchWord");
    String choice = request.getParameter("choice");
    
    // sel 을 지정하는 이유는,
    // 검색옵션을 제목이나 작성자가 아닌 select 를 선택했을 경우에
    // 아무것도 수행하지 않게 하기 위해서이다.
    if(choice == null || choice.equals("")) {
    	choice = "sel";
    }
    
    // 검색타입을 지정하지 않고 choice 가 넘어왔을 때
    if(choice.equals("sel")) {
    	searchWord = "";
    }
    if(searchWord == null) {
    	searchWord = "";
    	choice = "sel";
    }
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
<h1>공지사항 페이지</h1>


<%
// paging

String sPageNumber = request.getParameter("pageNumber");
int pageNumber = 0;
if(sPageNumber != null && !sPageNumber.equals("")) {
	pageNumber = Integer.parseInt(sPageNumber);
}

NoticeDAO dao = NoticeDAO.getInstance();

List<NoticeDto> list = dao.getNoticePagingList(choice, searchWord, pageNumber);

int length = dao.getAllNotice(choice, searchWord);

System.out.println("총 글의 개수는 = " + length);

int noticePage = length / 10;
if(length % 10 > 0) {
	noticePage = noticePage + 1;
}
%>



<div align = "center">
<br><br><br><br>
<table border = "1" style = "border-collapse:collapse">
	<col width = "70"> <col width = "600"> <col width = "150"> <col width = "150"> <col width = "80">
	
	
	<tr>
		<th></th>		<!-- 번호인데 일부러 비워놔따 -->
		<th> 제목 </th>
		<th> 작성자 </th>
		<th> 작성일 </th>
		<th> 조회수 </th>
	</tr>
	
	
	
	
	<%
		if(list == null || list.size() == 0) {
	%>
	
	<tr>
		<td colspan = "3"> 작성된 공지사항이 없습니다. </td>
	</tr>
	
	
	
	<%
		} else {
			
			for(int i =0; i<list.size(); i++) {
				NoticeDto dto = list.get(i);
	%>
	
	<tr>
		<th> <%=i+1 %> </th>
		<td>
			<%
				if(dto.getDel() == 0) {
			%>
			<a href = "NoticeDetail.jsp?seq=<%=dto.getSeq() %>"> <%=dto.getTitle() %></a>
			<%
				} else {
			%> <font color = "#ff0000"> 이 글은 삭제된 글입니다. </font> <%
				}
			%>
		</td>
		<td align = "center"> <%=dto.getId() %> </td>
	</tr>
	
	
	
	<% 
			}
			}
	%>
	
</table>

	<%
		for(int i=0; i<noticePage; i++) {
			if(pageNumber == i) {
	%>
	
	<span style = "font-size: 15pt; color : #0000ff; font-weight:bold;">
		<%=i+1 %>
	</span>&nbsp;
	<%
			} else {
	%>
	
	<!-- a 버튼 클릭 시 goPage() 호출 -->
	<a href = "#none" title="<%=i+1 %> 페이지" onclick = "goPage(<%=i%>)"
					  style="font-size:15pt; color:#000; font-weight:bold; text-decoration:none">
					  [<%=i+1 %>]
	</a>&nbsp;
	<%
			}
		}
	%>
	<br>
</div>

</body>
</html>