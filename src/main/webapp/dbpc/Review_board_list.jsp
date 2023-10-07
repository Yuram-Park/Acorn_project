<!-- DBCP ��� -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.Context" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.container{
		display:flex;
	}
	.place{
		margin: 20px;
	}
</style>
</head>
<body>
	<h1>�ı� �Խ���</h1>
	<div style="float: right;">
		<select>
			<option>����</option>
			<option>����</option>
			<option>����+����</option>
			<option>�г���</option>
		</select> <input type="text" value="�˻�" />
	</div>
	<br>
	<div class="container">
	
	<%
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc_mariadb");
	
		try{
		
			con = ds.getConnection();
			
			String sql = "select post_id, user_id, board_id, title, content, create_date, views from post";
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				
				
		%>
	
		<div class="place">
			<div class="image">
				<img src="img/img1.jpeg" width="200px" heigth="200px" />
			</div>
			<div class="text">
				<a href="Review_board_detail.jsp?post_id=<%=rs.getInt("post_id")%>"><h3><%=rs.getString("title")%></h3></a>
				<table border="1" width="200px">
					<tr>
						<td colspan="2"><%=rs.getString("user_id") %></td>
					</tr>
					<tr>
						<td><%=rs.getDate("create_date") %></td>
						<td><%=rs.getString("views") %></td>
					</tr>
					<tr>
						<td colspan="2">�۳��� �Ϻ�</td>
					</tr>
				</table>
			</div>
		</div>
	
		<%
			}
		}
		catch(Exception err){
			System.out.println("Review_board_list:"+err);
		}
		finally{
			if(rs!=null){rs.close();}
			if(stmt!=null){stmt.close();}
			if(con!=null){con.close();}
		}
		%>
	</div>
	<input type="button" value="�Խñ� �ۼ��ϱ�" onClick="location='Review_board_post.jsp'"/>
</body>
</html>