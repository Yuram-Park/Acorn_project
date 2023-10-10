<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dto" class="comment_bean.CommentDto"/>
<jsp:useBean id="dao" class="comment_bean.CommentDao"/>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:setProperty property="*" name="dto"/>

<%
	String user_id = (String)session.getAttribute("sessionID");
	dto.setUser_id(user_id);
	
	dao.setComments(dto);
	response.sendRedirect("../review_board/Review_board_detail.jsp?post_id="+dto.getPost_id());
%>

</body>
</html>