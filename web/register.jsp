<%@ page import="model.domain.User" %>
<%@ page import="model.DAO.UserDAO" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<%
    // 获取用户提交的注册信息
    String email = request.getParameter("email");
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // 创建UserDAO对象
    UserDAO userDAO = new UserDAO(email, username, password);

    // 检查邮箱是否已被注册
    if (userDAO.isEmailRegistered()) {
        response.sendRedirect("register_failed.jsp"); // 跳转至注册失败页面
    } else {
        // 将用户信息插入数据库
        userDAO.insertUserInfo();
        response.sendRedirect("register_success.jsp"); // 跳转至注册成功页面
    }
%>

