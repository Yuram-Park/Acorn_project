package place;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class PlaceDao {
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
    public PlaceDao() {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc_mariadb");
        } catch (Exception e) {
            System.out.println("PlaceDAO() : " + e);
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

    // place_cafe_list.jsp
    public List getPlaceList(String place_category) {
        String sql = "select * from tblplace where place_category=?";
        Vector vector = new Vector();
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, place_category);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                PlaceDto placeDto = new PlaceDto();
                placeDto.setPlace_name(rs.getString("place_name"));
                placeDto.setPlace_category(rs.getString("place_category"));
                placeDto.setPlace_address(rs.getString("place_address"));
                placeDto.setPlace_call(rs.getString("place_call"));
                placeDto.setPlace_id(rs.getInt("place_id"));
                placeDto.setPlace_score(rs.getFloat("place_score"));
                vector.add(placeDto);
            }
        } catch (Exception e) {
            System.out.println("getPlaceList() : " + e);
        } finally {
            freeConnection();
        }
        return vector;
    }

    // place_cafe_detail.jsp
    public PlaceDto readPlace(int place_id) {
        String sql = "select * from tblplace where place_id=" + place_id;
        PlaceDto placeDto = new PlaceDto();
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery(sql);
            if (rs.next()) {
                placeDto.setPlace_name(rs.getString("place_name"));
                placeDto.setPlace_category(rs.getString("place_category"));
                placeDto.setPlace_address(rs.getString("place_address"));
                placeDto.setPlace_call(rs.getString("place_call"));
                placeDto.setPlace_homepage(rs.getString("place_homepage"));
                placeDto.setPlace_id(rs.getInt("place_id"));
                placeDto.setPlace_score(rs.getFloat("place_score"));
            }
        } catch (Exception e) {
            System.out.println("readPlace() : " + e);
        } finally {
            freeConnection();
        }
        return placeDto;
    }

}
