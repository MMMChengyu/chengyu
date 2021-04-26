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


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>成语分类</title>
 <link href="../css/bootstrap.min.css" rel="stylesheet">
     <link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
     <link rel="stylesheet" href="../css/css-circular-prog-bar.css">
    <link href="../css/font-awesome.min.css" rel="stylesheet">
    <link href="../css/prettyPhoto.css" rel="stylesheet">
    <link href="../css/price-range.css" rel="stylesheet">
    <link href="../css/stylee.css" rel="stylesheet" />
    <link href="../css/animate.css" rel="stylesheet">
	<link href="../css/main.css" rel="stylesheet">
	<link href="../css/responsive.css" rel="stylesheet">
 <link href="https://fonts.googleapis.com/css?family=Poppins:400,700|Raleway:400,600&display=swap" rel="stylesheet">
 <link href="../css/style.css" rel="stylesheet" />
 
 
 
</head>
<!--/head-->
<style type="text/css">
.container {
    overflow: hidden;
}
.caption {
    color: rgba(0, 0, 0, 0.56);
    font-weight: 700;
    letter-spacing: 1;
    text-transform: uppercase;
}
ul li {
    display: block;
    margin: 5px;
    padding: 0;
    text-align: -webkit-match-parent;
}
ul li a{
	color:#FF7978;
	font-size:16px;
	font-weight:bold;
	font-family:'youyuan';
}
</style>
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

  </div>
  <!-- end header section -->
	<section style="margin-top: 0px;margin-bottom: 50px" width=100%>
		<div class="container" style="margin-top: 100px;width:20%;float:left;" >
	      <nav class="containerleft">
	      <ul class="subcategories">   
	      <li style="font-size:30px;color:#006439;font-family:'youyuan';font-weight:bold;">分类</li>
	     	</br>
	     	<!-- <button class="dashed thin">神话故事成语</button> -->
	  <%
	        
	        SortDAO cgdao = (SortDAO) DAOFactory.newInstance("SortDAO");
	        ArrayList<Sort> arr = cgdao.findSorts();	
	        /* System.out.println("哈哈哈哈哈");
	        System.out.println(arr); */
	       for(Sort sort:arr) {	
	          out.println("<li>");
	          out.println(" <a class=\"dashed thin\" onclick=\"return linkClick(this)\" id=\"side_menu_modern_mixology\" href=\"category.jsp?categoryid="+sort.getid()+"\">");
	          out.println(sort.getname());
	         out.println("	</a>");
	          out.println("</li>"); 
	          out.println("</br>");
	       }
	       %> 
	      </ul>
		</nav>
	  </div>
	  <script>
    function linkClick(linkObject) {
        
    	     var formObject = document.createElement('form');  
    	      document.body.appendChild(formObject);  
    	       formObject.setAttribute('method', 'post');  
    	       var url = linkObject.href;  
    	       var uri = '';  
    	       var i = url.indexOf('?');  
    	               
    	      if(i == -1) {
        
    	        formObject.action = url;  
    	      } else {
        
    	         formObject.action = url.substring(0, i);  
    	      }  
    	               
    	      if( i >= 0 && url.length >= i + 1) {
        
    	         uri = url.substring(i + 1, url.length);  
    	      }  
    	   
          var sa = uri.split('&');  
    	               
    	      for(var i = 0; i < sa.length; i++) {
        
    	        var isa = sa[i].split('=');        
    	        var inputObject = document.createElement('input');  
    	        inputObject.setAttribute('type', 'hidden');  
    	        inputObject.setAttribute('name', isa[0]);  
    	        inputObject.setAttribute('value', isa[1]);  
    	        formObject.appendChild(inputObject);  
    	      }  
    	               
    	      formObject.submit();  
    	              
    	      return false;  
    	 }  
    </script>
	  
	  <div class="container" style="width:80%;">
	  <%	 	
	  	IdomsDAO dishdao = (IdomsDAO) DAOFactory.newInstance("IdomsDAO");
	  	String cgn;
	  	ArrayList<Idoms> dishes;
	  	if(request.getParameter("categoryid")==null){
	  		dishes=dishdao.findIdomsbySortid(1);
	  		cgn=cgdao.findSort(1).getname();
	  	}
	  	else{
	  		dishes = dishdao.findIdomsbySortid(Integer.parseInt(request.getParameter("categoryid")));
	  		cgn=cgdao.findSort(Integer.parseInt(request.getParameter("categoryid"))).getname();
	  	}
	  	//System.out.println(request.getParameter("categoryid")); 
	  	out.println("<h2 class=\"caption\">");
	  	//cgn=URLEncoder.encode(cgn,"UTF-8");
	  	 out.println(cgn);
	  	 out.println("</h2>");
 	        for(Idoms dish:dishes) {	
 	        	out.println("<div class=\"col-sm-3\">");
 	        	out.println("<div class=\"product-image-wrapper\">");
 	        	out.println("<div class=\"productinfo text-center\">");
 	        	out.println("<a  href=\"action?actiontype=detail&dishid="+dish.getid()+"\"><img src=../images/chengyu/"+dish.getImg() +"  width=\"250px\" height=\"250px\"></a>	");												
 	        	out.println("<form>");
 	        	out.println(" <select>");
 	        			out.println("<option selected=selected>请选择正确的成语</option>");
 	        					out.println(" <option>艾欧尼亚</option>");
 	        							out.println(" <option>黑色玫瑰</option>");
 	        									out.println("  <option>比尔吉沃特</option>");
 	        											out.println("  <option>弗雷尔卓德</option>");
 	        													out.println(" </select>");
 	        															out.println(" <button  class=\"btn btn-info waves-effect waves-light\">确定</button>      ");
 	        																	out.println("</form>");
 	        	out.println("</div>");
 	        	out.println("</div>");
 	        	out.println("</div>");
 	        	/*  out.println("<li>");
	          out.println("<a id=\"menu-product-related-caramel-espresso-frappuccino\" href=\"action?actiontype=detail&dishid="+dish.getDishid()+"\">");
	          out.println("<div class=\"preview circle\" style=\"background-image: url(&quot;"+dish.getImgurl()+";)\"></div>");
	          out.println("<strong>"+dish.getDishname()+"</strong>");
	          out.println("</a>");
	          out.println("</li>");  */
	        }  
	       
       %>
	</div>  
  </section>
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