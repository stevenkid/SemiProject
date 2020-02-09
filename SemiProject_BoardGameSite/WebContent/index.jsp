<<<<<<< HEAD
<%@page import="member.MemberDao"%>
=======
>>>>>>> Sub_Master
<%@page import="db.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>Index 페이지</h1>

<% DBConnection.initConnection(); %>
<<<<<<< HEAD
<%-- 
	MemberDao dao = MemberDao.getInstance();
	boolean isS = dao.test();
	
	System.out.println(isS);


--%>
=======
>>>>>>> Sub_Master

<%
	response.sendRedirect("main.jsp");
%>


</body>
</html>