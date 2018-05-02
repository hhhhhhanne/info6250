<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhaoxiaohan
  Date: 2018/4/21
  Time: 23:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Manage Types</title>
</head>
<body>
<table>
    <tr>
        <th>
            Type Id
        </th>
        <th>
            Type Name
        </th>
    </tr>
    <c:forEach items="${requestScope.typesList}" var="types">
        <tr>
            <td>
                ${types.id}
            </td>
            <td>
                ${types.name}
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/admin/viewFood.htm?typeId=${types.id}">View Food</a>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/admin/addFood.htm?typeId=${types.id}">Add Food</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
