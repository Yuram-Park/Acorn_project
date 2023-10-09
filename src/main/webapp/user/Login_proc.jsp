<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user_bean.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dto" class="user_bean.UserDto"/>
<jsp:useBean id="dao" class="user_bean.UserDao"/>

<%
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	
	int result = dao.getLogin(user_id, user_pw);
	
	if(result == 1){
		session.setAttribute("user_id", user_id);
		UserDto userDto = (UserDto)dao.getSession(user_id);
		session.setAttribute("user_nickname", userDto.getUser_nickname());
		response.sendRedirect("main.jsp");
	} else if(result == 0){
%>
		<script>alert("비밀번호가 일치하지 않습니다.")</script>
<%
		response.sendRedirect("Login.jsp");
	} else if(result == -1) {
%>
		<script>alert("아이디가 일치하지 않습니다.")</script>
<%
		response.sendRedirect("Login.jsp");
	} else if (result == -2) {
		System.out.println("DB error");
		response.sendRedirect("Login.jsp");	
	} 
	System.out.println(session.getAttribute("user_id"));
	System.out.println(session.getAttribute("user_nickname"));
	session.setMaxInactiveInterval(600);
%>
	
</body>
</html>