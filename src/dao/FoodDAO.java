package dao;

import dto.FoodDTO;

import java.sql.*;
import java.util.ArrayList;

public class FoodDAO {

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private int result;

    private static final FoodDAO instance = new FoodDAO();

    public FoodDAO() {}

    public static FoodDAO getInstance() {
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

    public ArrayList<FoodDTO> getAllFoods() {
        ArrayList<FoodDTO> allFoodList = new ArrayList<>();

        conn = this.getConnection();
        String sql = "select * from foods;";

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while(rs.next()) {
                FoodDTO food = new FoodDTO();
                food.setFoodId(rs.getString("foodId"));
                food.setFname(rs.getString("fname"));
                food.setPrice(rs.getInt("price"));
                food.setDetail(rs.getString("detail"));
                food.setCategory(rs.getString("category"));
                food.setStock(rs.getInt("stock"));
                food.setImage(rs.getString("image"));
                allFoodList.add(food);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(conn, pstmt, null);
        }
        return allFoodList;
    }

    public ArrayList<FoodDTO> findFoodByName(String fname) {
        conn = this.getConnection();
        ArrayList<FoodDTO> findFoodName = new ArrayList<>();
        String sql = "select * from foods where fname like '%" + fname + "%';";

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while(rs.next()) {
                FoodDTO food = new FoodDTO();
                food.setFoodId(rs.getString("foodId"));
                food.setFname(rs.getString("fname"));
                food.setCategory(rs.getString("category"));
                food.setPrice(rs.getInt("price"));
                food.setImage(rs.getString("image"));
                food.setDetail(rs.getString("detail"));

                findFoodName.add(food);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(conn, pstmt, null);
        }
        return findFoodName;
    }

    public FoodDTO findFoodById(String foodId) {
        conn = this.getConnection();
        String sql = "select * from foods where foodId = ?;";

        FoodDTO findFood = null;

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, foodId);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                findFood = new FoodDTO();
                findFood.setFoodId(foodId);
                findFood.setFname(rs.getString("fname"));
                findFood.setPrice(Integer.valueOf(rs.getString("price")));
                findFood.setDetail(rs.getString("detail"));
                findFood.setCategory(rs.getString("category"));
                findFood.setStock(rs.getInt("stock"));
                findFood.setImage(rs.getString("image"));
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            this.close(conn, pstmt, rs);
        }
        return findFood;
    }

    public ArrayList<FoodDTO> findFoodsByCategory(String category) {
        conn = this.getConnection();
        ArrayList<FoodDTO> categoryFoods = new ArrayList<>();
        String sql = "select * from foods where category = ?;";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, category);

            rs = pstmt.executeQuery();
            while(rs.next()) {
                FoodDTO food = new FoodDTO();
                food.setFoodId(rs.getString("foodId"));
                food.setFname(rs.getString("fname"));
                food.setCategory(rs.getString("category"));
                food.setPrice(rs.getInt("price"));
                food.setImage(rs.getString("image"));
                food.setDetail(rs.getString("detail"));

                categoryFoods.add(food);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(conn, pstmt, null);
        }
        return categoryFoods;
    }

    public int registerFood(FoodDTO food) {
        conn = this.getConnection();
        String sql = "insert into foods(foodId, fname, price, detail, category, stock, image) values(?, ?, ?, ?, ?, ?, ?);";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, food.getFoodId());
            pstmt.setString(2, food.getFname());
            pstmt.setInt(3, food.getPrice());
            pstmt.setString(4, food.getDetail());
            pstmt.setString(5, food.getCategory());
            pstmt.setInt(6, food.getStock());
            pstmt.setString(7, food.getImage());

            result = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(conn, pstmt, null);
        }
        return result;
    }

    public int deleteFood(String foodId) {
        conn = this.getConnection();
        String sql = "delete from foods where foodId = ?;";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, foodId);

            int result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(conn, pstmt, null);
        }
        return result;
    }
}
