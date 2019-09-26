
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="ISO-8859-1"%>
 <%@page import="filterAndListener.SessionListener"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Welcome</title>
<link rel="stylesheet" href="css/start.css">
<link href="css/bootstrap.css" type="text/css" rel="stylesheet" >
<link href="css/style.css" type="text/css" rel="stylesheet">
<% boolean isLog=false;
String name=(String)request.getSession().getAttribute("username");
if(name!=null) isLog=true;
%>
</head>
<body>
<div class="banner">
		<div class="header"><!--header-->
			<div class="container">		
				<nav class="navbar navbar-default" role="navigation">
					<div class="navbar-header">
						<a  href="cart.html" ><img src="images/cart.jpg" class="img-circle" style="width: 50px; margin-top: 20px;"></a>
					</div>
					<!--navbar-header-->
					<div>
						<h1></h1>
					</div>
					<div>
						<ul class="nav navbar-nav navbar-right cl-effect-4">
						<%if(isLog)
						{
							out.print("<li><a href='Me'>welocome,"+name+"</a></li>");
							out.print("<li><a href='Logout'>logout</a></li>");
						}
						else{
							out.print("<li class='active'><a href='Login.jsp'>Login</a></li>");
							out.print("<li><a href='regist.jsp'>Register</a></li>");
						}
							%>
							<li><a href="product.html">Product</a></li>
							<li><a href="company.html">Company</a></li>
							<li><a href="CheckHistoryByUsername">History</a></li>
						</ul>	
					</div>
				</nav>
			</div>
		</div>
		<!--//header-->
		<!--banner-text-->
		<div style="border: 2px solid #99ABD5; width: 30%"> 
   <div style="color: aliceblue; font-size: 20px; font-family: Impact, Haettenschweiler, 'Franklin Gothic Bold', 'Arial Black', 'sans-serif'" >
    Real-time online population:
    <div>
    <span style="color:aqua "><%=SessionListener.getCounter() %></span> <br>people online
    </div>
    </div>
   
   </div>
		<div class="banner-text1">
			<h2>Herschel<br> For a better you<br> For a better world</h2>
			<a class="hvr-bounce-to-right" href="#">Get more</a>
		</div>
		<!--//banner-text-->
	</div>
	<!--//banner-->
	<!--banner-bottom-->
	<div class="banner2">
		<div class="banner-text2">
			<h2>Herschel<br> For a better you<br> For a better world</h2>
			<a class="hvr-bounce-to-right" href="#">Get more</a>
		</div>
	</div>
<div class="banner3">
	<div class="banner-text3">
			<h2>Herschel<br> For a better you<br> For a better world</h2>
			<a class="hvr-bounce-to-right" href="#">Get more</a>
		</div>
	</div>
	<!--//banner-bottom-->
	
	<!--footer-->
	<div class="banner4">
		<p align="center">Copyright &copy; 2019.Company name All rights reserved.</p>
	</div>
</body>
</html>