<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
<%

if(session.getAttribute("pageSize") == null){
	// 第一次访问该页面
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
String str = request.getParameter("query");


if(str==null){
	response.sendRedirect("customerIndex.jsp");
}
PageModel<Idoms> pagemodel = (PageModel) request.getAttribute("pageModel");
List<Idoms> idomslist=pagemodel.getList();
int count =0;
%>

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
              <ul class="navbar-nav  my-navbar ">
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
  
  <div class="container" style="width:90%;">
  <%
  List<Idoms> showIdoms = pagemodel.getList();
  for(Idoms dish:showIdoms) {	
   	out.println("<div class=\"col-sm-3\">");
   	out.println("<div class=\"product-image-wrapper\">");
   	out.println("<div class=\"productinfo text-center\">");
   	out.println("<a onclick=\"return linkClick(this)\"  href=\"action?actiontype=detail&idomsid="+dish.getid()+"\"><img src=../images/chengyu/"+dish.getImg() +"  width=\"250px\" height=\"250px\"></a>	");												
   	out.println("<form>");
		out.println("<select class=\""+count+"\">");
		IdomsDAO idomsDAO = (IdomsDAO) DAOFactory.newInstance("IdomsDAO");
  	ArrayList<Idoms> myidoms = idomsDAO.findthreeIdoms(dish.getid());
  	int num = (int)(Math.random()*10)%3;
  	//System.out.println(num);
  	Idoms temp = myidoms.get(num);
  	myidoms.set(num, dish);
  	myidoms.add(temp);

   	out.println("<option selected=selected>请选择正确的成语</option>");
   	for(int i=0;i<myidoms.size();i++){
   		out.println(" <option>"+myidoms.get(i).getname()+"</option>");
   	}
		out.println("</select>");
		
		//out.println("<button  class=\"btn btn-info waves-effect waves-light\">确定</button> ");
		out.println("<input  class=\"btn btn-info waves-effect waves-light\" type=\"button\" value=\"确定\" onClick=\"checkAnswer("+count+",'"+dish.getname()+"')\"/>");
		count++;
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