<!-- JavaBean 방식 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="review_boardbean.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dto" class="review_boardbean.BoardDto"/>
<jsp:setProperty property="post_id" name="dto"/>
<jsp:useBean id="dao" class="review_boardbean.BoardDao"/>

	<h1>후기 게시판</h1>
	
	<%
		BoardDto detailDto = dao.getReviewDetail(dto);
	%>
	<form name="review_board_update" method="post" action="Review_board_updateproc.jsp">		
		<input type="hidden" name="post_id" value="<%=detailDto.getPost_id() %>"/>
		<input type="hidden" name="user_nickname" value="<%=detailDto.getUser_nickname() %>"/>	
		<input type="text" name="post_title" size="40" value="<%=detailDto.getPost_title() %>"/><br><br>
		<textarea name="post_content" style="width:80%;height:200px;"><%=detailDto.getPost_content() %></textarea><br><br>
		<input type="text" size="40" value="사진 추가 (사진은 최대 20장까지 등록 가능합니다)"/><br><br>
		<input type="reset" value="작성취소"/>
		<input type="submit" value="등록하기"/>
	</form>
</body>
</html>