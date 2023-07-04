<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.domain.food" %>
<html>
<head>
    <title>搜索结果</title>
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
<h3>搜索结果</h3>
<form action="spCar.jsp" method="post">
    <table border="1">
        <tr>
            <th>菜名</th>
            <th>特点</th>
            <th>原料</th>
            <th>价格</th>
            <th>类型</th>
            <th>选择</th>
        </tr>
        <%
            List<food> results = (List<food>) request.getAttribute("results");
            for (food fd : results) {
        %>
        <tr>
            <td><%= fd.getfName() %></td>
            <td><%= fd.getFeature() %></td>
            <td><%= fd.getMaterial() %></td>
            <td><%= fd.getfPrice() %></td>
            <td><%= fd.getfType() %></td>
            <td><input type="checkbox" name="selectedFoods" value="<%= fd.getId() %>"></td>
        </tr>
        <% } %>
    </table>
    <input type="submit" value="添加到购物车">
    <input type="reset" value="重选">
    <a href="menu_right.jsp">返回主页</a>
</form>
</body>
</html>
