<%--
  Created by IntelliJ IDEA.
  User: zhaoxiaohan
  Date: 2018/4/22
  Time: 03:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/admin/addFood.htm" method="post">
<input type="hidden" name="typeId" value="${requestScope.typeId}"/>
<table>
    <tr>
        <td>
            food name
        </td>
        <td>
            <input type="text" name="foodName" required="required"/>
        </td>
    </tr>
    <tr>
        <td>
            food title
        </td>
        <td>
            <input type="text" name="foodTitle" required="required"/>
        </td>
    </tr>
    <tr>
        <td>
            food info
        </td>
        <td>
            <input type="text" name="foodInfo" required="required"/>
        </td>
    </tr>
    <tr>
        <td>
            food price
        </td>
        <td>
            <input type="number" step="0.01" name="foodPrice" required="required"/>
        </td>
    </tr>
    <tr>
        <td>
            imgSrc
        </td>
        <td>
            <input type="file" name="foodImg"  required="required"/>
        </td>
    </tr>
</table>
<input type="submit" value="Add Food">
</form>
</body>
</html>
