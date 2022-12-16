package dao;

import dto.ReviewDTO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

public class ReviewDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private int result;

    private static final ReviewDAO instance = new ReviewDAO();

    private ReviewDAO() {}

    public static ReviewDAO getInstance() {
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

    public int selectCount(Map<String, Object> map) {
        int totalCount = 0;

        conn = this.getConnection();
        String sql = "select count(*) from reviews";
        if(map.get("searchWord") != null) {
            sql += " where " + map.get("searchField") + " " + " like '%" + map.get("searchWord") + "%';";
        }

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            rs.next();
            totalCount = rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(conn, pstmt, null);
        }
        return totalCount;
    }

    public ArrayList<ReviewDTO> selectReviewsByFoodName(String foodName) {
        conn = this.getConnection();
        ArrayList<ReviewDTO> list = new ArrayList<>();

        String sql = "select * from reviews where reviewFoodName = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, foodName);
            rs = pstmt.executeQuery();

            while(rs.next()) {
                ReviewDTO review = new ReviewDTO();
                review.setReviewNo(rs.getString("reviewNo"));
                review.setReviewTitle(rs.getString("reviewTitle"));
                review.setReviewContent(rs.getString("reviewContent"));
                review.setReviewWriterId(rs.getString("reviewWriterId"));
                review.setPostDate(rs.getDate("postDate"));
                review.setVisitCount(rs.getString("visitCount"));
                review.setReviewFoodName(rs.getString("reviewFoodName"));
                review.setReviewImage(rs.getString("reviewImage"));

                list.add(review);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(conn, pstmt, null);
        }
        return list;
    }

    public List<ReviewDTO> getReviewList(Map<String, Object> map, int startRow, int pageSize) {
        conn = this.getConnection();
        List<ReviewDTO> bbs = new Vector<ReviewDTO>();

        String sql = "select * from reviews";
        if(map.get("searchWord") != null) {
            sql += " where " + map.get("searchField") + " " + " like '%" + map.get("searchWord") + "%' ";
        }

        sql += " limit ?,?;";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, startRow-1);
            pstmt.setInt(2, pageSize);

            rs = pstmt.executeQuery();

            while(rs.next()) {
                ReviewDTO dto = new ReviewDTO();

                dto.setReviewNo(rs.getString("reviewNo"));
                dto.setReviewTitle(rs.getString("reviewTitle"));
                dto.setReviewContent(rs.getString("reviewContent"));
                dto.setReviewWriterId(rs.getString("reviewWriterId"));
                dto.setVisitCount(rs.getString("visitCount"));
                dto.setPostDate(rs.getDate("postDate"));
                dto.setReviewFoodName(rs.getString("reviewFoodName"));
                dto.setReviewImage(rs.getString("reviewImage"));

                bbs.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(conn, pstmt, null);
        }
        return bbs;
    }

    public List<ReviewDTO> selectReviews(Map<String, Object> map) {
        conn = this.getConnection();
        List<ReviewDTO> bbs = new Vector<ReviewDTO>();

        String sql = "select * from reviews";
        if(map.get("searchWord") != null) {
            sql += " where " + map.get("searchField") + " " + " like '%" + map.get("searchWord") + "%' ";
        }

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while(rs.next()) {
                ReviewDTO dto = new ReviewDTO();

                dto.setReviewNo(rs.getString("reviewNo"));
                dto.setReviewTitle(rs.getString("reviewTitle"));
                dto.setReviewContent(rs.getString("reviewContent"));
                dto.setReviewWriterId(rs.getString("reviewWriterId"));
                dto.setVisitCount(rs.getString("visitCount"));
                dto.setPostDate(rs.getDate("postDate"));
                dto.setReviewFoodName(rs.getString("reviewFoodName"));

                //추가 시작
                dto.setReviewImage(rs.getString("reviewImage"));
                //추가 끝

                bbs.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(conn, pstmt, null);
        }
        return bbs;
    }

    public int registerReview(ReviewDTO review) {
        conn = this.getConnection();
        try {
            String sql = "insert into reviews" +
            "(reviewNo, reviewTitle, reviewContent, reviewWriterId, visitCount, reviewFoodName, reviewImage)" + "" +
                    " values(null, ?, ?, ?, 0, ?, ?)";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, review.getReviewTitle());
            pstmt.setString(2, review.getReviewContent());
            pstmt.setString(3, review.getReviewWriterId());
            pstmt.setString(4, review.getReviewFoodName());
            pstmt.setString(5, review.getReviewImage());
            result = pstmt.executeUpdate();
            pstmt.close();

            pstmt = conn.prepareStatement("set @count=0;");
            pstmt.executeUpdate();

            pstmt = conn.prepareStatement("update reviews set reviewNo=@count:=@count+1;");
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(conn, pstmt, null);
        }
        return result;
    }

    public ReviewDTO selectReview(String reviewNo) {
        conn = this.getConnection();
        ReviewDTO dto = new ReviewDTO();

        String sql = "select * from reviews where reviewNo=?;";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, reviewNo);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                dto.setReviewNo(rs.getString("reviewNo"));
                dto.setReviewTitle(rs.getString("reviewTitle"));
                dto.setReviewContent(rs.getString("reviewContent"));
                dto.setPostDate(rs.getDate("postDate"));
                dto.setVisitCount(rs.getString("visitCount"));
                dto.setReviewWriterId(rs.getString("reviewWriterId"));
                dto.setReviewFoodName(rs.getString("reviewFoodName"));
                dto.setReviewImage(rs.getString("reviewImage"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(conn, pstmt, null);
        }

        return dto;
    }

    public void updateVisitCount(String reviewNo) {
        conn = this.getConnection();
        String sql = "update reviews set visitCount=visitCount+1 where reviewNo=?;";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, reviewNo);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(conn, pstmt, null);
        }
    }

    public int updateEdit(ReviewDTO review) {
        conn = this.getConnection();
        result = 0;

        try {
            String sql = "update reviews set reviewTitle=?, reviewContent=?, reviewFoodName=? where reviewNo=?;";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, review.getReviewTitle());
            pstmt.setString(2, review.getReviewContent());
            pstmt.setString(3, review.getReviewFoodName());
            pstmt.setString(4, review.getReviewNo());

            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(conn, pstmt, null);
        }
        return result;
    }

    public int deleteReview(ReviewDTO review) {
        conn = this.getConnection();
        result = 0;

        try {
            String sql = "delete from reviews where reviewNo=?;";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, review.getReviewNo());
            result = pstmt.executeUpdate();
            pstmt.close();

            pstmt = conn.prepareStatement("set @count=0;");
            pstmt.executeUpdate();

            pstmt = conn.prepareStatement("update reviews set reviewNo=@count:=@count+1;");
            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(conn, pstmt, null);
        }
        return result;
    }
}
