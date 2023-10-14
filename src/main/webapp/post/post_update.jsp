<!-- JavaBean 방식 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="post.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="postDto" class="post.PostDto"/>
<jsp:setProperty property="post_id" name="postDto"/>
<jsp:useBean id="postDao" class="post.PostDao"/>

	<h1>후기 게시판</h1>
	
	<%
		postDto = postDao.getPost(postDto.getPost_id());
		%>
	<form name="post_update" method="post" action="post_updateproc.jsp">		
		<input type="hidden" name="post_id" value="<%=postDto.getPost_id() %>"/>
		<input type="hidden" name="user_nickname" value="<%=postDto.getUser_nickname() %>"/>	
		<input type="text" name="post_title" size="40" value="<%=postDto.getPost_title() %>"/><br><br>
		<textarea name="post_content" style="width:80%;height:200px;"><%=postDto.getPost_content() %></textarea><br><br>
		<input type="text" size="40" value="사진 추가 (사진은 최대 20장까지 등록 가능합니다)"/><br><br>
		<input type="reset" value="작성취소"/>
		<input type="submit" value="등록하기"/>
	</form>
</body>
</html>