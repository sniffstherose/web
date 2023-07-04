<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>购物车</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>
<body>
    <h1>购物车</h1>
    <table>
        <tr>
            <th>菜品名</th>
            <th>价格（元）</th>
            <th>操作</th>
        </tr>
        <%
            String dbURL = "jdbc:mysql://localhost:3306/orderfood";
            String dbUser = "root";
            String dbPassword = "root";

            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                String query = "SELECT * FROM car";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(query);

                while (rs.next()) {
                    int id=rs.getInt("cId");
                    String foodName = rs.getString("fName");
                    double price = rs.getDouble("fPrice");

                    out.println("<tr>");
                    out.println("<td>" + foodName + "</td>");
                    out.println("<td>" + price + "</td>");
                    out.println("<td><a href='removeItem.jsp?id=" + id + "'>移除</a></td>");
                    out.println("</tr>");
                }
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
    </table>
    <br>
    <a href="pay.jsp">去结账</a>
</body>
</html>