package comment_bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CommentDao {

	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DataSource ds;
	
	
	public CommentDao () {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");
			
		} catch (Exception err) {
			System.out.println("BoardDao.java:" + err);
		}
	}
	
	// close
	public void freeConnection() {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	// Comments.jsp
	public void setComments(CommentDto dto) {
		String sql = "INSERT INTO comments (comments_id, user_id, user_nickname, post_id, comments_content) "
				+ "VALUES (comments_id_seq.nextval, ?, ?, ?, ?)";
		
		try {
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, dto.getUser_id());
			stmt.setString(2, dto.getUser_nickname());
			stmt.setInt(3, dto.getPost_id());
			stmt.setString(4, dto.getComments_content());
			stmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("setComments : "+ e);
		} finally {
			freeConnection();
		}
	}
	
	
	// 댓글 보여주기 detail.jsp
	public List getComments(int post_id) {
		String sql = "SELECT comments_id, user_nickname, comments_content, comments_create_date, user_id "+
				"from comments WHERE post_id=?";
		Vector vec = new Vector();
		
		try {
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, post_id);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				CommentDto dto = new CommentDto();
				dto.setComments_id(Integer.parseInt(rs.getString("comments_id")));
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_nickname(rs.getString("user_nickname"));
				dto.setComments_content(rs.getString("comments_content"));
				dto.setComments_create_date(rs.getDate("comments_create_date"));
				
				vec.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getComments : "+ e);
		} finally {
			freeConnection();
		}
		return vec;
	}
	
	
	//임시 댓글수정 보여주기
	public CommentDto getCommentUpdate(int comments_id) {
		String sql = "SELECT user_nickname, comments_content, user_id FROM comments WHERE comments_id=?";
		CommentDto dto = new CommentDto();
		try {
		con = ds.getConnection();
		stmt = con.prepareStatement(sql);
		stmt.setInt(1, comments_id);
		rs = stmt.executeQuery();
		} catch(Exception e) {
			System.out.println("getComments : " + e);
		}finally {
			freeConnection();
		}
		
		return dto;
	}
	

	// update_proc.jsp
	public void setCommentUpdate(CommentDto dto) {
		String sql = "UPDATE comments SET comments_content=? WHERE comments_id=?";
		
		try {
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, dto.getComments_content());
			stmt.setInt(2, dto.getComments_id());
			stmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("setCommentUpdate : "+ e);
		} finally {
			freeConnection();
		}
	}
	
}
