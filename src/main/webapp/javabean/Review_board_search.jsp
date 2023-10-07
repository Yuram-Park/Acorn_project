<!-- JavaBean 방식 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import="boardbean.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.container{
		display:flex;
		flex-wrap: wrap;
	}
	.place{
		margin: 20px;
	}
	
	/* 본문 내용 일부만 가져오기 */
	.content {
		display: inline-block;
		width: 200px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
</style>
</head>
<body>
	<jsp:useBean id="dao" class="boardbean.BoardDao"/>
	<%
		request.setCharacterEncoding("euc-kr");
	%>

	<h1>후기 게시판</h1>
	<div style="float: right;">
		<select>
			<option>제목</option>
			<option>내용</option>
			<option>제목+내용</option>
			<option>닉네임</option>
		</select> <input type="text" placeholder="검색" />
	</div>
	<br>
	<div class="container">
	
	<%
		
		int option = Integer.parseInt(request.getParameter("option"));
		String searchWord = request.getParameter("searchWord");
		
		Vector vector = (Vector)dao.getReviewSearch(option, searchWord);
		for (int i=0; i<vector.size(); i++) {
			BoardDto dto = (BoardDto)vector.get(i);
	
	%>
		<div class="place">
			<div class="image">
				<img src="../img/img1.jpeg" width="200px" heigth="200px" /> <!-- image 있어야함 -->
			</div>
			<div class="text">
				<a href="Review_board_detail.jsp?post_id=<%=dto.getPost_id() %>"><h3><%= dto.getTitle() %></h3></a>
				<table border="1" width="200px">
					<tr>
						<td colspan="2"><%= dto.getUser_id()%></td> <!-- 닉네임으로 바꿔줘야함 -->
					</tr>
					<tr>
						<td><%=dto.getCreate_date() %></td>
						<td><%=dto.getViews() %></td>
					</tr>
					<tr>
						<td colspan="2"><div class="content"><%=dto.getContent() %></div></td>
					</tr>
				</table>
			</div>
		</div>
	<%
		}
	%>
		
	</div><br><br>
	<input type="button" value="게시글 작성하기" onClick="location='Review_board_post.jsp'"/>
</body>
</html>