<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhaoxiaohan
  Date: 2018/4/17
  Time: 00:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Check out</title>
</head>
<body>
    <table>
        <tr>
            <th>
                food id
            </th>
            <th>
                price
            </th>
            <th>
                quantity
            </th>
        </tr>
        <c:forEach items="${requestScope.order}" var="f">
            <tr>
                <td>${f.key.id}</td>
                <td>${f.key.price}</td>
                <td>${f.value}</td>
            </tr>
        </c:forEach>
    </table>
    <p>total price: ${requestScope.totalprice}</p>
    <a href="${pageContext.request.contextPath}/viewMyOrder.htm">View My Order</a>
</body>
</html>
