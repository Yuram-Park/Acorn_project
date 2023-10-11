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
	public void setComment(CommentDto dto) {
		String sql = "INSERT INTO tblcomment (comment_id, user_id, user_nickname, post_id, comment_content) "
				+ "VALUES (comment_id_seq.nextval, ?, ?, ?, ?)";
		
		try {
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, dto.getUser_id());
			stmt.setString(2, dto.getUser_nickname());
			stmt.setInt(3, dto.getPost_id());
			stmt.setString(4, dto.getComment_content());
			stmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("setComment : "+ e);
		} finally {
			freeConnection();
		}
	}
	
	
	// 댓글 보여주기 detail.jsp
	public List getComment(int post_id) {
		String sql = "SELECT comment_id, user_nickname, comment_content, comment_create_date, user_id "+
				"FROM tblcomment WHERE post_id=?";
		Vector vec = new Vector();
		
		try {
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, post_id);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				CommentDto dto = new CommentDto();
				dto.setComment_id(Integer.parseInt(rs.getString("comment_id")));
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_nickname(rs.getString("user_nickname"));
				dto.setComment_content(rs.getString("comment_content"));
				dto.setComment_create_date(rs.getDate("comment_create_date"));
				
				vec.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getComment : "+ e);
		} finally {
			freeConnection();
		}
		return vec;
	}
	
	
	//임시 댓글수정 보여주기
	public CommentDto getCommentUpdate(int comment_id) {
		String sql = "SELECT user_nickname, comment_content, user_id, post_id FROM tblcomment WHERE comment_id=?";
		CommentDto dto = new CommentDto();
		try {
		con = ds.getConnection();
		stmt = con.prepareStatement(sql);
		stmt.setInt(1, comment_id);
		rs = stmt.executeQuery();
		
		while(rs.next()) {
			dto.setUser_nickname(rs.getString("user_nickname"));
			dto.setComment_content(rs.getString("comment_content"));
			dto.setPost_id(Integer.parseInt(rs.getString("post_id")));
		}
		} catch(Exception e) {
			System.out.println("getCommentUpdate : " + e);
		}finally {
			freeConnection();
		}
		
		return dto;
	}
	

	// update_proc.jsp
	public void setCommentUpdate(CommentDto dto) {
		String sql = "UPDATE tblcomment SET comment_content=? WHERE comment_id=?";
		
		try {
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, dto.getComment_content());
			stmt.setInt(2, dto.getComment_id());
			stmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("setCommentUpdate : "+ e);
		} finally {
			freeConnection();
		}
	}
	
	// delete.jsp
	public void setCommentDelete(int comment_id) {
		String sql = "DELETE FROM tblcomment WHERE comment_id=?";
		
		try {
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, comment_id);
			stmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("setCommentUpdate : "+ e);
		} finally {
			freeConnection();
		}
	}
	
}
