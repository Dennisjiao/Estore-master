<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>单个商品详细信息</title>
    <link rel="stylesheet" type="text/css" href="home/CSS/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="home/CSS/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="home/CSS/main.css">
</head>
<body>
<header>
    <nav class="navbar navbar-inverse" role="navigation">
        <div class="logo"></div>
        <a href="ProductFindAllServlet">首页</a>
        <a href="javascript:void(0)" onclick="phone('电器')">电器</a>
        <a href="javascript:void(0)" onclick="phone('日用')">日用</a>
        <a href="javascript:void(0)" onclick="phone('服装')">服装</a>
        <a href="javascript:void(0)" onclick="phone('食品')">食品</a>
        <a href="javascript:void(0)" onclick="phone('Yourlike')">Yourlike</a>
        <span class="slider-bar"></span>
        <i class="carts" onclick="tocart()"></i>
        <span><c:if test="${not empty user }">
            <h4 class="user">${user.username}</h4>
            <a class="logout" href="${pageContext.request.contextPath}/LoginOutServlet">注销</a>
        </c:if>
			<c:if test="${ empty user }">
                <h4 class="signin" data-toggle="modal" data-target="#log-wrapper">登录</h4>
                <h4 class="signup" data-toggle="modal" data-target="#log-wrapper">注册</h4>
                <h4 onclick="tztocargo()">|管理员登陆</h4>
                <script>
                    function tztocargo(){
                        window.location.href='http://101.132.142.230:8080/cargomanagement';
                    }
                </script>
            </c:if>
		</span>
    </nav>
</header>

<!--登录注册-->
<div id="log-wrapper" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
     aria-hidden="true">
    <div class="modal-content modal-dialog" id="log-move">
        <canvas id="myCanvas"></canvas>
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button>
        <div id="log">
            <div id="navs-slider">
                <a id="#signin" class="active">登录</a>
                <a id="#signup">注册</a>

                <span class="navs-slider-bar"></span>
            </div>


            <form id="sign-form-1" action="${pageContext.request.contextPath}/LoginServlet" method="post">
                <div class="group-inputs">
                    <div class="username input-wrapper">
                        <input aria-label="用户名/邮箱" placeholder="用户名/邮箱" required="" type="text" value=""
                               name="username" id="signup-email_adress">
                    </div>
                    <div class="input-wrapper password">
                        <input required="" type="password" id="password-1" name="password" aria-label="密码"
                               placeholder="密码">
                        <span id="password_message-1"></span>
                    </div>
                    <div class="captcha input-wrapper" data-type="en">
                        <input id="captcha" name="captcha" placeholder="验证码" required="" data-rule-required="true"
                               data-msg-required="请填写验证码">
                        <img class="captcha-img" data-toggle="tooltip" data-placement="top" title="看不清楚？换一张"
                             alt="验证码" src="${pageContext.request.contextPath}/checkImg" id="cimg" onclick="change()">
                    </div>
                </div>

                <div id="check-div">
                    <div class="Checkbox">
                        <input type="checkbox" id="remember" name="remember" value="on"/>
                        <label for="remember"></label><em>记住用户</em>
                    </div>
                    <div class="Checkbox">
                        <input type="checkbox" id="autologin" name="autologin" value="on"/>
                        <label for="autologin"></label><em>自动登陆</em>
                    </div>
                </div>

                <div class="sign-btn">
                    <button class="sign-button submit" type="submit">登录</button>
                </div>
            </form>
            <form id="sign-form-2" action="${pageContext.request.contextPath}/RegistServlet" method="post">
                <div class="group-inputs">
                    <div class="username input-wrapper">
                        <input aria-label="用户名" placeholder="用户名" required="" type="text" value=""
                               name="username">
                        <span id="username_message"></span>
                    </div>
                    <div class="email input-wrapper">
                        <input aria-label="邮箱" placeholder="邮箱" required="" type="text" value=""
                               name="email" id="email_adress">
                        <span id="email_message"></span>
                    </div>
                    <div class="input-wrapper password">
                        <input required="" type="password" id="password" name="password" aria-label="密码"
                               placeholder="密码（不少于6位）">
                        <span id="password_message"></span>
                    </div>
                    <div class="input-wrapper password">
                        <input required="" type="password" id="repassword" name="repassword" aria-label="重复密码"
                               placeholder="重复密码">
                        <span id="repassword_message"></span>
                    </div>
                    <div class="captcha input-wrapper" data-type="en">
                        <input id="captcha-1" name="captcha" placeholder="验证码" required="" data-rule-required="true"
                               data-msg-required="请填写验证码">
                        <img class="captcha-img" data-toggle="tooltip" data-placement="top" title="看不清楚？换一张"
                             alt="验证码" src="${pageContext.request.contextPath}/checkImg" id="cimg" onclick="change()">
                        <span id="checkcode_message"></span>
                    </div>
                </div>
                <div class="sign-btn">
                    <button class="sign-button submit" type="submit">注册</button>
                </div>
            </form>
        </div>
    </div>
