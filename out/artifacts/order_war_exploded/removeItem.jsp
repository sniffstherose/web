<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
    String dbURL = "jdbc:mysql://localhost:3306/orderfood";
    String dbUser = "root";
    String dbPassword = "root";

    String id = request.getParameter("id"); // 获取要删除的菜品名

    try {
        // 创建数据库连接
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // 构建删除菜品的SQL语句
        String sql = "DELETE FROM car WHERE cId = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, id);

        // 执行删除操作
        int rowsAffected = stmt.executeUpdate();

        // 关闭数据库连接
        stmt.close();
        conn.close();

        response.sendRedirect("scar.jsp");
    } catch (Exception e) {
        e.printStackTrace();
    }
%>