<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="commentDto" class="comment.CommentDto"/>
<jsp:useBean id="commentDao" class="comment.CommentDao"/>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:setProperty property="*" name="commentDto"/>

<%
	String user_id = (String)session.getAttribute("sessionID");
    commentDto.setUser_id(user_id);

    commentDao.setComment(commentDto);
	response.sendRedirect("../post/post_detail.jsp?post_id="+commentDto.getPost_id());

%>

</body>
</html>