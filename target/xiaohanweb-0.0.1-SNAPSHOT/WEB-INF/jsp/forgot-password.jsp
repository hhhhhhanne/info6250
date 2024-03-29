<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.captcha.botdetect.web.servlet.Captcha"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert title here</title>
</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<font color="red">${captchamsg}</font>
<form action="${contextPath}/user/forgotpassword.htm" method="POST">
    <table>
        <tr>
            <td>Enter your username:</td>
            <td><input type="text" name="username" size="30"
                       required="required" /></td>
        </tr>

        <tr>
            <td colspan="2">
                <label for="captchaCode" class="prompt">Retype the characters from the picture:</label>
                <%
                    // Adding BotDetect Captcha to the page
                    Captcha captcha = Captcha.load(request, "CaptchaObject");
                    captcha.setUserInputID("captchaCode");

                    String captchaHtml = captcha.getHtml();
                    out.write(captchaHtml);
                %>
                <input id="captchaCode" type="text" name="captchaCode" required="required"/>
            </td>
        </tr>

        <tr>
            <td colspan="2"><input type="submit" value="Submit" /></td>
        </tr>
    </table>


</form>

</body>
</html>