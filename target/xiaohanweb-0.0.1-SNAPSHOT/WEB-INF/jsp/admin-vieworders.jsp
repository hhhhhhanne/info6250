<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhaoxiaohan
  Date: 2018/4/26
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View All Orders</title>
</head>
<body>
<table>
    <tr>
        <th>
            orderId
        </th>
        <th>
            user name
        </th>
        <th>
            orderTime
        </th>
        <th>
            address
        </th>
    </tr>
    <c:forEach items="${requestScope.orderList}" var="orders">
        <tr>
            <td>
                    ${orders.id}
            </td>
            <td>
                ${orders.users.username}
            </td>
            <td>
                    ${orders.orderTime}
            </td>
            <td>
                    ${orders.address}
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/viewDetail.htm?orderid=${orders.id}">View Detail</a>
            </td>
        </tr>

    </c:forEach>
</table>
</body>
</html>
