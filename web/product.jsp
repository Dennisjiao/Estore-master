<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>product</title>
<link rel="stylesheet" type="text/css" href="home/CSS/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="home/CSS/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="home/CSS/main.css">
<script type="text/javascript">
function phone(obj) {
	location.href="${pageContext.request.contextPath}/FindCategoryServlet?name="+encodeURIComponent(encodeURIComponent(obj));
}
function change() {
	document.getElementById("cimg").src = "${pageContext.request.contextPath}/checkImg?time="
			+ new Date().getTime();
}
function findProductById(id){
	location.href="http://101.132.142.230:8099/Estore_Web_exploded/ProductFindByIdServlet?id="+id;
}
function showck(obj) {
	location.href="http://101.132.142.230:8099/Estore_Web_exploded/ProductFindByPageCodeServlet?code="+obj;
}
function tocart() {
	location.href="http://101.132.142.230:8099/Estore_Web_exploded/showcart.jsp";
}
</script>
</head>
<body>
<div id="preloader" >
    <div id="status" ></div>
</div>
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
                    <input type="checkbox" id="remember" name="remember" value="on"/>
                    <label for="remember"></label><em>记住用户</em>
                    <input type="checkbox" id="autologin" name="autologin" value="on"/>
                    <label for="autologin"></label> <em>自动登陆</em>
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
                               placeholder="密码（不少于 6 位）">
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

<!--整page内容-->
<section class="page">
    <aside id="aside" class="panel-group aside-menu">
        <h3 class="type">${c1name }</h3>
        <c:forEach items="${c2name}" var="p" varStatus="vs">
        	<dl class="panel panel-default">
            <dt data-toggle="collapse" data-target=".${vs.index}" aria-expanded="true" data-parent="#aside" onclick="selsct(${p.code},${vs.index})">
                <i></i><span class="collapse-btn">${p.name }</span>
            </dt>
            <div class="${vs.index} collapse" id="${vs.index}">
               
            </div>
        	</dl>
        </c:forEach>
    </aside>
<!--商品内容栏-->
    <div class="content">
        <c:forEach items="${pb1.pro}" var="p" varStatus="vs">
				<div class="product">
                          <img src="/upload/${p.imgurl}" onclick="findProductById('${p.id}')">
                          <span class="brand">${p.name}</span>
                          <span class="title">${p.description}</span>
                          <span class="price">${p.price}</span>
                          <a href="${pageContext.request.contextPath}/ProductFindByIdServlet?id=${p.id}"><em class="fast-buy"></em></a>
                </div>
		</c:forEach>
    </div>

    <ul class="pagination">
        <li><a href="${pageContext.request.contextPath}/ProductFindByPageCodeServlet?pageNum=1&currentPage=${pb1.currentPage}">首页</a></li>
		<li><c:if test="${pb1.pageNum==1}"><a>上一页</a></c:if></li>
		<li><c:if test="${pb1.pageNum!=1}"><a href="${pageContext.request.contextPath}/ProductFindByPageCodeServlet?pageNum=${pb1.pageNum-1}&currentPage=${pb1.currentPage}">上一页</a></c:if></li>
        <c:if test="${pb1.pageNum!=1}"><li><a>第${pb1.pageNum}页</a></c:if></li>
        <c:if test="${pb1.pageNum==pb1.totalPage}"><li><a>下一页</a></li><li><a>尾页</a></li></c:if>

        <c:if test="${pb1.pageNum==1}"><li><a>第1页</a></c:if></li>
		<li><c:if test="${pb1.pageNum!=pb1.totalPage}">

			<a href="${pageContext.request.contextPath}/ProductFindByPageCodeServlet?pageNum=${pb1.pageNum+1 }&currentPage=${pb1.currentPage}">下一页</a>
			<a href="${pageContext.request.contextPath}/ProductFindByPageCodeServlet?pageNum=${pb1.totalPage }&currentPage=${pb1.currentPage}">尾页</a>
		</c:if></li>
    </ul>
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
    <div class="dla">
        <a><img src="home/img/geo.png"></a>
    </div>
    <div class="dlb">
        <a><img src="home/img/xxgc.png"></a>
    </div>
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
           <li>开发人员3</li>
           <li>谢晨祎</li>
       </ul>
    </div>
    <div class="dw">
        <h5>地址：河北省石家庄市槐安东路136号</h5>
        <h5>邮编：050031   电话:0311-87208114(查号)</h5>
        <h5>版权所有  © 河北地质大学 Copyright@2016,All Rights Reserved</h5>
        <h5>冀ICP备字15002650-2号</h5>
    </div>
</footer>
<script type="text/javascript" src="home/JS/jquery.min.js"></script>
<script type="text/javascript" src="home/JS/jquery-ui.js"></script>
<script type="text/javascript" src="home/JS/bootstrap.min.js"></script>
<script type="text/javascript" src="home/JS/bg-canvas.js"></script>
<script type="text/javascript" src="home/JS/main.js"></script>
<script type="text/javascript" src="CategoryJS/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="CategoryJS/onloada.js"></script>
</body>
</html>