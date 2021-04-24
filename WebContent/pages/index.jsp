<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="chengyu.utils.PageModel"%>
<%@page import="chengyu.dao.SortDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="chengyu.utils.DAOFactory"%>
<%@page import="chengyu.dao.IdomsDAO"%>
<%@page import="chengyu.biz.IdomsService"%>
<%@page import="chengyu.bean.Idoms"%>
<%@page import="chengyu.bean.Sort"%>
<%@page import="chengyu.dao.*"%>
<%@page import="chengyu.biz.*"%>
<%@page import="chengyu.utils.*"%>
<%@page import="chengyu.utils.ConfigFactory" %>    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
if(session.getAttribute("pageSize") == null){
	session.setAttribute("pageSize", ConfigFactory.readProperty("pageSize"));
}
if(request.getParameter("pageNO") == null){
	request.setAttribute("pageNO", "1");
}
else{
	request.setAttribute("pageNO", request.getParameter("pageNO"));
}

//根据页码生成相应的dishlist
int pageNO = Integer.parseInt((String)request.getAttribute("pageNO"));
int pageSize = Integer.parseInt((String)session.getAttribute("pageSize"));
IdomsService idomsService = new IdomsService();
PageModel<Idoms> pagemodel = idomsService.findIdoms4PageList(pageNO, pageSize);
request.setAttribute("idomslist", pagemodel.getList().subList(0, 3));
request.setAttribute("idomslist2", pagemodel.getList().subList(3, 6));
request.setAttribute("idomslist3", pagemodel.getList().subList(6, 9));
request.setAttribute("idomslist4", pagemodel.getList().subList(9,12));
request.setAttribute("pageModel", pagemodel); 

%>    


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- bootstrap core css -->
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
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
  <div class="common_style">

    <!-- about section -->
    <section class="about_section">
      <div class="container">
        <div class="row">
          <div class="col-md-4">
            <div class="about_img-container">
              <img src="../images/about.png" alt="">
            </div>
          </div>
          <div class="col-md-8">
			
			   <div class="container">
                <ul class="blocks-100 blocks-sm-2 blocks-md-4 blocks-xlg-4 ">
                	<c:forEach items="${requestScope.idomslist}" var="currentidoms"
									varStatus="status">
					<li class="">
                        <div class="widget widget-article widget-shadow">
                            <div class="widget-header cover overlay overlay-hover">
                                <img class="cover-image overlay-scale" src="../images/chengyu/${currentidoms.getImg()}" alt="">
                            </div>
                            <div class="widget-body">
                                <div class="widget-body-footer">
                                	<form>
									        <select>
									        	<option selected=selected>请选择正确的成语</option>
									            <option>艾欧尼亚</option>
									            <option>黑色玫瑰</option>
									            <option>比尔吉沃特</option>
									            <option>弗雷尔卓德</option>
									        </select>
									        <button  class="btn btn-info waves-effect waves-light">确定</button>      
										</form>
                                </div>
                            </div>
                        </div>
                    </li>	
					</c:forEach>
                </ul>
            </div>
			
            </div>
          </div>
        </div>
    </section>


    <!-- end about section -->

    <!-- admission section -->
    <section class="admission_section">
      <div class="container">
        <div class="row">
          <div class="col-md-8">

 		<div class="container">
                <ul class="blocks-100 blocks-sm-2 blocks-md-4 blocks-xlg-4 " data-scale=''>
                  <c:forEach items="${requestScope.idomslist2}" var="currentidoms"
									varStatus="status">
					<li class="">
                        <div class="widget widget-article widget-shadow">
                            <div class="widget-header cover overlay overlay-hover">
                                <img class="cover-image overlay-scale" src="../images/chengyu/${currentidoms.getImg()}" alt="">
                            </div>
                            <div class="widget-body">
                                <div class="widget-body-footer">
                                	<form>
									        <select>
									        	<option selected=selected>请选择正确的成语</option>
									            <option>艾欧尼亚</option>
									            <option>黑色玫瑰</option>
									            <option>比尔吉沃特</option>
									            <option>弗雷尔卓德</option>
									        </select>
									        <button  class="btn btn-info waves-effect waves-light">确定</button>      
										</form>
                                </div>
                            </div>
                        </div>
                    </li>	
					</c:forEach>
                </ul>
            </div>

          </div>
          <div class="col-md-4">
            <div class="admission_img-container">
              <img src="../images/admission.png" alt="">
            </div>
          </div>
        </div>
      </div>
    </section>



    <!-- end admission section -->

    <!-- why section -->
    <section class="why_section">
      <div class="container">
        <div class="row">
          <div class="col-md-4">
            <div class="why_img-container">
              <img src="../images/why.png" alt="">
            </div>
          </div>
          <div class="col-md-8">
            
            	<div class="container">
                <ul class="blocks-100 blocks-sm-2 blocks-md-4 blocks-xlg-4 " data-scale=''>
                   <c:forEach items="${requestScope.idomslist3}" var="currentidoms"
									varStatus="status">
					<li class="">
                        <div class="widget widget-article widget-shadow">
                            <div class="widget-header cover overlay overlay-hover">
                                <img class="cover-image overlay-scale" src="../images/chengyu/${currentidoms.getImg()}" alt="">
                            </div>
                            <div class="widget-body">
                                <div class="widget-body-footer">
                                	<form>
									        <select>
									        	<option selected=selected>请选择正确的成语</option>
									            <option>艾欧尼亚</option>
									            <option>黑色玫瑰</option>
									            <option>比尔吉沃特</option>
									            <option>弗雷尔卓德</option>
									        </select>
									        <button  class="btn btn-info waves-effect waves-light">确定</button>      
										</form>
                                </div>
                            </div>
                        </div>
                    </li>	
					</c:forEach>
                </ul>
            </div>
            
          </div>
        </div>
      </div>
    </section>


    <!-- end why section -->

    <!-- determine section -->
    <section class="determine_section">
      <div class="container">
        <div class="row">
          <div class="col-md-8">

<div class="container">
                <ul class="blocks-100 blocks-sm-2 blocks-md-4 blocks-xlg-4 " data-scale=''>
                    <c:forEach items="${requestScope.idomslist4}" var="currentidoms"
									varStatus="status">
					<li class="">
                        <div class="widget widget-article widget-shadow">
                            <div class="widget-header cover overlay overlay-hover">
                                <img class="cover-image overlay-scale" src="../images/chengyu/${currentidoms.getImg()}" alt="">
                            </div>
                            <div class="widget-body">
                                <div class="widget-body-footer">
                                	<form>
									        <select>
									        	<option selected=selected>请选择正确的成语</option>
									            <option>艾欧尼亚</option>
									            <option>黑色玫瑰</option>
									            <option>比尔吉沃特</option>
									            <option>弗雷尔卓德</option>
									        </select>
									        <button  class="btn btn-info waves-effect waves-light">确定</button>      
										</form>
                                </div>
                            </div>
                        </div>
                    </li>	
					</c:forEach>
                </ul>
            </div>

          </div>
          <div class="col-md-4">
            <div class="determine_img-container">
              <img src="../images/determine.png" alt="">
            </div>
          </div>
        </div>
      </div>
    </section>


    <!-- end determine section -->

  </div>

 

  <!-- end client section -->


    

  <!-- footer section -->
  <section class="container-fluid footer_section">
    <p>
      Copyright &copy; 2020.Company name All rights reserved.
    </p>
  </section>
  <!-- footer section -->

  <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
  <script type="text/javascript" src="../js/bootstrap.js"></script>
</body>
</html>