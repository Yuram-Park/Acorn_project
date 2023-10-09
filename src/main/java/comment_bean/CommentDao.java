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
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc_mariadb");
			
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
				+ "VALUES (nextval(comments_id_seq), ?, ?, ?, ?)";
		
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
		String sql = "SELECT user_nickname, comments_content, comments_create_date "+
				"from comments WHERE post_id=?";
		Vector vec = new Vector();
		
		try {
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, post_id);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				CommentDto dto = new CommentDto();
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
	
}