</div>
</div>
<!--登录注册END-->

<section class="w">
<div class="product-img">
    <div class="handle">
        <div class="thumb">
            <ul>
                <li class="n-hover">
                    <img src="/upload/${pro.imgurl }">
                </li>
                <li class="">
                    <img src="/upload/${pro.imgurl }">
                </li>
                <li class="">
                    <img src="/upload/${pro.imgurl }">
                </li>
                <li class="">
                    <img src="/upload/${pro.imgurl }">
                </li>
                <li class="">
                    <img src="/upload/${pro.imgurl }">
                </li>
                <li class="">
                    <img src="/upload/${pro.imgurl }">
                </li>
                <li class="">
                    <img src="/upload/${pro.imgurl }">
                </li>
                <li class="">
                    <img src="/upload/${pro.imgurl }">
                </li>
                <li class="">
                    <img src="/upload/${pro.imgurl }">
                </li>
            </ul>
        </div>
        <a class="arrow up i-icon"></a>
        <a class="arrow down i-icon"></a>
    </div>
    <div class="view">
        <img src="/upload/${pro.imgurl }">
    </div>
</div>
<div class="product-details">
    <h1>${pro.description}</h1>
    <p class="re"><span>产品编号：</span><span>RE202011181843132</span></p>
    <p class="price" data-price="3649">
        <span>价格</span>
        <span class="price">${pro.price }</span>
    </p>
    <ul class="details">
        <li><span>颜色</span><a class="u-check n-check">${pro.color }</a></li>
        <li><span>品质</span><a class="u-check n-check">A+</a></li>
        <li><span>商家</span><a class="u-check n-check">河北地质大学天猫超市</a></li>
        <li><span>销售地区</span><a class="u-check n-check">河北省</a></li>
        <li><span>购买数量：</span>
            <div class="count-box">
                    <input class="min" name="" type="button" value="-"/>
                    <input class="text-box" name="" type="text" value="1"/>
                    <input class="add" name="" type="button" value="+"/>
                </div>
        </li>
    </ul>
    <div class="action">
        <a class="buy"	href="fastbuy.jsp">立即购买</a>
        
       <a class="addCar" onclick="addProductToCart('${pro.id}')"><i></i>加入购物车</a>
    </div>
</div>
</section>

<script type="text/javascript">
    window.onload=function(){
        var username=document.getElementById("username");
        username.value=window.decodeURIComponent("${cookie.remember.value}","utf-8");
    };

    function change() {
        document.getElementById("cimg").src = "${pageContext.request.contextPath}/checkImg?time="
            + new Date().getTime();
    }

    function findProductById(id){
        location.href="http://101.132.142.230:8099/Estore_Web_exploded/ProductFindByIdServlet?id="+id;
    }
    function phone(obj) {
        location.href="${pageContext.request.contextPath}/FindCategoryServlet?name="+encodeURIComponent(encodeURIComponent(obj));
    }
    function tocart() {
        location.href="http://101.132.142.230:8099/Estore_Web_exploded/showcart.jsp";
    }
    function addProductToCart(id){

        location.href="${pageContext.request.contextPath}/AddProductToCartServlet?id="+id;
    }
</script>
<script type="text/javascript" src="home/JS/jquery.min.js"></script>
<script type="text/javascript" src="home/JS/jquery-ui.js"></script>
<script type="text/javascript" src="home/JS/bootstrap.min.js"></script>
<script type="text/javascript" src="home/JS/bg-canvas.js"></script>
<script type="text/javascript" src="home/JS/main.js"></script>

</body>
</html>
