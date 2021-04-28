<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="chengyu.utils.PageModel"%>
<%@page import="chengyu.dao.SortDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Collections"%>
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
int count =0;
%>    


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- bootstrap core css -->
 <link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
 <!-- progress barstle -->
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
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
  <div class="common_style">

	<div class="col-sm-3 mysearch_box">
		<div class="search_box pull-right">
		<form action="action?actiontype=search" method="post" ><input type="text" placeholder="学点啥？" name="query" >&nbsp; 
			<button class="btn btn-default get search_button" style="margin-top: 0px;    padding: 15px 12px;border-radius: 25px;" id="search">搜索 </button>
				<input type="hidden" name="actiontype" value="search">
				<input type="hidden" name="pageNO" value="1">
		</form>
			
		</div>
	</div>


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
			        <%
			        	List<Idoms> showIdoms = pagemodel.getList().subList(0, 3);
			        	for(Idoms idoms:showIdoms){
			        		out.println("<li>");
			        		out.println(" <div class=\"widget widget-article widget-shadow\">");
			        		out.println("<div class=\"widget-header cover overlay overlay-hover\">");
			        		out.println(" <a href=\"action?actiontype=detail&idomsid="+idoms.getid()+"\"><img class=\"cover-image overlay-scale\" src=\"../images/chengyu/"+idoms.getImg()+"\"></a>");
			        		out.println("</div>");
			        		out.println("<div class=\"widget-body\">");
			        		out.println("<div class=\"widget-body-footer\">");
			        		out.println("<form>");
			        		out.println("<select class=\""+count+"\">");
			        		IdomsDAO idomsDAO = (IdomsDAO) DAOFactory.newInstance("IdomsDAO");
				        	ArrayList<Idoms> myidoms = idomsDAO.findthreeIdoms(idoms.getid());
				        	int num = (int)(Math.random()*10)%3;
				        	//System.out.println(num);
				        	Idoms temp = myidoms.get(num);
				        	myidoms.set(num, idoms);
				        	myidoms.add(temp);
				      
				         	out.println("<option selected=selected>请选择正确的成语</option>");
				         	for(int i=0;i<myidoms.size();i++){
				         		out.println(" <option>"+myidoms.get(i).getname()+"</option>");
				         	}
							out.println("</select>");
							
							//out.println("<button  class=\"btn btn-info waves-effect waves-light\">确定</button> ");
			        		out.println("<input  class=\"btn btn-info waves-effect waves-light\" type=\"button\" value=\"确定\" onClick=\"checkAnswer("+count+",'"+idoms.getname()+"')\"/>");
			        		count++;
							out.println("</form>");
			        		out.println(" </div>");
			        		out.println(" </div>");
			        		out.println(" </div>");
			        		out.println("</li>");
		 				 	}
			        %>			         
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
                  <%
			        	List<Idoms> showIdoms2 = pagemodel.getList().subList(3, 6);
			        	for(Idoms idoms:showIdoms2){
			        		out.println("<li>");
			        		out.println(" <div class=\"widget widget-article widget-shadow\">");
			        		out.println("<div class=\"widget-header cover overlay overlay-hover\">");
			        		out.println(" <a href=\"action?actiontype=detail&idomsid="+idoms.getid()+"\"><img class=\"cover-image overlay-scale\" src=\"../images/chengyu/"+idoms.getImg()+"\"></a>");
			        		out.println("</div>");
			        		out.println("<div class=\"widget-body\">");
			        		out.println("<div class=\"widget-body-footer\">");
			        		out.println("<form>");
			        		out.println("<select>");
			        		IdomsDAO idomsDAO = (IdomsDAO) DAOFactory.newInstance("IdomsDAO");
				        	ArrayList<Idoms> myidoms = idomsDAO.findthreeIdoms(idoms.getid());
				        	int num = (int)(Math.random()*10)%3;
				        	//System.out.println(num);
				        	Idoms temp = myidoms.get(num);
				        	myidoms.set(num, idoms);
				        	myidoms.add(temp);
				      
				         	out.println("<option selected=selected>请选择正确的成语</option>");
				         	for(int i=0;i<myidoms.size();i++){
				         		out.println(" <option>"+myidoms.get(i).getname()+"</option>");
				         	}
							out.println("</select>");
							
							out.println("<input  class=\"btn btn-info waves-effect waves-light\" type=\"button\" value=\"确定\" onClick=\"checkAnswer("+count+",'"+idoms.getname()+"')\"/>");
							count++;
							out.println("</form>");
			        		out.println(" </div>");
			        		out.println(" </div>");
			        		out.println(" </div>");
			        		out.println("</li>");
		 				 	}
			        %>			         
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
                    <%
			        	List<Idoms> showIdoms3 = pagemodel.getList().subList(6, 9);
			        	for(Idoms idoms:showIdoms3){
			        		out.println("<li>");
			        		out.println(" <div class=\"widget widget-article widget-shadow\">");
			        		out.println("<div class=\"widget-header cover overlay overlay-hover\">");
			        		out.println(" <a href=\"action?actiontype=detail&idomsid="+idoms.getid()+"\"><img class=\"cover-image overlay-scale\" src=\"../images/chengyu/"+idoms.getImg()+"\"></a>");
			        		out.println("</div>");
			        		out.println("<div class=\"widget-body\">");
			        		out.println("<div class=\"widget-body-footer\">");
			        		//out.println("<form onSubmit=\"return checkAnswer("+count+","+idoms.getname()+")\">");
			        		out.println("<form>");
			        		out.println("<select>");
			        		IdomsDAO idomsDAO = (IdomsDAO) DAOFactory.newInstance("IdomsDAO");
				        	ArrayList<Idoms> myidoms = idomsDAO.findthreeIdoms(idoms.getid());
				        	int num = (int)(Math.random()*10)%3;
				        	//System.out.println(num);
				        	Idoms temp = myidoms.get(num);
				        	myidoms.set(num, idoms);
				        	myidoms.add(temp);
				      
				         	out.println("<option selected=selected>请选择正确的成语</option>");
				         	for(int i=0;i<myidoms.size();i++){
				         		out.println(" <option value=\""+myidoms.get(i).getname()+"\">"+myidoms.get(i).getname()+"</option>");
				         	}
							out.println("</select>");
							
							out.println("<input  class=\"btn btn-info waves-effect waves-light\" type=\"button\" value=\"确定\" onClick=\"checkAnswer("+count+",'"+idoms.getname()+"')\"/>");
							count++;
			        		out.println("</form>");
			        		out.println(" </div>");
			        		out.println(" </div>");
			        		out.println(" </div>");
			        		out.println("</li>");
		 				 	}
			        %>			        
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
                                     <%
			        	List<Idoms> showIdoms4 = pagemodel.getList().subList(9, 12);
			        	for(Idoms idoms:showIdoms4){
			        		out.println("<li>");
			        		out.println(" <div class=\"widget widget-article widget-shadow\">");
			        		out.println("<div class=\"widget-header cover overlay overlay-hover\">");
			        		out.println(" <a href=\"action?actiontype=detail&idomsid="+idoms.getid()+"\"><img class=\"cover-image overlay-scale\" src=\"../images/chengyu/"+idoms.getImg()+"\"></a>");
			        		out.println("</div>");
			        		out.println("<div class=\"widget-body\">");
			        		out.println("<div class=\"widget-body-footer\">");
			        		out.println("<form>");
			        		out.println("<select>");
			        		IdomsDAO idomsDAO = (IdomsDAO) DAOFactory.newInstance("IdomsDAO");
				        	ArrayList<Idoms> myidoms = idomsDAO.findthreeIdoms(idoms.getid());
				        	int num = (int)(Math.random()*10)%3;
				        	//System.out.println(num);
				        	Idoms temp = myidoms.get(num);
				        	myidoms.set(num, idoms);
				        	myidoms.add(temp);
				      
				         	out.println("<option selected=selected>请选择正确的成语</option>");
				         	for(int i=0;i<myidoms.size();i++){
				         		out.println(" <option>"+myidoms.get(i).getname()+"</option>");
				         	}
							out.println("</select>");
							
							out.println("<input  class=\"btn btn-info waves-effect waves-light\" type=\"button\" value=\"确定\" onClick=\"checkAnswer("+count+",'"+idoms.getname()+"')\"/>");
							count++;
			        		out.println("</form>");
			        		out.println(" </div>");
			        		out.println(" </div>");
			        		out.println(" </div>");
			        		out.println("</li>");
		 				 	}
			        %>		
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

    

  <!-- footer section -->
  <section class="container-fluid footer_section">
    <p>
      Copyright &copy; 2021.Company name All rights reserved.
    </p>
  </section>
  <!-- footer section -->


  <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
  <script type="text/javascript" src="../js/bootstrap.js"></script>
  <script language="javascript">
  function checkAnswer(count,name) {
	  console.log(count);
	  let myselect = document.querySelectorAll("select")[count];
	  
	  let value = myselect.selectedIndex;
	  console.log(value);
	  let option = document.querySelectorAll("select")[count].querySelectorAll("option")[value].text;
	  if(option == name){
		  alert('哇！小朋友真棒！回答正确哦~');
	  }else{
		  alert( '呜呜呜~回答错误啦~再接再厉哦~');
	  }
  }
  </script>
</body>
</html>