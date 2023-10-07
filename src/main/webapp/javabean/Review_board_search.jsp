<!-- JavaBean ��� -->

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
	
	/* ���� ���� �Ϻθ� �������� */
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

	<h1>�ı� �Խ���</h1>
	<div style="float: right;">
		<select>
			<option>����</option>
			<option>����</option>
			<option>����+����</option>
			<option>�г���</option>
		</select> <input type="text" placeholder="�˻�" />
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
				<img src="../img/img1.jpeg" width="200px" heigth="200px" /> <!-- image �־���� -->
			</div>
			<div class="text">
				<a href="Review_board_detail.jsp?post_id=<%=dto.getPost_id() %>"><h3><%= dto.getTitle() %></h3></a>
				<table border="1" width="200px">
					<tr>
						<td colspan="2"><%= dto.getUser_id()%></td> <!-- �г������� �ٲ������ -->
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
	<input type="button" value="�Խñ� �ۼ��ϱ�" onClick="location='Review_board_post.jsp'"/>
</body>
</html>