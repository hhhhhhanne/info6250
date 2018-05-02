<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhaoxiaohan
  Date: 2018/4/22
  Time: 02:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>admin-viewFood</title>
</head>
<body>
<h1>
    admin-viewFood
</h1>
<table>
    <tr>
        <th>
            id
        </th>
        <th>
            name
        </th>
        <th>
            title
        </th>
        <th>
            info
        </th>
        <th>
            price
        </th>
        <th>
            imgSrc
        </th>
        <th>
            update
        </th>
        <th>
            delete
        </th>
    </tr>
    <c:forEach items="${requestScope.foodList}" var="food">
        <tr>
            <td>
                ${food.id}
            </td>
            <td>
                ${food.name}
            </td>
            <td>
                ${food.title}
            </td>
            <td>
                ${food.info}
            </td>
            <td>
                ${food.price}
            </td>
            <td>
                ${food.imgSrc}
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/admin/updateFood.htm?foodId=${food.id}">Update Food</a>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/admin/deleteFood.htm?foodId=${food.id}">Delete Food</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
