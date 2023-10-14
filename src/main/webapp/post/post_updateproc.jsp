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
postDao.updatePost(postDto);
response.sendRedirect("post_detail.jsp?post_id=" + postDto.getPost_id()); // 해당 글로 넘어가게 하기
%>

</body>
</html>