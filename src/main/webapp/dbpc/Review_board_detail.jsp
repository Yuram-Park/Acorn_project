<!-- DBCP 방식 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.Context" %>    
<%@ page import="javax.naming.InitialContext" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>후기 게시판</h1>
	
	<%
	int post_id = Integer.parseInt(request.getParameter("post_id"));
	String user_id = "";
	String title = "";
	String content = "";
	Date create_date = null;
	int views = 0;
	
	Connection con = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	Context ctx = new InitialContext();
	DataSource ds= (DataSource)ctx.lookup("java:comp/env/jdbc_mariadb");
	
	try{
		con = ds.getConnection();
		
		String sql = "select * from post where board_id=3 and post_id=" + post_id;
		stmt = con.prepareStatement(sql);
		rs = stmt.executeQuery();
		
		if(rs.next()){
			user_id = rs.getString("user_id");
			title = rs.getString("title");
			content = rs.getString("content");
			create_date = rs.getDate("create_date");
			views = rs.getInt("views");
		}
	}
	catch (Exception err) {
		System.out.println("Review_board_detail.jsp" + err);
	}
	finally {
		if(rs!=null){rs.close();}
		if(stmt!=null){stmt.close();}
		if(con!=null){con.close();}
	}
	
	%>
	
	<table bgcolor="#E2E2E2" width="80%" align="center">
		<tr align="center">
			<td colspan="3"><h3><%= title %></h3></td>
		</tr>
		<tr>
			<td align="left" width="70%">조회수 <%= views %></td>
			<td align="center" width="15%" style="border-right:1px solid black;"><%= user_id %></td>
			<td align="center" width="15%"><%= create_date %></td>
		</tr>		
		<tr>
			<hr/>
			<td colspan="3" height="300px" style="border-top:1px solid black;"><%= content %></td>
		</tr>
		<tr>
			<td colspan="3"><div>이미지<img src=""/></div></td>
		</tr>
	</table>
	
</body>
</html>