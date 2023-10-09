<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>main</h1><br>
<%
	String user_id = (String)session.getAttribute("user_id");

	if(user_id == null) {
%>
		<a href="Login.jsp">로그인하기</a><br>
<%
	} else {
%>
		<a href="Logout.jsp">로그아웃</a><br>
<%
	}
%>
	<a href="Join.jsp">회원가입</a><br>
	<a href="../review_board/Review_board_list.jsp">후기 게시판</a>
	
	

</body>
</html>