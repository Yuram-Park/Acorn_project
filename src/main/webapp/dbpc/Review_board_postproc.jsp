<!-- DBPC 방식 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="dbcp.DBConnection_maria" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>

<%
	request.setCharacterEncoding("euc-kr");

	/* 세션에서 id 가져오기
	String user_id = (String)session.getAttribute("user_id");
	*/
	// 일단 입력값 받는것으로
	String user_id = request.getParameter("user_id");
	int post_id = Integer.parseInt(request.getParameter("post_id"));
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	Connection con = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	
	Context ctx = new InitialContext();
	DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc_mariadb");
	
	try{
		con = ds.getConnection();
		
		String sql = "insert into post(post_id, user_id, board_id, title, content, create_date, update_date, views) "
				+ "values(?, ?, 3, ?, ?, now(), now(), 0)"; // post_id에 시퀀스 넣기
		stmt = con.prepareStatement(sql);
		stmt.setInt(1, post_id); // post_id에 시퀀스 넣기
		stmt.setString(2, user_id); 
		stmt.setString(3, title);
		stmt.setString(4, content);
		stmt.executeUpdate();
		
		response.sendRedirect("Review_board_list.jsp");
	}
	catch (Exception err){
		System.out.println("Review_board_postproc.jsp");
	}
	finally {
		if(rs !=null) rs.close();
		if(stmt !=null) stmt.close();
		if(con !=null) con.close();
	}
	
	
	
	

%>