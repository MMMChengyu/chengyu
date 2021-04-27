<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="chengyu.bean.Users"%>
     <%@page import="chengyu.bean.Idoms"%>
     <%@page import="chengyu.dao.*"%>
     <%@page import="chengyu.utils.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
     <link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
 <link href="../css/style.css" rel="stylesheet" />
</head>
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
										out.println("<li><a href=\"login.jsp\" style=\"margin-top: -5px;display: inline-block;\">请登录</a></li>");
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
 
</body>
</html>