<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>结账</title>
    <style>
        .container {
            max-width: 600px;
            margin: 0 auto;
            text-align: center;
        }

        h1 {
            margin-bottom: 30px;
        }

        .payment-methods {
            display: flex;
            justify-content: space-around;
            align-items: center;
            margin-bottom: 30px;
        }

        .payment-method {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .payment-method img {
            width: 200px;
            height: 200px;
            margin-bottom: 10px;
        }

        .payment-method span {
            font-size: 20px;
            font-weight: bold;
        }

        a {
            display: inline-block;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<h1>结账</h1>

<%-- 获取 ordered 表的内容 --%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%!
    public class OrderedItem {
        private String foodName;
        private int price;

        public OrderedItem(String foodName, int price) {
            this.foodName = foodName;
            this.price = price;
        }

        public String getFoodName() {
            return foodName;
        }

        public int getPrice() {
            return price;
        }
    }
%>

<%-- 获取购物车中的菜品信息 --%>
<%
    String dbURL = "jdbc:mysql://localhost:3306/orderfood";
    String dbUser = "root";
    String dbPassword = "root";

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    List<OrderedItem> orderedItems = new ArrayList<>();

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        String query = "SELECT * FROM car";
        stmt = conn.createStatement();
        rs = stmt.executeQuery(query);

        while (rs.next()) {
            String foodName = rs.getString("fName");
            int price = rs.getInt("fPrice");

            OrderedItem orderedItem = new OrderedItem(foodName, price);
            orderedItems.add(orderedItem);
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
            }
        }
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
            }
        }
    }

    int totalAmount = 0;
    for (OrderedItem orderedItem : orderedItems) {
        totalAmount += orderedItem.getPrice();
    }
%>

<p>您需支付 <%= totalAmount %> 元</p>

<br>
<div class="container">
    <h1>请选择付款方式</h1>
    <div class="payment-methods">
        <div class="payment-method">
        <a href="paySuccessed.jsp">
            <img src="https://raw.githubusercontent.com/Tryanel/images/main/202307032234161.jpg" alt="微信支付" height="200" width="200">
        </a>
            <span>微信支付</span>
        </div>
        <div class="payment-method">
            <a href="paySuccessed.jsp">
            <img src="https://raw.githubusercontent.com/Tryanel/images/main/202307032234587.jpg" alt="支付宝支付" height="200" width="200">
            </a>
            <span>支付宝支付</span>
        </div>
        <div class="payment-method">
            <a href="paySuccessed.jsp">
            <img src="https://raw.githubusercontent.com/Tryanel/images/main/202307032234922.jpg" alt="银行卡支付" height="200" width="200">
            </a>
            <span>银行卡支付</span>
        </div>
    </div>
</div>
<a href="scar.jsp" target="right">返回</a>
</body>
</html>

