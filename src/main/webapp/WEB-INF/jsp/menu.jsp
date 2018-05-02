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

<!-- breadcrumb -->
<div class="container">
    <ol class="breadcrumb w3l-crumbs">
        <li><a href="${pageContext.request.contextPath}/"><i class="fa fa-home"></i> Index</a></li>
        <li class="active">Menu</li>
    </ol>
</div>
<!-- //breadcrumb -->
<!-- products -->
<div class="products">
    <div class="container">
        <div class="col-md-9 product-w3ls-right">
            <div class="product-top">
                <h4>All Food</h4>
                <%--<ul>--%>
                    <%--<li class="dropdown head-dpdn">--%>
                        <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown">Filter By<span class="caret"></span></a>--%>
                        <%--<ul class="dropdown-menu">--%>
                            <%--<li><a href="#">Lowest Price</a></li>--%>
                            <%--<li><a href="#">Most Popular</a></li>--%>
                            <%--<li><a href="#">Newest</a></li>--%>
                        <%--</ul>--%>
                    <%--</li>--%>
                    <%--<li class="dropdown head-dpdn">--%>
                        <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown">Food Type<span class="caret"></span></a>--%>
                        <%--<ul class="dropdown-menu">--%>
                            <%--<li><a href="#">Breakfast</a></li>--%>
                            <%--<li><a href="#">Lunch</a></li>--%>
                            <%--<li><a href="#">Dinner</a></li>--%>
                        <%--</ul>--%>
                    <%--</li>--%>
                <%--</ul>--%>
                <div class="clearfix"> </div>
            </div>
            <div class="products-row">
                <c:forEach var="f" items="${requestScope.foodlist}">
                    <div class="col-xs-6 col-sm-4 product-grids">
                        <div class="flip-container">
                            <div class="flipper agile-products">
                                <div class="front">
                                    <img src="${f.imgSrc}" class="img-responsive" alt="img">
                                    <div class="agile-product-text">
                                        <h5>${f.name}</h5>
                                    </div>
                                </div>
                                <div class="back">
                                    <h4>${f.name }</h4>
                                    <p>${f.info }</p>
                                    <h6>${f.price }<sup>$</sup></h6>
                                    <form action="${pageContext.request.contextPath}/addToCart.htm" method="post">
                                        <%--<input type="hidden" name="cmd" value="_cart">--%>
                                        <input type="hidden" name="add" value="${f.id }">
                                        <input type="hidden" name="w3ls_item" value="${f.name }">
                                        <input type="hidden" name="amount" value="${f.price }">
                                        <button type="submit" class="w3ls-cart pw3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>Add to Cart</button>
                                        <span class="w3-agile-line"> </span>
                                        <a href="food.html" >More</a>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <div class="clearfix"> </div>
            </div>
        </div>
        <div class="col-md-3 rsidebar">
            <div class="rsidebar-top">

                <div class="sidebar-row">
                    <h4>Type of food</h4>
                    <ul class="faq">
                        <a href="${pageContext.request.contextPath}/menu.htm"><li>All food</li></a>
                        <c:forEach var="t" items="${requestScope.typesList}" >
                            <a href="${pageContext.request.contextPath}/menu.htm?type=${t.name}"><li >${t.name}</li></a>
                        </c:forEach>
                    </ul>
                    <div class="clearfix"> </div>
                    <!-- script for tabs -->
                    <script type="text/javascript">
                        $(function() {

                            var menu_ul = $('.faq > li > ul'),
                                menu_a  = $('.faq > li > a');

                            menu_ul.hide();

                            menu_a.click(function(e) {
                                e.preventDefault();
                                if(!$(this).hasClass('active')) {
                                    menu_a.removeClass('active');
                                    menu_ul.filter(':visible').slideUp('normal');
                                    $(this).addClass('active').next().stop(true,true).slideDown('normal');
                                } else {
                                    $(this).removeClass('active');
                                    $(this).next().stop(true,true).slideUp('normal');
                                }
                            });

                        });
                    </script>
                    <!-- script for tabs -->
                </div>

            </div>

        </div>
        <div class="clearfix"> </div>
    </div>
</div>

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
