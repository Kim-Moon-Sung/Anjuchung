package dao;

import dto.MemberDTO;

import java.sql.*;

public class MemberDAO {

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private int result;

    private static final MemberDAO instance = new MemberDAO();

    private MemberDAO() {}

    public static MemberDAO getInstance(){
        return instance;
    }

    public Connection getConnection() {
        String url = "jdbc:mysql://localhost:3306/MVC_Web_Project";
        String uid = "root";
        String upw = "moonsung0331";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, uid, upw);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    public void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
        if(rs != null) {
            try {
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        if(pstmt != null) {
            try {
                pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        if(conn != null) {
            try {
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public int join(MemberDTO member) {
        conn = this.getConnection();
        String sql = "insert into members(memberId, password, name, phone, email, address) values(?, ?, ?, ?, ?, ?);";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member.getMemberId());
            pstmt.setString(2, member.getPassword());
            pstmt.setString(3, member.getName());
            pstmt.setString(4, member.getPhone());
            pstmt.setString(5, member.getEmail());
            pstmt.setString(6, member.getAddress());

            result = pstmt.executeUpdate();
        } catch (Exception e) {
            this.close(conn, pstmt, null);
        }
        return result;
    }

    public int login(String memberId, String password) {
        conn = this.getConnection();
        String sql = "select * from members where memberId = ? and password = ?;";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberId);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                if(rs.getString("password").equals(password))
                    return 1;
                else
                    return 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(conn, pstmt, rs);
        }
        return -1;
    }

    public MemberDTO findMember(String memberId) {
        conn = this.getConnection();
        String sql = "select * from members where memberId = ?;";

        MemberDTO findMember = null;

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String findPwd = rs.getString("password");
                String findName = rs.getString("name");
                String findPhone = rs.getString("phone");
                String findEmail = rs.getString("email");
                String findAddress = rs.getString("address");
                findMember = new MemberDTO(memberId, findPwd, findName, findPhone, findEmail, findAddress);

                if(rs.getInt("isAdmin") == 1) {
                    findMember.setIsAdmin(true);
                } else {
                    findMember.setIsAdmin(false);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(conn, pstmt, rs);
        }
        return findMember;
    }
}
