package review_boardbean;

import java.sql.*;
import java.util.List;
import java.util.Vector;

import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class BoardDao {
	
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DataSource ds;
	
	
	public BoardDao () {
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
	
	// list.jsp, 검색기능
	public List getReviewList(String option, String searchWord) {
		// Board ID 설정 바꾸기 후기게시판 board_id =2 로 임시지정
		String sql = "SELECT post_id, user_id, user_nickname, post_title, "
				+ "post_content, post_create_date, post_update_date, post_views "
				+ "FROM tblpost WHERE board_id=2 ";
		
		if (searchWord == null || searchWord.isEmpty()) {
			sql = sql + "ORDER BY post_id";
		} else {
			switch(option) {
				case "t":
					sql = sql + "AND post_title Like '%" + searchWord + "%' ORDER BY post_id";
					break;
				case "c":
					sql = sql + "AND post_content Like '%" + searchWord + "%' ORDER BY post_id";
					break;
				case "tc":
					sql = sql + "AND post_title Like '%" + searchWord + "%' AND post_content Like '%" + searchWord + "%' ORDER BY post_id";
					break;
				case "n":
					sql = sql + "AND user_nickname Like '%" + searchWord + "%' ORDER BY post_id";
					break;
			}
		}
		
		
		Vector vector = new Vector();
		
		try {
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				BoardDto dto = new BoardDto();
				dto.setPost_id(rs.getInt("post_id"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_nickname(rs.getString("user_nickname"));
				dto.setPost_title(rs.getString("post_title"));
				dto.setPost_content(rs.getString("post_content"));
				dto.setPost_create_date(rs.getDate("post_create_date"));
				dto.setPost_views(rs.getInt("post_views"));
				
				vector.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getReviewList: " + e);
		} finally {
			freeConnection();
		}
		return vector;
	}
	
	
	// detail.jsp, update.jsp
	public BoardDto getReviewDetail(int post_id) {
		String sql = "select * from tblpost where board_id=2 and post_id=?";
		BoardDto detailDto = new BoardDto();
		try {
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, post_id);
			rs = stmt.executeQuery();
				
			while(rs.next()) {
					
				detailDto.setPost_id(post_id);
				detailDto.setPost_title(rs.getString("post_title"));
				detailDto.setPost_views(rs.getInt("post_views"));
				detailDto.setUser_id(rs.getString("user_id"));
				detailDto.setUser_nickname(rs.getString("user_nickname"));
				detailDto.setPost_create_date(rs.getDate("post_create_date"));
				detailDto.setPost_content(rs.getString("post_content"));
					
			}
		} catch (SQLException e) {
			System.out.println("getReviewDetail: " + e);
		} finally {
			freeConnection();
		}
		return detailDto;
	}
	
	
	// postproc.jsp
	public void setReviewPost(BoardDto dto) {
		String sql = "insert into tblpost(post_id, board_id, user_id, user_nickname, post_title, post_content) "
				+ "values(post_id_seq.nextval, 2, ?, ?, ?, ?)"; //date 및 views는 db에서 default값으로 설정
			
		try {
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, dto.getUser_id());
			stmt.setString(2, dto.getUser_nickname());
			stmt.setString(3, dto.getPost_title());
			stmt.setString(4, dto.getPost_content());
			stmt.executeUpdate();
				
		} catch (Exception e) {
			System.out.println("setReviewPost: " + e);
		} finally {
			freeConnection();
		}
	}
	
	// updateproc.jsp
	public void setReviewUpdate(BoardDto dto) {
		// 수정하기 버튼이 자기 글에서만 뜨게 수정 후 다시보기
		String sql = "UPDATE tblpost SET post_title=?, post_content=?, post_update_date=sysdate WHERE post_id=?"; 
		
		try {
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, dto.getPost_title());
			stmt.setString(2, dto.getPost_content());
			stmt.setInt(3, dto.getPost_id());
			stmt.executeUpdate();
					
		} catch (Exception e) {
			System.out.println("setReviewUpdate: " + e);
		} finally {
			freeConnection();
		}
	}
	
	// delete.jsp
	public void setReviewDelete(BoardDto dto) {
		// 삭제하기 버튼이 자기 글에서만 뜨게 수정 후 다시보기
		String sql = "DELETE FROM tblpost WHERE board_id=2 and post_id=?"; 
		
		try {
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, dto.getPost_id());
			stmt.executeUpdate();
				
		} catch (Exception e) {
			System.out.println("setReviewDelete: " + e);
		} finally {
			freeConnection();
		}
	}
	
}