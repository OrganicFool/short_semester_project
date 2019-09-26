<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="css/start.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/style.css">
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<%Cookie user=null;
String preUser=null;
boolean hasCookie=false;
if(request.getCookies()!=null){
for(Cookie c:request.getCookies()){
	if(c.getName().equals("username")) preUser=c.getValue(); hasCookie=true;
}
}
%>

<body>
		<div class="banner">
		<div class="header"><!--header-->
			<div class="container">		
				<nav class="navbar navbar-default" role="navigation">
					<div class="navbar-header">
						<h1 class="navbar-brand"><a  href="indexmodify.html">Herschel</a></h1>
					</div>
					<!--navbar-header-->
					<div>
						<ul class="nav navbar-nav navbar-right cl-effect-4">
							<li><a href="index.jsp">Home</a></li>
							<li><a href="product.html">Product</a></li>
							<li><a href="company.html">Company</a></li>
							<li><a href="aftersale.html">Aftersale</a></li>
							<li class="active"><a href="login.html">Me</a></li>
						</ul>	
					</div>
				</nav>
			</div>
		</div>
			
		<div class="loginHeadPic" style="">
	<style>
	.headPic {
	width: 100px;
	border-radius: 200px;
	height: 100px;
	margin-left: auto;}
	.headPic_align {
	text-align: center;
	}</style>
	
		<p class="headPic_align"> <img src="../images/bkg_06.jpg" alt="headPic" class="headPic">
		</p>
	</div>
<form style="font-family:sans-serif;text-align:center" action="Login" method="post"> 
	username : <br/>
  <input type="text" name="username"/><br/>
			password : <br/>
			<input type="password" name="password"/><br/>
  <br/>
	
			<input type="SUBMIT" name="submit" value="Submit"> 
			<input type="checkbox" name="autologin"  value="on">autoLogin(6 hours)
		</form>
	
  <div  style="text-align: center">
          <h3><a href="regist.jsp">no Account? register now!</a></h3>
          </div>
	</div>
	
<div class="banner2">
<div class="banner-text1">
			<h2>WARMLY WELCOME<br>FOR <br>  JOIN US</h2>
			<a class="hvr-bounce-to-right" href="#">Join now</a>
		</div>
</div>	
		<div class="banner4">
		<p  style="text-align: center">Copyright &copy; 2019.Company name All rights reserved.</p>
		</div>

<h1><a href="regist.jsp">Still don't have an account? register immediately!</a></h1>
</body>
</html>