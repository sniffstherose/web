<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="model.DAO.UserDAO" %>

<%
    // 获取用户提交的邮箱和密码
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    // 创建UserDAO对象
    UserDAO userDAO = new UserDAO(email, null, password);

    // 调用isEmailRegistered方法检查邮箱是否存在
    boolean isRegistered = userDAO.isEmailRegistered();

    if (isRegistered) {
        // 如果邮箱存在，再检查密码是否匹配
        boolean isPasswordMatched = userDAO.checkPassword();

        if (isPasswordMatched) {
            // 登录成功，将用户信息保存在session中
            session.setAttribute("email", email);
            response.sendRedirect("menu_main.html");
        } else {
            // 密码错误
            out.println("密码错误");
        }
    } else {
        // 邮箱不存在
        out.println("尚未注册");
    }
%>