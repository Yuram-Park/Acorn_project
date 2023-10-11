<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="comment_bean.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dao" class="comment_bean.CommentDao"/>

<%
	int comment_id = Integer.parseInt(request.getParameter("comment_id"));
	CommentDto dto = (CommentDto)dao.getCommentUpdate(comment_id);
	
	dao.setCommentDelete(comment_id);

	response.sendRedirect("../review_board/Review_board_detail.jsp?post_id="+ dto.getPost_id()); // 해당 글로 넘어가게 하기
%>
</body>
</html>