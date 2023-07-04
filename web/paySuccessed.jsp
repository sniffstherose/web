<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>支付成功</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f1f1f1;
        }
        .container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            text-align: center;
        }
        h1 {
            color: #2ecc71;
        }
        p {
            margin-top: 20px;
        }
        button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #2ecc71;
            color: #fff;
            font-size: 16px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>

<%
    // JDBC 连接信息
    String url = "jdbc:mysql://localhost:3306/orderfood";
    String username = "root";
    String password = "root";

// 创建数据库连接
    Connection connection = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(url, username, password);

        String clearTableQuery = "TRUNCATE TABLE car";
        Statement statement = connection.createStatement();
        statement.executeUpdate(clearTableQuery);
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // 关闭数据库连接
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>

<div class="container">
    <h1>支付成功</h1>
    <p>感谢您的购买！您的付款已成功完成。</p >
    <button onclick="redirectToHomepage()">预计30分钟内送达</button>
</div>

<script>
    function redirectToHomepage() {
        window.location.href = "http://your-website.com";
    }
</script>
</body>
</html>