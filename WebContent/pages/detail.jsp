<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="chengyu.bean.Users"%>
     <%@page import="chengyu.bean.Idoms"%>
     <%@page import="chengyu.dao.IdomsDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>博学强记——成语详情</title>
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
 <style>
 .m{
	    width: 100%;
    margin-top: -50px;
    overflow: hidden;
}
.shiyi{
	font-size:30px;
	font-family:'stcaiyun';
	margin-top:40px;
	    margin-bottom: 20px;
	color:orange;
}
.wrapper{
	margin-left:250px;
	margin-right:200px;
}
.chengyu{
	    font-size: 38px;
    font-family: 'sthupo';
    text-align: center;
    color: #0D98D1;
    margin-bottom:20px;
    letter-spacing: 10px;
}
.content{
margin-left:250px;
}

 	ruby span{
 	      display: inline-block;
    font-family: 'fangsong';
    font-weight: bolder;
    font-size: 18px;
    letter-spacing: 1px;
    color: black;
 	}
 	
 	rt {
    	margin: 0 2px 0;
    	color:black;
    	font-size:10px;
	}
video:focus {
  outline:none;
}
#leftt{
	width: 50%;
    margin-left: 200px;
    float: left;
}
#rightt{
    width: 15%;
    margin-top: 100px;
    margin-right:200px;
    float: right;
    text-align:center;
}
.tuijain{
font-size: 30px;
    font-family: 'stcaiyun';
    margin-bottom: 20px;
    margin-left: 8px;
    color: orange;
}
ul li{
font-size:16px;
}
.m ul li{
	width: 100%;
    height: 35px;
    line-height: 35px;
    background: #8FBC8F;
    color: white;
    text-align: center;
    font-family: 'fangsong';
    font-weight: bolder;
    font-size: 18px;
    letter-spacing: 4px;
    margin-bottom: 10px;
    border-radius: 15px 15px 15px 15px;
}
 </style>
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
 <p class="chengyu" id="cy"><img src="../images/hu.jpg" width="50px" height="50px">${requestScope.current.getname()}<img src="../images/hu.jpg" width="50px" height="50px"></p>
				  <section class="m">	
				   <div  id="leftt">
							<video width="700" height="480" src="../video/${requestScope.current.getVideo()}"  controls="controls"></video>
						</div>
				<div id="rightt">
				<h3  class="tuijain"><img src="../images/xiong.jpg" width="40px" height="50px">推荐成语<img src="../images/xiong.jpg" width="40px" height="50px"></h3>
				<ul>
				<script>
				let i1 = document.getElementById("cy");
				IdomsDAO idomsdao = (IdomsDAO) DAOFactory.newInstance("IdomsDAO");
			</script>
				<li>
				<script>
				let i2 = 7;
				Idoms id1 = idomsDAO.findIdom(i2);
				let p1 = document.querySelector("li");
				let myrubyy = document.createElement("li");
				myrubyy.innerHTML = id1.getname();
				 p1.appendChild(myrubyy);
				</script>
				</li>
				<li>
				一鸣惊人
				</li>
				<li>
				三顾茅庐
				</li><li>
				夸父逐日
				</li>
				</ul>
				</div>
					</section>
					<div class="wrapper">
  <h3  class="shiyi"><img src="../images/lu.png" width="50px" height="50px">成语释义</h3>
  <script>
    var reg = /[\u3002|\uff1f|\uff01|\uff0c|\u3001|\uff1b|\uff1a|\u201c|\u201d|\u2018|\u2019|\uff08|\uff09|\u300a|\u300b|\u3008|\u3009|\u3010|\u3011|\u300e|\u300f|\u300c|\u300d|\ufe43|\ufe44|\u3014|\u3015|\u2026|\u2014|\uff5e|\ufe4f|\uffe5]/;
    let duanluo = "${requestScope.current.getDescri_ch()}";
    let a = duanluo.replace(/\s*/g, "");
    let pinyin = "${requestScope.current.getDescri_py()}";
    let b = pinyin.split(' ').filter(function(item) {
      return item.length > 0;
    });
    let p = document.querySelector(".wrapper");
    var str = '';
    // var flag = false;
    let myruby = document.createElement("ruby");
    let count = 0;
    for (let i = 0; i < a.length; i++) {
      // if (!flag) {
      //   flag = true;
      // }
      if (a[i] === '*') {
        //记录一个ruby,并清除
        myruby.innerHTML = str;
        p.appendChild(myruby);
        p.innerHTML += "<br>"
        // count++;
        str = "";
        // flag = false;
        continue;
      }
      if (i < b.length) {
        if (reg.test(b[i])) {
          b[i] = " ";
        }
        str += "<span>"+ a[i] +"</span>"+ "<rt>" + b[i] + "</rt>"
      } else {
        str += a[i]
      }

    }
    myruby.innerHTML = str;
    p.appendChild(myruby);

  </script>
  
  
  </div>
  <div class="wrapper mygushi">
  <h3  class="shiyi"><img src="../images/zhu.jpg" width="50px" height="50px">成语故事</h3>
  <script>

    var reg2 = /[\u3002|\uff1f|\uff01|\uff0c|\u3001|\uff1b|\uff1a|\u201c|\u201d|\u2018|\u2019|\uff08|\uff09|\u300a|\u300b|\u3008|\u3009|\u3010|\u3011|\u300e|\u300f|\u300c|\u300d|\ufe43|\ufe44|\u3014|\u3015|\u2026|\u2014|\uff5e|\ufe4f|\uffe5]/;
    let duanluo2 = "${requestScope.current.getStory_ch()}";
    let a2 = duanluo2.replace(/\s*/g, "");
    let pinyin2 = "${requestScope.current.getStory_py()}";
    let b2 = pinyin2.split(' ').filter(function(item) {
      return item.length > 0;
    });
    let q = document.querySelector(".mygushi");
    var str2 = '';
    // var flag = false;
    let myruby2 = document.createElement("ruby");
    let count2 = 0;
    for (let i = 0; i < a.length; i++) {
      // if (!flag) {
      //   flag = true;
      // }
      if (a2[i] === '*') {
        //记录一个ruby,并清除
        myruby2.innerHTML = str2;
        q.appendChild(myruby2);
        q.innerHTML += "<br>"
        // count++;
        str2 = "";
        // flag = false;
        continue;
      }
      if (i < b2.length) {
        if (reg2.test(b2[i])) {
          b2[i] = " ";
        }
        str2 += "<span>"+ a2[i] +"</span>"+ "<rt>" + b2[i] + "</rt>"
      } else {
        str2 += a2[i]
      }

    }
    myruby2.innerHTML = str2;
    q.appendChild(myruby);

  </script>
  
  </div>
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