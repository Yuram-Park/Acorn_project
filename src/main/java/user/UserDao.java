package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDao {

    /*
     * Field
     */

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private DataSource ds;

    /*
     * Constructor
     */

    // Default Constructor
    public UserDao() {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc_mariadb");
        } catch (Exception e) {
            System.out.println("UserDAO() : " + e);
        }
    }

    /*
     * Method
     */

    // freeConnection
    public void freeConnection() {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // 회원 정보를 USER테이블에 저장하는 메서드
    public void insertUser(UserDto user) {
        try {
            String sql = "insert into tbluser" + " (user_id, user_grade, user_name, user_nickname,"
                    + "user_pw, user_gender, user_email, user_regdate) "
                    + "values(?, ?, ?, ?, ?, ?, ?, sysdate)";
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            // stringToDate(user);
            pstmt.setString(1, user.getUser_id());
            pstmt.setInt(2, user.getUser_grade());
            pstmt.setString(3, user.getUser_name());
            pstmt.setString(4, user.getUser_nickname());
            // pstmt.setDate(5, stringToDate(user));
            pstmt.setString(5, user.getUser_pw());
            pstmt.setString(6, user.getUser_gender());
            pstmt.setString(7, user.getUser_email());
            // 쿼리 실행
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            freeConnection();
        } // end try~catch
    } // end insertUser()

    // 로그인 시 아이디 ,비밀번호 체크 메서드
    // 아이디, 비밀번호를 인자로 받는다.
    public int loginCheck(String user_id, String user_pw) {
        String dbPW = ""; // db에서 꺼낸 비밀번호를 담을 변수
        int x;
        try {
            String sql = "select user_pw from tbluser where user_id=?";
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user_id);
            rs = pstmt.executeQuery();
            if (rs.next()) // 입력한 아이디에 해당하는 비밀번호가 있을 경우
            {
                dbPW = rs.getString("user_pw");
                if (dbPW.equals(user_pw))
                    x = 1; // 넘겨받은 비번과 꺼내온 비번 비교. 같으면 인증 성공
                else
                    x = 0;
            } else {
                x = -1; // 해당 아이디가 없는 경우
            }
            return x;
        } catch (Exception e) {
            e.printStackTrace();
            return -2; // 예외가 발생했을 때 반환할 값
        } finally {
            freeConnection();
        }
    } // end loginCheck()

    // 회원 정보 가져오기
    public UserDto getUser(String user_id) {
        String sql = "SELECT * FROM tbluser WHERE user_id = ?";
        UserDto user = new UserDto();
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user_id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                user.setUser_id(rs.getString("user_id"));
                user.setUser_pw(rs.getString("user_pw"));
                user.setUser_name(rs.getString("user_name"));
                user.setUser_nickname(rs.getString("user_nickname"));
                user.setUser_gender(rs.getString("user_gender"));
                user.setUser_email(rs.getString("user_email"));
                user.setUser_grade(rs.getInt("user_grade"));
                user.setUser_nickname(rs.getString("user_nickname"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            freeConnection();
        }
        return user;
    }

    public void updatePw(String user_id, String newUser_pw) {
        String sql = "UPDATE tbluser SET user_pw = ? WHERE user_id = ?";
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, newUser_pw);
            pstmt.setString(2, user_id);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            freeConnection();
        }
    }

    public int resignUser(String id, String pw) {
        String dbpw = ""; // DB상의 비밀번호를 담아둘 변수
        int x = 0;
        // 회원 정보 조회
        String sql1 = "SELECT user_pw FROM tbluser WHERE user_id = ?";
        // 회원 삭제
        String sql2 = "DELETE FROM tbluser WHERE user_id=?";
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql1);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                dbpw = rs.getString("user_pw");
                if (dbpw.equals(pw)) // 입력된 비밀번호와 DB비번 비교
                {
                    // 같을경우 회원삭제 진행
                    pstmt = conn.prepareStatement(sql2.toString());
                    pstmt.setString(1, id);
                    pstmt.executeUpdate();
                    x = 1; // 삭제 성공
                } else {
                    x = 0; // 비밀번호 비교결과 - 다름
                }
            }
            return x;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            freeConnection();
        }
        return x;
    }
}
