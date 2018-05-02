<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhaoxiaohan
  Date: 2018/4/18
  Time: 18:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Detail</title>
</head>
<body>
<table border="1">
    <tr>
        <th>
            orderid
        </th>
        <th>
            food name
        </th>
        <th>
            quantity
        </th>
        <th>
            sub total
        </th>
    </tr>
    <c:forEach items="${requestScope.orderDetails}" var="detail">
        <tr>
            <td>
                ${detail.getOrder().getId()}
            </td>
            <td>
                ${detail.getFood().getName()}
            </td>
            <td>
                ${detail.nums}
            </td>
            <td>
                ${detail.price}
            </td>
        </tr>
    </c:forEach>
</table>
<c:if test="${sessionScope.role==1}">
    <a href="${pageContext.request.contextPath}/viewMyOrder.htm">Back to My Order</a>
</c:if>
<c:if test="${sessionScope.role!=1}">
    <a href="${pageContext.request.contextPath}/admin/viewAllOrders.htm">Back to Orders</a>
</c:if>
</body>
</html>
