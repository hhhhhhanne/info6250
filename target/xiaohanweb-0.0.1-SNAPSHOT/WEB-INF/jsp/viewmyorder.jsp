<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhaoxiaohan
  Date: 2018/4/17
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Order</title>
</head>
<body>
<c:if test="${sessionScope.user==null}">
<c:redirect url="${pageContext.request.contextPath}/user/login.htm"/>
</c:if>
<h2>${sessionScope.user}'s Order</h2>
<table>
    <tr>
        <th>
            orderId
        </th>
        <th>
            orderTime
        </th>
        <th>
            address
        </th>
    </tr>

    <c:forEach items="${requestScope.ordersList}" var="orders">
        <tr>
            <td>
                    ${orders.id}
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
<a href="${pageContext.request.contextPath}/user-dashboard.htm">Back to User Dashboard</a>
</body>
</html>
