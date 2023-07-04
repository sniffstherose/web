<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.DAO.FoodDAO" %>
<%@ page import="model.domain.food" %>
<html>
<head>
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
    <title>menu_right</title>
</head>
<body>
<h3>本店菜品</h3>
<hr>
<form action="spCar.jsp" method="post">
    <table>
        <tr>
            <th>序号</th>
            <th>菜品名</th>
            <th>特点</th>
            <th>材料</th>
            <th>价格（单位：元）</th>
            <th>种类</th>
            <th>选择</th>
        </tr>

        <%
            FoodDAO dao = new FoodDAO();
            try {
                List<food> foods = dao.findAll();
                for (food fd : foods) {
                    int id = fd.getId();
                    String foodName = fd.getfName();
                    String feature = fd.getFeature();
                    String material = fd.getMaterial();
                    double price = fd.getfPrice();
                    String type = fd.getfType();

                    out.println("<tr>");
                    out.println("<td>" + id + "</td>");
                    out.println("<td>" + foodName + "</td>");
                    out.println("<td>" + feature + "</td>");
                    out.println("<td>" + material + "</td>");
                    out.println("<td>" + price + "</td>");
                    out.println("<td>" + type + "</td>");
                    out.println("<td><input type='checkbox' name='selectedFoods' value='" + id + "'/></td>");
                    out.println("</tr>");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>

    <br>
    <input type="submit" value="添加至购物车">
    <input type="reset" value="重选">
</form>
</body>
</html>
