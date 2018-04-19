<%@ page import="java.util.HashMap" %>
<%@ page import="com.neu.pojo.Food" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhaoxiaohan
  Date: 2018/4/16
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
cart
<table>
    <tr>
        <th>
            name
        </th>
        <th>
            price
        </th>
        <th>
            quantity
        </th>
        <th>

        </th>
        <th>

        </th>
    </tr>
    <c:forEach items="${sessionScope.foodInCart}" var="f">
        <tr>
            <td>${f.key.name}</td>
            <td>${f.key.price}</td>
            <c:set var="food" value="${f.key.id}"/>
            <form action="${pageContext.request.contextPath}/updateQuantity.htm?" method="get">
                <td> <input type="number" name="quantity" value="${f.value}"/>
                <input type="hidden" name="food" value="${food}"></td>
                <td><input type="submit" value="update quantity"></td>
            </form>
            <td><a href="${pageContext.request.contextPath}/delete.htm?food=${food}">delete</a></td>
        </tr>
    </c:forEach>
</table>
<p>total price:
    <% double total = 0;
        HashMap<Food, Integer> map = (HashMap<Food, Integer>) session.getAttribute("foodInCart");
        Iterator iterator = map.entrySet().iterator();
        while (iterator.hasNext()) {
            Map.Entry entry = (Map.Entry) iterator.next();
            Food key = (Food) entry.getKey();
            int quantity = (int) entry.getValue();
            total += key.getPrice() * quantity;
        }
        out.print(total);
    %></p>
<form method="post" action="checkout.htm">
    <label>Address:</label>
    <input type="text" name="address"/>
    <input type="submit" value="Check Out"/>
</form>
<a href="${pageContext.request.contextPath}/menu.htm">Return to menu</a>
</body>
</html>
