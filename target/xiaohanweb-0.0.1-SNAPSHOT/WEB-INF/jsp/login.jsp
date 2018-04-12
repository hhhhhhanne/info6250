<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--
  Created by IntelliJ IDEA.
  User: zhaoxiaohan
  Date: 2018/4/11
  Time: 23:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<form action="${contextPath}/user/login.htm" method="post">
    <table>
        <tr>
            <td>Email:</td>
            <td><input type="email" name="username" size="30" required="required"/></td>
        </tr>

        <tr>
            <td>Password:</td>
            <td><input type="password" name="password" size="30" required="required"/></td>
        </tr>

        <tr>
            <td colspan="2"><input type="submit" value="Login"/></td>
        </tr>

    </table>
</form>
<a href="${contextPath}/user/forgotpassword.htm">Forgot password?</a>
<a href="${contextPath}/user/create.htm">Register User</a>
</body>
</html>
