<%@ page import="java.util.HashMap" %>
<%@ page import="com.neu.pojo.Food" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhaoxiaohan
  Date: 2018/4/16
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Shopping Cart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- Custom Theme files -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
    <link href="${pageContext.request.contextPath}/css/style.css" type="text/css" rel="stylesheet" media="all">
    <link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet"> <!-- font-awesome icons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.css" type="text/css" media="all"/> <!-- Owl-Carousel-CSS -->
    <!-- //Custom Theme files -->
    <!-- js -->
    <script src="${pageContext.request.contextPath}/script/jquery-2.2.3.min.js"></script>
    <!-- //js -->
    <!-- web-fonts -->
    <link href="http://fonts.googleapis.com/css?family=Berkshire+Swash" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Yantramanav:100,300,400,500,700,900" rel="stylesheet">
</head>
<body>
<c:if test="${sessionScope.user==null}">
    <c:redirect url="/user/login.htm"/>
</c:if>
<c:if test="${sessionScope.foodInCart==null}">
    <c:redirect url="/user/login.htm"/>
</c:if>
<!-- banner -->
<div class="banner">
    <!-- header -->
    <div class="header">
        <div class="w3ls-header"><!-- header-one -->
            <div class="container">
                <div class="w3ls-header-left">
                    <p>Eat, Love, Live</p>
                </div>
                <div class="w3ls-header-right">
                    <ul>
                        <li class="head-dpdn">
                            <i class="fa fa-phone" aria-hidden="true"></i> Call us: 617-331-1025
                        </li>
                        <c:choose>
                            <c:when test="${sessionScope.user==null}">
                                <li class="head-dpdn">
                                    <a href="${pageContext.request.contextPath}/user/login.htm"><i class="fa fa-sign-in" aria-hidden="true"></i> Login</a>
                                </li>
                                <li class="head-dpdn">
                                    <a href="${pageContext.request.contextPath}/user/create.htm"><i class="fa fa-user-plus" aria-hidden="true"></i> Register</a>
                                </li>
                            </c:when>
                            <c:otherwise><li class="head-dpdn">
                                <a href="${pageContext.request.contextPath}/user-dashboard.htm"><i class="fa fa-user-plus" aria-hidden="true"></i> Welcome!${sessionScope.user}</a>
                            </li></c:otherwise>
                        </c:choose>
                        <li class="head-dpdn">
                            <a href="#"><i class="fa fa-gift" aria-hidden="true"></i> Service</a>
                        </li>
                        <li class="head-dpdn">
                            <a href="#"><i class="fa fa-question-circle" aria-hidden="true"></i> Help</a>
                        </li>
                    </ul>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <!-- //header-one -->
        <!-- navigation -->
        <div class="navigation agiletop-nav">
            <div class="container">
                <nav class="navbar navbar-default">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header w3l_logo">

                        <h1><a href="${pageContext.request.contextPath}/">Foodie<span>Best Food Collection</span></a></h1>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="${pageContext.request.contextPath}/" class="active">Index</a></li>
                            <!-- Mega Menu -->
                            <li class="dropdown">
                                <a href="${pageContext.request.contextPath}/menu.htm" >Menu </a>

                            </li>
                            <li><a href="#">About</a></li>
                            <li><a href="${pageContext.request.contextPath}/viewMyOrder.htm" >My Order</a>

                            </li>
                            <li><a href="#">Contact us</a></li>
                        </ul>
                    </div>
                    <div class="cart cart box_1">
                        <form action="#" method="post" class="last">
                            <input type="hidden" name="cmd" value="_cart" />
                            <input type="hidden" name="display" value="1" />
                            <button class="w3view-cart" type="submit" name="submit" value=""><i class="fa fa-cart-arrow-down" aria-hidden="true"></i></button>
                        </form>
                    </div>
                </nav>
            </div>
        </div>
        <!-- //navigation -->
    </div>
    <!-- //header-end -->
    <!-- banner-text -->
    <div class="banner-text">
        <div class="container">
            <h2>Live for love and love for food.<br> <span>best chefs for you.</span></h2>
        </div>
    </div>
</div>
<!-- //banner -->
<br/>
<br/>
<br/>
<div class="container">
    <h1>My Shopping Cart</h1>
    <table class="table table-striped">
        <tr>
            <th>
                name
            </th>
            <th>
                price
            </th>
            <th>
                quantity
            </th>
            <th>

            </th>
            <th>

            </th>
        </tr>
        <c:forEach items="${sessionScope.foodInCart}" var="f">
            <tr>
                <td>${f.key.name}</td>
                <td>${f.key.price}</td>
                <c:set var="food" value="${f.key.id}"/>
                <form action="${pageContext.request.contextPath}/updateQuantity.htm?" method="get">
                    <td> <input class="form-control" type="number" name="quantity" value="${f.value}"/>
                        <input type="hidden" name="food" value="${food}"></td>
                    <td><input class="btn btn-primary" type="submit"  value="update quantity"></td>
                </form>
                <td><a href="${pageContext.request.contextPath}/delete.htm?food=${food}">delete</a></td>
            </tr>
        </c:forEach>
    </table>
    <p>total price:
        <% double total = 0;
            HashMap<Food, Integer> map = (HashMap<Food, Integer>) session.getAttribute("foodInCart");
            Iterator iterator = map.entrySet().iterator();
            while (iterator.hasNext()) {
                Map.Entry entry = (Map.Entry) iterator.next();
                Food key = (Food) entry.getKey();
                int quantity = (int) entry.getValue();
                total += key.getPrice() * quantity;
            }
            out.print(total);
        %></p>
    <form method="post" action="checkout.htm">
        <label class="control-label">Address:</label>
        <input class="form-control" type="text" name="address"/>
        <input class="btn btn-default" type="submit" value="Check Out"/>
    </form>
    <a href="${pageContext.request.contextPath}/menu.htm">Return to menu</a>
</div>
<br/>
<br/>
<br/>
<div class="copyw3-agile">
    <div class="container">
        <p>copyright &copy; 2017.Foodie all reserved.<a target="_blank" href="${pageContext.request.contextPath}/"></a></p>
    </div>
</div>
</body>
</html>
