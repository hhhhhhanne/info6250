<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhaoxiaohan
  Date: 2018/4/22
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>admin-manageUsers</title>
</head>
<body>
<table>
    <tr>
        <th>
            user name
        </th>
        <th>
            user password
        </th>
        <th>
            user email
        </th>
        <th>
            delete
        </th>
    </tr>
    <c:forEach items="${requestScope.userList}" var="user">
        <tr>
        <td>
            ${user.username}
        </td>
            <td>
                ${user.password}
            </td>
            <td>
                ${user.email}
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/admin/invalidateUser.htm?userId=${user.id}">Invalidate User</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
