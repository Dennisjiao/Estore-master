<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

 <section class="order">
        <div class="head">订单</div>
        <div class="title">
            <ul>
                <li>商品名称</li>
                <li>单价</li>
                <li>数量</li>
                <li>总价</li>
            </ul>
            </ul>
        </div>
      
 
	<ul class="order-content">		
	
        <ul>
            <li>
                <img src="/upload/${sessionScope.pro.imgurl}">
            </li>
            <li><div class="order-details">${sessionScope.pro.description}</div></li>
            <li><span class="price">${sessionScope.pro.price}</span></li>
            <li><span class="order-count">1</span></li>
        </ul>
      	<c:set value="${sessionScope.pro.price}" var="money"></c:set>

            <div class="order-sum">${sessionScope.pro.price}</div>
        </ul>
        <div class="order-foot">
            <ul>
                <li><div class="order-adress">
                    <input aria-label="送货地址" placeholder="送货地址" type="text">
                </div></li>
                <li><a class="sum-btn"	href="${pageContext.request.contextPath}/AddOrderServlet">生成订单</a></li>
            </ul>
        </div>
    </section>
    <aside class="aside-tool">
    <ul>
        <li class="customer">
            <a href="http://wpa.qq.com/msgrd?v=3&uin=476759153&site=qq&menu=yes" target=_blank
               clickid=guanwang_navigation_customer>联系客服</a>
        </li>
        <li class="top"></li>
    </ul>
</aside>
    <footer>
   <div>
       <ul>
           <li>开发人员1</li>
           <li>焦瑞鹏</li>
       </ul>
       <ul>
           <li>开发人员2</li>
           <li>刘佳雷</li>
       </ul>
       <ul>
           <li>开发人员1</li>
           <li>谢晨祎</li>
       </ul>
    </div>
</footer>

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
</script>
    <script type="text/javascript" src="home/JS/jquery.min.js"></script>
    <script type="text/javascript" src="home/JS/jquery-ui.js"></script>
    <script type="text/javascript" src="home/JS/bootstrap.min.js"></script>
    <script type="text/javascript" src="home/JS/bg-canvas.js"></script>
    <script type="text/javascript" src="home/JS/main.js"></script>
</body>
</html>