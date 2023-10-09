<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dto" class="user_bean.UserDto"></jsp:useBean>
<jsp:useBean id="dao" class="user_bean.UserDao"></jsp:useBean>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:setProperty property="user_id" name="dto"/><br>
<jsp:setProperty property="user_pw" name="dto"/><br>
<jsp:setProperty property="user_email" name="dto"/><br>
<jsp:setProperty property="user_name" name="dto"/><br>
<jsp:setProperty property="user_nickname" name="dto"/><br>
<jsp:setProperty property="user_grade" name="dto"/><br>

<%	
	String gender = request.getParameter("user_gender");
	char user_gender = gender.charAt(0);
	dto.setUser_gender(user_gender);
	
	String day = request.getParameter("user_birthday");
	Date user_birthday = java.sql.Date.valueOf(day);
	dto.setUser_birthday(user_birthday);
	
	String m_type = request.getParameter("user_m_type");
	char user_m_type = m_type.charAt(0);
	dto.setUser_m_type(user_m_type);
	
	
	dao.setJoin(dto);
	response.sendRedirect("main.jsp");
%>

</body>
</html>