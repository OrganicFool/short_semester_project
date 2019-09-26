<%@page import="com.sun.xml.internal.ws.developer.UsesJAXBContext"%>
<%@page import="bean.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/start.css">
	<link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
	<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
</head>
<body>
<%
String username=(String)request.getSession().getAttribute("username");
String email=(String)request.getAttribute("email");
String address=(String)request.getAttribute("address");
String phone=(String)request.getAttribute("phone");
%>
<div class="banner">
	<div class="header"><!--header-->
			<div class="container">		
				<nav class="navbar navbar-default" role="navigation">
					<div class="navbar-header">
						<h1 class="navbar-brand"><a  href="index.jsp">Herschel</a></h1>
					</div>
					<!--navbar-header-->
					<div>
						<ul class="nav navbar-nav navbar-right cl-effect-4">
							<li><a href="index.jsp">Home</a></li>
							<li ><a href="product.html">Product</a></li>
							<li><a href="company.html">Company</a></li>
							<li><a href="aftersale.html">Aftersale</a></li>
						</ul>	
					</div>
				</nav>
			</div>
		</div>
	</div>
	<div class="banner9">
		<img src="images/download_20190703164700.gif" alt="userPicture" style="width: 80px; height: 80px; border-radius: 20px;" >
		<table border="0"; bordercolor="#962CCF"; width="50%"; style="margin: 0 auto">
			<tr style="font-size: 20px">
				<td>User name : </td>
				<td> <%=username %> </td>
			</tr>
			<tr style="font-size: 20px">
				<td>E-mail address : </td>
				<td><%=email %></td>
			</tr>
			<tr style="font-size: 20px">
				<td>Telephone number : </td>
				<td> <%=phone %></td>
			</tr>
			<tr style="font-size: 20px">
				<td>Address : </td>
				<td><%=address %></td>
			</tr>
		</table>
	</div>
	<div class="banner4">
	  <p align="center">Copyright &copy; 2019.Company name All rights reserved.</p>
	</div>
</body>
</html>