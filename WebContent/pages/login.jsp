<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
        document.getElementById("imagee").src="../image.jsp?"+new Date().getTime();  
    }  
	</script>
	<style>
	ul li a{
	color:black;
	font-size:16px;
	font-weight:bold;
	font-family:'youyuan';
}</style>
</head><!--/head-->

<body>
	
	 <div class="top_container ">
    <!-- header section strats -->
    <header class="header_section">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="index.html">
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
                  <a class="nav-link" href="admission.html"> 学习分析 </a>
                </li>

                <li class="nav-item">
                  <a class="nav-link" href="login.jsp"> 登录 </a>
                </li>

              </ul>
            </div>
            </div>
        </nav>
      </div>
    </header>

  </div>
  <!-- end header section -->

    <section id="form" style="margin-top:0px; margin-bottom:120px"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2>登录到您的账户</h2>
						<form action="LoginControl" method="POST" name="loginForm" onSubmit="return checkUserInfo()">
							<input type="text" placeholder="用户名" name="loginName"/>
							<input type="password" placeholder="密码" name="loginPass"/>	
							<input type="text"  placeholder="验证码" name="code" >  
        					<img width="80px" height="30px" id="imagee" border="0"  onclick="refresh()" src="image.jsp" title="点击更换图片">  
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
      Copyright &copy; 2020.Company name All rights reserved.
    </p>
  </section>
  <!-- footer section -->

  <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
  <script type="text/javascript" src="js/bootstrap.js"></script>
    
</body>
</html>

