<%--
  Created by IntelliJ IDEA.
  User: zhaoxiaohan
  Date: 2018/4/18
  Time: 22:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Browse All</title>
</head>
<body>
<h1>Browse All food</h1>
<input type="text" id="queryString" size="30" onkeyup="ajaxEvent()" />

<div id="fooddiv">

</div>
</body>
<script>
    function ajaxEvent() {

        var xmlHttp;
        try // Firefox, Opera 8.0+, Safari
        {
            xmlHttp = new XMLHttpRequest();
        } catch (e) {
            try // Internet Explorer
            {
                xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
            } catch (e) {
                try {
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                } catch (e) {
                    alert("Your browser does not support AJAX!");
                    return false;
                }
            }
        }

        xmlHttp.onreadystatechange = function() {
            if (xmlHttp.readyState == 4) {
                document.getElementById("fooddiv").innerHTML = xmlHttp.responseText;
            }
        }

        var queryString = document.getElementById("queryString").value;

        xmlHttp.open("POST", "${pageContext.request.contextPath}/ajaxservice.htm?food="+queryString, true);
        xmlHttp.send();
    }
</script>
</html>
