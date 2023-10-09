<!-- JavaBean 방식 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="review_boardbean.*" %>
<%@ page import="comment_bean.*" %>

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
		BoardDto detailDto = (BoardDto)dao.getReviewDetail(dto);
	%>
	
	<table bgcolor="#E2E2E2" width="80%" align="center">
		<tr align="center">
			<td colspan="3"><h3><%=detailDto.getPost_title() %></h3></td>
		</tr>
		<tr>
			<td align="left" width="70%">조회수 <%= detailDto.getPost_views() %></td>
			<td align="center" width="15%" style="border-right:1px solid black;"><%= detailDto.getUser_nickname() %></td>
			<td align="center" width="15%"><%= detailDto.getPost_create_date() %></td>
		</tr>		
		<tr>
			<hr/>
			<td colspan="3" height="300px" style="border-top:1px solid black;"><%= detailDto.getPost_content() %></td>
		</tr>
		<tr>
			<td colspan="3"><div>이미지<img src=""/></div></td>
		</tr>
	</table>
	
	<br><br>
	
<%
	String user_id = detailDto.getUser_nickname();
	
	if(user_id.equals(session.getAttribute("user_id"))) {
%>
	<input type="button" value="수정하기" onClick="location='Review_board_update.jsp?post_id=<%=detailDto.getPost_id() %>'"/>
	<input type="button" value="삭제하기" onClick="location='Review_board_delete.jsp?post_id=<%=detailDto.getPost_id() %>'"/>
<%
	}
%>
	
	<input type="button" value="게시글 좋아요 하기"/>
	<input type="button" value="목록" onClick="location='Review_board_list.jsp'"/>
	
	<br><br>
	
	<jsp:useBean id="commentDto" class="comment_bean.CommentDto"/>
	<jsp:setProperty property="post_id" name="commentDto"/>
	<jsp:useBean id="commentDao" class="comment_bean.CommentDao"/>
	
	<h3>댓글 ? 개</h3>
	<form method="post" action="Comments.jsp" >
		<input type="hidden" value="<%=detailDto.getPost_id()%>" name="post_id"/>
		<input type="text" value="<%=session.getAttribute("user_nickname") %>" name="user_nickname" readonly/>
		<textarea placeholder="댓글을 입력해주세요" name="comments_content" style="width:60%;height:20px;"></textarea><br><br>
		<input type="submit" value="댓글 달기"/>
	</form>
	<table width="80%" align="center">
<%
	Vector vec = (Vector)commentDao.getComments(detailDto.getPost_id());
	
	for(int i=0; i<vec.size(); i++){
		CommentDto comment = (CommentDto)vec.get(i);
%>
		<tr>
			<td ><%=comment.getUser_nickname() %></td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black;"><h5><%=comment.getComments_content() %></h5></td>
		</tr>
<%
	}
%>
	</table>
	
</body>
</html>