<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Home Page</title>
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
                            <a href="offers.html"><i class="fa fa-gift" aria-hidden="true"></i> Service</a>
                        </li>
                        <li class="head-dpdn">
                            <a href="help.html"><i class="fa fa-question-circle" aria-hidden="true"></i> Help</a>
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
                            <li><a href="about.html">About</a></li>
                            <li class="w3pages"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">My Order</a>

                            </li>
                            <li><a href="contact.html">Contact us</a></li>
                        </ul>
                    </div>
                    <div class="cart cart box_1">
                        <form action="${pageContext.request.contextPath}/cart.htm" method="post" class="last">
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
            <div class="agileits_search">
                <form action="selectByNameOrType_Food" method="post">
                    <input name="name" type="text" placeholder="search for food" >
                    <select id="agileinfo_search" name="typesId" required>
                        <option value="0">All</option>
                        <c:forEach var="t" items="${tlist }">
                            <option value="${t.id }">${t.name }</option>
                        </c:forEach>
                    </select>
                    <input type="submit" value="Search">
                </form>
            </div>
        </div>
    </div>
</div>
<!-- //banner -->
<!-- add-products -->
<div class="add-products">
    <div class="container">
        <div class="add-products-row">
            <div class="w3ls-add-grids">
                <a href="${pageContext.request.contextPath}/menu.htm">
                    <h4>Get <span>20%<br>DISCOUNT</span></h4>
                    <h5>Mobile Phone Exclusive</h5>
                    <h6>Order Now! <i class="fa fa-arrow-circle-right" aria-hidden="true"></i></h6>
                </a>
            </div>
            <div class="w3ls-add-grids w3ls-add-grids-right">
                <a href="${pageContext.request.contextPath}/menu.htm">
                    <h4>Get <span><br>40% up to</span></h4>
                    <h5>Special for Sunday</h5>
                    <h6>Order Now! <i class="fa fa-arrow-circle-right" aria-hidden="true"></i></h6>
                </a>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!-- //add-products -->
<!-- order -->
<div class="wthree-order">

    <div class="container">
        <h3 class="w3ls-title">How to order?</h3>
        <p class="w3lsorder-text">4 steps to get your food</p>
        <div class="order-agileinfo">
            <div class="col-md-3 col-sm-3 col-xs-6 order-w3lsgrids">
                <div class="order-w3text">
                    <i class="fa fa-map" aria-hidden="true"></i>
                    <h5>Search</h5>
                    <span>1</span>
                </div>
            </div>
            <div class="col-md-3 col-sm-3 col-xs-6 order-w3lsgrids">
                <div class="order-w3text">
                    <i class="fa fa-cutlery" aria-hidden="true"></i>
                    <h5>Select</h5>
                    <span>2</span>
                </div>
            </div>
            <div class="col-md-3 col-sm-3 col-xs-6 order-w3lsgrids">
                <div class="order-w3text">
                    <i class="fa fa-credit-card" aria-hidden="true"></i>
                    <h5>Pay</h5>
                    <span>3</span>
                </div>
            </div>
            <div class="col-md-3 col-sm-3 col-xs-6 order-w3lsgrids">
                <div class="order-w3text">
                    <i class="fa fa-truck" aria-hidden="true"></i>
                    <h5>Enjoy</h5>
                    <span>4</span>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!-- //order -->
<!-- deals -->
<div class="w3agile-deals">
    <div class="container">
        <h3 class="w3ls-title">Special Service</h3>
        <div class="dealsrow">
            <div class="col-md-6 col-sm-6 deals-grids">
                <div class="deals-left">
                    <i class="fa fa-truck" aria-hidden="true"></i>
                </div>
                <div class="deals-right">
                    <h4>Free For Delivery</h4>
                    <p>For New Customers</p>
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="col-md-6 col-sm-6 deals-grids">
                <div class="deals-left">
                    <i class="fa fa-birthday-cake" aria-hidden="true"></i>
                </div>
                <div class="deals-right">
                    <h4>For Party</h4>
                    <p>Multiple Packages</p>
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="col-md-6 col-sm-6 deals-grids">
                <div class="deals-left">
                    <i class="fa fa-users" aria-hidden="true"></i>
                </div>
                <div class="deals-right">
                    <h4>Cooperation Scheme</h4>
                    <p>Please Contact Us</p>
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="col-md-6 col-sm-6 deals-grids">
                <div class="deals-left">
                    <i class="fa fa-building" aria-hidden="true"></i>
                </div>
                <div class="deals-right">
                    <h4>Enterprise Orders</h4>
                    <p>Please Contact Us</p>
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!-- //deals -->


<!-- footer -->
<div class="footer agileits-w3layouts">
    <div class="container">
        <div class="w3_footer_grids">
            <div class="col-xs-6 col-sm-3 footer-grids w3-agileits">
                <h3>Foodie</h3>
                <ul>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Contact Us</a></li>
                    <li><a href="#">Careers</a></li>
                    <li><a href="#">Partner</a></li>
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
<!-- //footer -->
<!-- cart-js -->
<script src="${pageContext.request.contextPath}/script/minicart.js"></script>
<script>
    w3ls.render();

    w3ls.cart.on('w3sb_checkout', function (evt) {
        var items, len, i;

        if (this.subtotal() > 0) {
            items = this.items();

            for (i = 0, len = items.length; i < len; i++) {
            }
        }
    });
</script>
<!-- //cart-js -->
<!-- Owl-Carousel-JavaScript -->
<script src="${pageContext.request.contextPath}/script/owl.carousel.js"></script>
<script>
    $(document).ready(function() {
        $("#owl-demo").owlCarousel ({
            items : 3,
            lazyLoad : true,
            autoPlay : true,
            pagination : true,
        });
    });
</script>
<!-- //Owl-Carousel-JavaScript -->
<!-- start-smooth-scrolling -->
<script src="${pageContext.request.contextPath}/script/SmoothScroll.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/script/move-top.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/script/easing.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function($) {
        $(".scroll").click(function(event){
            event.preventDefault();

            $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
        });
    });
</script>
<!-- //end-smooth-scrolling -->
<!-- smooth-scrolling-of-move-up -->
<script type="text/javascript">
    $(document).ready(function() {
        /*
        var defaults = {
            containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear'
        };
        */

        $().UItoTop({ easingType: 'easeOutQuart' });

    });
</script>
<!-- //smooth-scrolling-of-move-up -->
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath}/script/bootstrap.js"></script>
</body>
</html>
