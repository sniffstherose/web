<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.sql.*" %>

<%
    String dbURL = "jdbc:mysql://localhost:3306/orderfood";
    String dbUser = "root";
    String dbPassword = "root";

    // 获取选中的菜品ID
    String[] selectedFoods = request.getParameterValues("selectedFoods");

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // 准备插入数据的SQL语句
        String insertQuery = "INSERT INTO car (fName, fPrice) VALUES (?, ?)";

        // 循环处理选中的菜品ID
        for (String foodId : selectedFoods) {
            // 根据菜品ID查询菜品的名称和价格
            String selectQuery = "SELECT fName, fPrice FROM food WHERE id = ?";
            stmt = conn.prepareStatement(selectQuery);
            stmt.setString(1, foodId);
            rs = stmt.executeQuery();

            if (rs.next()) {
                // 获取菜品的名称和价格
                String foodName = rs.getString("fName");
                double foodPrice = rs.getDouble("fPrice");

                // 插入数据到ordered表
                stmt = conn.prepareStatement(insertQuery);
                stmt.setString(1, foodName);
                stmt.setDouble(2, foodPrice);
                stmt.executeUpdate();
            }
        }

        // 输出成功消息
        out.println("菜品已成功添加至购物车。");

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {}
        }
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {}
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {}
        }
    }
%>


