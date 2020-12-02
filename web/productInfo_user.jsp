<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>单个商品详细信息</title>
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
	function addProductToCart(id){
		
		location.href="${pageContext.request.contextPath}/AddProductToCartServlet?id="+id;
	}
    function phone(obj) {
        location.href="${pageContext.request.contextPath}/FindCategoryServlet?name="+encodeURIComponent(encodeURIComponent(obj));
    }
</script>
<script type="text/javascript" src="home/JS/jquery.min.js"></script>
<script type="text/javascript" src="home/JS/jquery-ui.js"></script>
<script type="text/javascript" src="home/JS/bootstrap.min.js"></script>
<script type="text/javascript" src="home/JS/bg-canvas.js"></script>
<script type="text/javascript" src="home/JS/main.js"></script>

</body>
</html>
