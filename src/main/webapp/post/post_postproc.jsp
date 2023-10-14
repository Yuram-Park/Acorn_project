<!-- JavaBean 방식 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="postDto" class="post.PostDto"></jsp:useBean>
<jsp:useBean id="postDao" class="post.PostDao"></jsp:useBean>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:setProperty property="*" name="postDto"/>

<% 
postDao.setPost(postDto);
response.sendRedirect("post_list.jsp"); 
%>

</body>
</html>