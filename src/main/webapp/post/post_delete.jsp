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
<jsp:useBean id="postDto" class="post.PostDto"/>
<jsp:useBean id="postDao" class="post.PostDao"/>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:setProperty property="post_id" name="postDto"/>


<%
postDao.deletePost(postDto);
response.sendRedirect("post_list.jsp");
%>

</body>
</html>