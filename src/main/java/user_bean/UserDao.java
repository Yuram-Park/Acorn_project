package user_bean;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class UserDao {

	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DataSource ds;
	
	public UserDao () {
		Context ctx;
		try {
			ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc_mariadb");
		} catch (Exception e) {
			System.out.println("LoginDao: " + e);
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
	
	
	// Login_proc.jsp
	public int getLogin(String user_id, String user_pw) {
		String sql = "SELECT user_pw FROM tbluser WHERE user_id=?";
	
		try {
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, user_id);
			rs = stmt.executeQuery();

			if(rs.next()) {
				if(user_pw.equals(rs.getString("user_pw"))) {
					return 1;
				} else
					return 0;
			} else
				return -1;
		} catch (Exception e) {
			System.out.println("getLogin :" + e);
			return -2;
		} finally {
			freeConnection();
		}
	}
	
	// Session 저장
	
	public UserDto getSession(String user_id) {
		String sql = "SELECT user_nickname FROM tbluser WHERE user_id=?";
		UserDto dto = new UserDto();
		try {
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, user_id);
			rs = stmt.executeQuery();

			if(rs.next()) {
				dto.setUser_nickname(rs.getString("user_nickname"));
			}
				
		} catch (Exception e) {
			System.out.println("getSession :" + e);
		} finally {
			freeConnection();
		}
		return dto;
	}
	
	// Join_proc.jsp
	public void setJoin(UserDto dto) {
		String sql = "INSERT INTO tbluser (user_id, user_pw, user_email, user_name, user_nickname, user_gender,"
				+ " user_grade, user_birthday, user_m_type)VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, dto.getUser_id());
			stmt.setString(2, dto.getUser_pw());
			stmt.setString(3, dto.getUser_email());
			stmt.setString(4, dto.getUser_name());
			stmt.setString(5, dto.getUser_nickname());
			stmt.setString(6, String.valueOf(dto.getUser_gender()));
			stmt.setString(7, dto.getUser_grade());
			stmt.setDate(8, dto.getUser_birthday());
			stmt.setString(9,String.valueOf(dto.getUser_m_type()));
			stmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("setJoin :" + e);
		} finally {
			freeConnection();
		}
	}
	
	
	
}

