<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="chengyu.utils.DAOFactory"%>
<%@page import="chengyu.bean.Sort"%>
<%@page import="chengyu.bean.Idoms"%>
<%@page import="chengyu.dao.*"%>
 <%@page import="chengyu.bean.Users"%>
<%@page import="chengyu.utils.*"%>
<%@page import="java.lang.Math"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/main.css" rel="stylesheet">


 <link rel="stylesheet" href="../css/css-circular-prog-bar.css">
</head>
<body>
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
                  <a class="nav-link" href="admission.html"> 学习分析 </a>
                </li>

                <li>
					<%
									Users cuss = (Users) session.getAttribute("loginuser");
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
            </div>
        </nav>
      </div>
    </header>

	<div class="col-sm-12">
		<table>
		
			<tr>
			<ul class="pager">
			<li><a name="btnTopPage" id="btnTopPage" href="index.jsp?pageNO=1">首页</a></li>
			<li><a name="btnPreviousPage" id="btnPreviousPage"
								href="index.jsp?pageNO=${requestScope.pageModel.prevPageNO}">上一页</a></li>
			<li class="disabled"><a href="#">${requestScope.pageModel.getPageNO()} / ${requestScope.pageModel.bottomPageNO}
			</a></li>
		    <li><a name="btnNextPage" id="btnNextPage"
											href="index.jsp?pageNO=${requestScope.pageModel.nextPageNO}" >下一页</a></li>
			<li><a name="btnBottomPage"	id="btnBottomPage"
							href="index.jsp?pageNO=${requestScope.pageModel.bottomPageNO}">尾页</a></li>
			</ul>
			</tr>
				</table>
							
	</div>
</body>
</html>