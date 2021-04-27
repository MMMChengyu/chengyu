<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="java.util.ArrayList"%>
<%@page import="chengyu.utils.DAOFactory"%>
<%@page import="chengyu.bean.Idoms"%>
<%@page import="chengyu.bean.Users"%>
<%@page import="chengyu.dao.*"%>
<%@page import="chengyu.utils.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>登录</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
     <link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
     <link rel="stylesheet" href="../css/css-circular-prog-bar.css">
    <link href="../css/font-awesome.min.css" rel="stylesheet">
    <link href="../css/prettyPhoto.css" rel="stylesheet">
    <link href="../css/price-range.css" rel="stylesheet">
    <link href="../css/animate.css" rel="stylesheet">
	<link href="../css/main.css" rel="stylesheet">
	<link href="../css/responsive.css" rel="stylesheet">
 <link href="https://fonts.googleapis.com/css?family=Poppins:400,700|Raleway:400,600&display=swap" rel="stylesheet">
 <link href="../css/style.css" rel="stylesheet" />

          

    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../images/ico/apple-touch-icon-57-precomposed.png">

	<script language="javascript">
	function checkUserInfo() {
	 if(document.loginForm.loginName.value==""){
	    alert("用户名不能为空!");
	    return false;
	 }
	 if(document.loginForm.loginPass.value==""){
	    alert("密码不能为空!");
	    return false;
	 }
	 if(document.loginForm.code.value==""){
		    alert("验证码不能为空!");
		    return false;
		 }
	}
	function checkUserInfo2() {
		 if(document.registerForm.registerName.value==""){
		    alert("用户名不能为空");
		    return false;
		 }
		 if(document.registerForm.registerEmail.value==""){
			alert("邮箱不能为空");
			return false;
		 }
		 if(document.registerForm.registerPass.value==""){
		    alert("密码不能为空");
		    return false;
		 }
		 if(document.registerForm.registerconfirmPass.value==""){
			    alert("确认密码不能为空");
			    return false;
			 }
		}
	function refresh() {  
        //IE 存在缓存，需要 new Date () 实现更换路径的作用  
        document.getElementById("imagee").src="image.jsp?"+new Date().getTime();  
    }  
	</script>
	<style>
	ul li a{
	color:black;
	font-size:16px;
	font-weight:bold;
	font-family:'youyuan';
}</style>

<script>
    window.onload = function () {
        //每10秒弹出一个桌面通知.
        var number = setInterval(notifyMe, 1800 * 1000);
    }
    function notifyMe() {
        var options = {
            dir: "auto",
            lang: "utf-8",
            body: "小朋友已经学习半小时啦~休息一会再学习哦！",
            tag: "id", //标识
            icon: "iconUrl" //
        };
        //检查浏览器是否支持Notification.
        if (!("Notification" in window)) {
            alert("当前浏览器不支持Notification.");
        }
            //检查用户是否已授权,安全性第一,顺便还可以避免赖皮广告.
        else if (Notification.permission == "granted") {
            //如果已授权,则创建一个Notification对象.
            var notification = new Notification("休息提醒", options);
        }
        else if (Notification.permission == "denied") {
            //如果用户拒绝,则用常规的方式提示,比如:alert().
            alert(options.body);
        }
        else {
            //用户未授权,则向用户询问是否授权.
            Notification.requestPermission(function (permission) {
                //用户同意授权,则创建一个Notification对象.
                var notification = new Notification("休息提醒", options);
            });
        }
    }
</script>
</head><!--/head-->

<body>
	
	 <div class="top_container ">
    <!-- header section strats -->
    <header class="header_section">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="index.jsp">
            <span>
              成语趣味学习平台
            </span>
          </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="d-flex ml-auto flex-column flex-lg-row align-items-center">
              <ul class="navbar-nav  ">
                <li class="nav-item active">
                  <a class="nav-link" href="index.jsp"> 首页 <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item ">
                  <a class="nav-link" href="category.jsp"> 成语分类 </a>
                </li>

                <li class="nav-item ">
                 <a class="nav-link" href="test.jsp">小测试 </a>
                </li>

               
                <li>
					<%
					Users cuss = (Users) session.getAttribute("loginuser");
									if(cuss == null){
										out.println("<li><a href=\"login.jsp\" style=\"margin-top: -10px;display: inline-block;\">请登录</a></li>");
									}
									else{
										out.println("<li><a href=\"\" style=\"margin-top: -10px;display: inline-block;\"></i>欢迎："+cuss.getUsername()+"</a></li>");
										out.println("<li><a href=\"action?actiontype=logOut\" style=\"margin-top: -10px;display: inline-block;\"></i>注销</a></li>");
									}
								%>
								</li>

              </ul>
            </div>
            </div>
        </nav>
      </div>
    </header>

  </div>
  <!-- end header section -->

    <section id="form" style="margin-top:60px; margin-bottom:120px"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2>登录到您的账户</h2>
						<form action="LoginControl" method="POST" name="loginForm" onSubmit="return checkUserInfo()">
							<input type="text" placeholder="用户名" name="loginName"/>
							<input type="password" placeholder="密码" name="loginPass"/>	
							<input type="text"  placeholder="验证码" name="code" >  
        					<img style="margin-left:20px;" width="80px" height="30px" id="imagee" border="0"  onclick="refresh()" src="image.jsp" title="点击更换图片">  
							<input type="hidden" name="actiontype" value="login">						
							<button type="submit" class="btn btn-default">登录</button>
						</form>
					</div><!--/login form-->
				</div>
				<div class="col-sm-1">
					<h2 class="or">OR</h2>
				</div>
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2>注册新用户</h2>
						<form action="register" method="POST" name="registerForm" onSubmit="return checkUserInfo2()">
							<input type="text" placeholder="用户名" name="registerName"/>
							<input type="email" placeholder="邮箱" name="registerEmail"/>
							<input type="password" placeholder="密码" name="registerPass"/>
							<input type="password" placeholder="确认密码" name="registerconfirmPass"/>								
							<input type="hidden" name="actiontype" value="register">		
							<button type="submit" class="btn btn-default">注册</button>
						</form>
					</div><!--/sign up form-->
				</div>
			</div>
		</div>
	</section><!--/form-->

  <!-- end info section -->

  <!-- footer section -->
  <section class="container-fluid footer_section">
    <p>
      Copyright &copy; 2021.Company name All rights reserved.
    </p>
  </section>
  <!-- footer section -->

  <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
  <script type="text/javascript" src="js/bootstrap.js"></script>
    
</body>
</html>

