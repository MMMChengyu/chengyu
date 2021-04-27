<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>CSS3答题卡翻页效果</title>
    <meta name="format-detection" content="telephone=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="viewport" content="width=device-width,initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="description" content="">
    <meta name="keywords" content="">
<link href="../css/risk_test.css" rel="stylesheet" />
<style>
label{
font-family:'youyuan';}

</style>
</head>

<body>
<jsp:include page="head.jsp"></jsp:include>
<section style="margin-left: 500px;">
	<div class="wrapper">
    	<div id="answer" class="card_wrap">
        	<!--Q1-->
       	  	
            	
            	<%
            	IdomsDAO iddao = (IdomsDAO) DAOFactory.newInstance("IdomsDAO");
            	List<Idoms> showIdoms = iddao.findnIdoms();
            	int i=1;
            	for(Idoms idoms:showIdoms)
            	{
            		out.println("<div class=\"card_cont card"+i+"\">");
            		out.println("<div class=\"card\">");
            		out.println("<p class=\"question\"><span>Q"+i+"、</span>"+idoms.getDescri_ch()+"的成语是</p>");
            		out.println("<ul class=\"select\">");
            		
            		ArrayList<Idoms> myidoms = iddao.findfIdoms(idoms.getid());
		        	int num = (int)(Math.random()*10)%3;
		        	//System.out.println(num);
		        	Idoms temp = myidoms.get(num);
		        	myidoms.set(num, idoms);
		        	myidoms.add(temp);
		        	int j=1;
		        	for(int k=0;k<myidoms.size();k++){
		        		out.println("<li onClick=\"checkAnswer(event,"+i+",'"+idoms.getname()+"')\">");
	            		out.println("<input id=\"q"+i+"_"+j+"\" type=\"radio\" name=\"r-group-"+i+"\" >");
		         		//out.println(" <option>"+myidoms.get(i).getname()+"</option>");
		         		out.println("<label for=\"q"+i+"_"+j+"\">"+myidoms.get(k).getname()+"</label>");
		         		out.println("	</li>");
		         				j++;
		         	}
         			out.println(" </ul>");
         			if(i==1){
         				out.println("<div class=\"card_bottom\"><span><b>1</b>/9</span></div>");
         			}
         			else{
         				out.println(" <div class=\"card_bottom\"><a class=\"prev\">上一题</a><span><b>"+i+"</b>/9</span></div>");
         			}
         			out.println("</div></div>");
         			i++;
           	}
            	
            	%>
    	</div><!--/card_wrap-->
	</div>
	
	</section>
        <!-- footer section -->
  <section class="container-fluid footer_section">
    <p>
      Copyright &copy; 2021.Company name All rights reserved.
    </p>
  </section>
  <!-- footer section -->


  <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
  <script type="text/javascript" src="../js/bootstrap.js"></script>
    <script src="../js/jquery-1.8.3.min.js"></script>
    <script src="../js/answer.js"></script>
    <script>
	$(function(){
		$("#answer").answerSheet({});
	})
    </script>
    <script>
	  function checkAnswer(event,count,name) {
		  console.log(event);
		  if(event.target.nodeName == 'LABEL'){
			  console.log(event.target.innerText)
			  if(event.target.innerText == name){
				  event.target.style.setProperty('color', 'green', 'important');
			  }else{
				  event.target.style.setProperty('color', 'red', 'important');
				  //找到正确答案：
				  let lis = event.currentTarget.parentElement.querySelectorAll("li");
				  console.log(lis.length);
				  
				  for(let i =0;i<lis.length;i++){
					  console.log(lis[i].innerText);
					  if(lis[i].innerText == name){
						  console.log("eee")
						  lis[i].querySelector("label").style.setProperty('color', 'green', 'important');
						  break;
					  }
				  }
			  }
		  }
  	}
  </script>
</body>

</html>
