<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>激活信息</title>
</head>
<body>
<center>
		 <!-- 服务器回送激活失败的错误信息	START -->
		 ${requestScope["active.message"]} 
		 <!-- 服务器回送激活失败的错误信息	END -->
	</center>
</body>
</html>