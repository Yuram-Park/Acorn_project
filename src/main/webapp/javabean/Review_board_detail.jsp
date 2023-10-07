<!-- JavaBean 방식 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	
	<input type="button" value="수정하기" onClick="location='Review_board_update.jsp?post_id=<%=detailDto.getPost_id() %>'"/>
	<input type="button" value="삭제하기" onClick="location='Review_board_delete.jsp?post_id=<%=detailDto.getPost_id() %>'"/>
	<input type="button" value="게시글 좋아요 하기"/>
	<input type="button" value="목록" onClick="location='Review_board_list.jsp'"/>
	
	<br><br>
	
	<h3>댓글 ? 개</h3>
	<input type="button" value="댓글 달기"/>
	<table width="80%" align="center">
		<tr>
			<td style="border-bottom:1px solid black;">댓글 제목</td>
		</tr>
		<tr>
			<td>댓글 내용</td>
		</tr>
	</table>
	
</body>
</html>