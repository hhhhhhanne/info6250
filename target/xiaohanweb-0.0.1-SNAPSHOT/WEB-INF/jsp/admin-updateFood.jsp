<%--
  Created by IntelliJ IDEA.
  User: zhaoxiaohan
  Date: 2018/4/22
  Time: 02:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/admin/updateFood.htm" method="post">
    <input type="hidden" name="foodId" value="${requestScope.food.id}"/>
    <table>
        <tr>
            <td>
                food name
            </td>
            <td>
                <input type="text" name="foodName" value="${requestScope.food.name}" required="required"/>
            </td>
        </tr>
        <tr>
            <td>
                food title
            </td>
            <td>
                <input type="text" name="foodTitle" value="${requestScope.food.title}" required="required"/>
            </td>
        </tr>
        <tr>
            <td>
                food info
            </td>
            <td>
                <input type="text" name="foodInfo" value="${requestScope.food.info}" required="required"/>
            </td>
        </tr>
        <tr>
            <td>
                food price
            </td>
            <td>
                <input type="number" step="0.01" name="foodPrice" value="${requestScope.food.price}" required="required"/>
            </td>
        </tr>
        <tr>
            <td>
                imgSrc
            </td>
            <td>
                <input type="file" name="foodImg" value="${requestScope.food.imgSrc}" required="required">
            </td>
        </tr>
    </table>
    <input type="submit" value="Update">
</form>
</body>
</html>
