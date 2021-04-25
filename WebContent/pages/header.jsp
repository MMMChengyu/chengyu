<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="chengyu.bean.user"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
 <!-- progress barstle -->
 <link rel="stylesheet" href="../css/css-circular-prog-bar.css">
 <!-- fonts style -->
 <link href="https://fonts.googleapis.com/css?family=Poppins:400,700|Raleway:400,600&display=swap" rel="stylesheet">
 <!-- font wesome stylesheet -->
 <link rel="stylesheet" href="../css/font-awesome.min.css">
 <!-- Custom styles for this template -->
 <link href="../css/style.css" rel="stylesheet" />
 <!-- responsive style -->
 <link href="../css/responsive.css" rel="stylesheet" />
 <link href="../css/index.css" rel="stylesheet" />



 <link rel="stylesheet" href="../css/css-circular-prog-bar.css">
<title>Insert title here</title>
</head>
<body>
<div class="top_container">
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
              <ul class="navbar-nav  my-navbar">
                <li class="nav-item active">
                  <a class="nav-link" href="index.jsp">首页<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item ">
                  <a class="nav-link" href="category.jsp">成语分类</a>
                </li>

                <li class="nav-item ">
                  <a class="nav-link" href="admission.html">做题分析</a>
                </li>
                <li>
					<%
									user cuss = (user) session.getAttribute("loginuser");
									if(cuss == null){
										out.println("<li><a href=\"login.jsp\">请登录</a></li>");
									}
									else{
										out.println("<li><a href=\"\"></i>欢迎："+cuss.getUsername()+"</a></li>");
										out.println("<li><a href=\"action?actiontype=logOut\"></i>注销</a></li>");
									}
								%>
								</li>
              </ul>
            </div>
        </nav>
      </div>
    </header>
    <section class="hero_section ">
      <div class="hero-container container">
        <div class="hero_detail-box">
          <h1>
          	  每天五分钟<br>
          	  轻松学成语
          </h1>
          <p>
            	成语其实不用死记硬背，边看视频边学记忆更深。<br>
            	告别枯燥生硬的文字讲解和乏味的图片，让孩子在最轻松的状态下高效地学习。
          </p>
          <div class="hero_btn-continer">
            <a href="" class="call_to-btn btn_white-border">
     		         开始学习
            </a>
          </div>
        </div>
        <div class="hero_img-container">
          <div>
            <img src="../images/hero.png" alt="" class="img-fluid">
          </div>
        </div>
      </div>
    </section>
  </div>
  <!-- end header section -->
</body>
</html>