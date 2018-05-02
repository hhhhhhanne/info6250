<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login</title>
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
                        <form action="${pageContext.request.contextPath}/cart.htm" method="get" class="last">
                            <%--<input type="hidden" name="cmd" value="_cart" />--%>
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
<c:if test="${cookie['name'].value != null}">
<c:redirect url="${pageContext.request.contextPath}/menu.htm"/>
</c:if>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<br/>
<br/>
<br/>
<br/>
<div class="container">
    <div class="col-md-12">
        <form class="form-horizontal" action="${contextPath}/user/login.htm" method="post">
            <div class="form-group">
                <label for="username" class="col-sm-2 control-label">Username</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="username" name="username" placeholder="username" required="required">
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-2 control-label">Password</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="password" name="password" placeholder="password" required="required">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <div>
                        <input type="checkbox" name="remember">
                        <label>
                             Remember me
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">Sign in</button>
                </div>
            </div>
        </form>
        <div class="col-sm-2"></div>
        <div class="col-sm-10">
            <a href="${contextPath}/user/forgotpassword.htm" role="button" class="btn btn-info">Forgot password?</a>
            <a href="${contextPath}/user/create.htm" role="button" class="btn btn-info">Register User</a>
        </div>
    </div>
</div>

<br/>
<br/>
<br/>
<br/>
<!-- footer -->
<div class="footer agileits-w3layouts">
    <div class="container">
        <div class="w3_footer_grids">
            <div class="col-xs-6 col-sm-3 footer-grids w3-agileits">
                <h3>Foodie</h3>
                <ul>
                    <li><a href="about.html">About</a></li>
                    <li><a href="contact.html">Contact Us</a></li>
                    <li><a href="careers.html">Careers</a></li>
                    <li><a href="help.html">Partner</a></li>
                </ul>
            </div>
            <div class="col-xs-6 col-sm-3 footer-grids w3-agileits">
                <h3>Help</h3>
                <ul>
                    <li><a href="#">FAQ</a></li>
                    <li><a href="#">Reply</a></li>
                    <li><a href="#">Order Status</a></li>
                    <li><a href="#">Offers</a></li>
                </ul>
            </div>
            <div class="col-xs-6 col-sm-3 footer-grids w3-agileits">
                <h3>Policy</h3>
                <ul>
                    <li><a href="#">Terms</a></li>
                    <li><a href="#">privacy policy</a></li>
                    <li><a href="#">refund policy</a></li>
                </ul>
            </div>
            <div class="col-xs-6 col-sm-3 footer-grids w3-agileits">
                <h3>Menu</h3>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/menu.htm">Full-day menu</a></li>
                    <li><a href="${pageContext.request.contextPath}/menu.htm">lunch</a></li>
                    <li><a href="${pageContext.request.contextPath}/menu.htm">dinner</a></li>
                    <li><a href="${pageContext.request.contextPath}/menu.htm">special</a></li>
                </ul>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<div class="copyw3-agile">
    <div class="container">
        <p>copyright &copy; 2017.Foodie all reserved.<a target="_blank" href="${pageContext.request.contextPath}/"></a></p>
    </div>
</div>
</body>
</html>
