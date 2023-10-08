<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dao" class="user_bean.UserDao"/>
<%
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	
	int result = dao.getLogin(user_id, user_pw);
	
	if(result == 1){
		session.setAttribute("user_id", user_id);
		session.setAttribute("user_pw", user_pw);
		
		response.sendRedirect("main.jsp");
	} else if(result == 0){
%>
		<script>alert("비밀번호가 일치하지 않습니다.")</script>
<%
		response.sendRedirect("Login.jsp");
	} else if(result == -1){
%>
		<script>alert("존재하지 않는 아이디입니다.")</script>
<%
		response.sendRedirect("Login.jsp");
	} else if(result == -2){
%>
		<script>alsert("DB error")</script>
<%
		response.sendRedirect("Login.jsp");
	}
		
%>
	
</body>
</html>