<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>personal Infomation</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="" />
	<script type="application/x-javascript">
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
	<%String phone=(String)request.getAttribute("phone");
	String address=(String)request.getAttribute("address");
	String email=(String)request.getAttribute("email");
	String password=(String)request.getAttribute("password");
	String username=(String)request.getSession().getAttribute("username");
	
	%>
	<link href="css/cartFoot.css" rel="stylesheet" type="text/css" media="all" />
	<!-- //custom-theme -->
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link rel="stylesheet" href="css/shop.css" type="text/css" media="screen" property="" />
	<link href="css/style7.css" rel="stylesheet" type="text/css" media="all" />
	<!-- Owl-carousel-CSS -->
	<link rel="stylesheet" type="text/css" href="css/checkout.css">
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<!-- font-awesome-icons -->
	<link href="css/font-awesome.css" rel="stylesheet">
	<!-- //font-awesome-icons -->
	<link href="http://fonts.googleapis.com/css?family=Montserrat:100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800"
	    rel="stylesheet">
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">
</head>

<body>
	
			<!-- banner -->
	<div class="banner_top innerpage" id="home">
		<div class="wrapper_top_w3layouts">
			<div class="header_agileits">
				<div class="logo inner_page_log">
					<h1><a class="navbar-brand" href="index.html"><span>Downy</span> <i>Shoes</i></a></h1>
				</div>
				<div class="overlay overlay-contentpush">
					<button type="button" class="overlay-close"><i class="fa fa-times" aria-hidden="true"></i></button>

					<nav>
						<ul>
							<li><a href="index.jsp" class="active">Home</a></li>
							<li><a href="about.html">About</a></li>
							<li><a href="CheckHistoryByUsername">History Check</a></li>
							<li><a href="shop.html">Shop Now</a></li>
							<li><a href="personalInfo.jsp">Change Personal Info</a></li>
						</ul>
					</nav>
				</div>
				<div class="mobile-nav-button">
					<button id="trigger-overlay" type="button"><i class="fa fa-bars" aria-hidden="true"></i></button>
				</div>
				<!-- cart details -->
				<div class="top_nav_right">
					<div class="shoecart shoecart2 cart cart box_1">
						<form action="#" method="post" class="last">
							<input type="hidden" name="cmd" value="_cart">
							<input type="hidden" name="display" value="1">
							<button class="top_shoe_cart" type="submit" name="submit" onClick="window.open('cart.html')" value=""><i class="fa fa-cart-arrow-down" aria-hidden="true"></i></button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- //cart details -->
		<!-- search -->
		<div class="search_w3ls_agileinfo">
			<div class="cd-main-header">
				<ul class="cd-header-buttons">
					<li><a class="cd-search-trigger" href="#cd-search"> <span></span></a></li>
				</ul>
			</div>
			<div id="cd-search" class="cd-search">
				<form action="#" method="post">
					<input name="Search" type="search" placeholder="Click enter after typing...">
				</form>
			</div>
		</div>
		<!-- //search -->
		<div class="clearfix"></div>
		<!-- /banner_inner -->
		<div class="services-breadcrumb_w3ls_agileinfo">
			<div class="inner_breadcrumb_agileits_w3">

				<ul class="short">
				  <li><a href="index.jsp">Home</a><em>|</em></li>
				  <li>Infomation</li>
				</ul>
			</div>
		</div>
		<!-- //banner_inner -->
	</div>
	<!-- top Products -->
	<div class="ads-grid_shop">
		<div class="shop_inner_inf">
			
			<h3 class="head">Your Info.</h3>
			<p class="head_para">Add More If You Like</p>
			<div class="inner_section_w3ls">
				<div class="col-md-7 contact_grid_right">

					<form action="ChangeUserInfo" method="post">
					
					<div class="visit">
						<div class="col-md-2 col-sm-2 col-xs-2 contact-icon">
						
						</div>
						<div class="col-md-10 col-sm-10 col-xs-10 contact-text">
							<h4>Name</h4>
							<input value=<%=username %> style="width: 100%" type=text name="username" readonly="true">
						</div>
						<div class="clearfix"></div>
					</div>	
						
						<div class="visit">
						<div class="col-md-2 col-sm-2 col-xs-2 contact-icon"> </div>
						<div class="col-md-10 col-sm-10 col-xs-10 contact-text">
							<h4>password</h4>
						  <input value=<%=password %> type=text style="width: 100%" name="password">
						</div>
						<div class="clearfix"></div>
					</div>	
					<div class="visit">
						<div class="col-md-2 col-sm-2 col-xs-2 contact-icon">
							<span class="fa fa-home" aria-hidden="true"></span>
						</div>
						<div class="col-md-10 col-sm-10 col-xs-10 contact-text">
							<h4>Address</h4>
							<input value=<%=address %> type=text style="width: 100%" name="address">
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="mail-us">
						<div class="col-md-2 col-sm-2 col-xs-2 contact-icon">
							<span class="fa fa-envelope" aria-hidden="true"></span>
						</div>
						<div class="col-md-10 col-sm-10 col-xs-10 contact-text">
							<h4>Mail</h4>
							<input value=<%=email %> type=text style="width: 100%" name="email" readonly="true">
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="call">
						<div class="col-md-2 col-sm-2 col-xs-2 contact-icon">
							<span class="fa fa-phone" aria-hidden="true"></span>
						</div>
						<div class="col-md-10 col-sm-10 col-xs-10 contact-text">
							<h4>Tel</h4>
				<input value=<%=phone %> type=text style="width: 100%" name="phone">
						</div>
						<div class="clearfix"></div>
					</div>
					<br><br><br>
					<input type="submit" value="Submit" style="background-color: #000000; border-color: #000000;color: #FFFFFF; border-radius: 10px; margin-left: 40%">
						
					<input type="reset" value="Reset" style="background-color: #000000; border-color: #000000;color: #FFFFFF; border-radius: 10px">
					</form>
				</div>
			
				</div>
				<div class="col-md-5 contact-left">
				<img src="images/img2.jpg" style="width: 300px; height: 320px">
					</div>
				</div>
				<div class="clearfix"> </div>

			</div>

<!-- footer -->
	<div class="footer_agileinfo_w3">
			<div class="footer_inner_info_w3ls_agileits">
				<div class="col-md-3 footer-left">
					<h2><a href="index.html"><span>A</span>ngle Tech. </a></h2>
					<p>We hope our product will bring you a new angle to view the world.</p>
					<ul class="social-nav model-3d-0 footer-social social two">
						<li>
							<a href="#" class="facebook">
								<div class="front"><i class="fa fa-facebook" aria-hidden="true"></i></div>
								<div class="back"><i class="fa fa-facebook" aria-hidden="true"></i></div>
							</a>
						</li>
						<li>
							<a href="#" class="twitter">
								<div class="front"><i class="fa fa-twitter" aria-hidden="true"></i></div>
								<div class="back"><i class="fa fa-twitter" aria-hidden="true"></i></div>
							</a>
						</li>
						<li>
							<a href="#" class="instagram">
								<div class="front"><i class="fa fa-instagram" aria-hidden="true"></i></div>
								<div class="back"><i class="fa fa-instagram" aria-hidden="true"></i></div>
							</a>
						</li>
						<li>
							<a href="#" class="pinterest">
								<div class="front"><i class="fa fa-linkedin" aria-hidden="true"></i></div>
								<div class="back"><i class="fa fa-linkedin" aria-hidden="true"></i></div>
							</a>
						</li>
					</ul>
				</div>
				<div class="col-md-9 footer-right">
					<div class="sign-grds">
						<div class="col-md-4 sign-gd">
							<h4>Our <span>Information</span> </h4>
							<ul>
								<li><a href="index.html">Home</a></li>
								<li><a href="about.html">About</a></li>
								<li><a href="404.html">Services</a></li>
								<li><a href="404.html">Short Codes</a></li>
								
							</ul>
						</div>

						<div class="col-md-5 sign-gd-two">
							<h4>Store <span>Information</span></h4>
							<div class="address">
								<div class="address-grid">
									<div class="address-left">
										<i class="fa fa-phone" aria-hidden="true"></i>
									</div>
									<div class="address-right">
										<h6>Phone Number</h6>
										<p>+1 234 567 8901</p>
									</div>
									<div class="clearfix"> </div>
								</div>
								<div class="address-grid">
									<div class="address-left">
										<i class="fa fa-envelope" aria-hidden="true"></i>
									</div>
									<div class="address-right">
										<h6>Email Address</h6>
										<p>Email :<a href="mailto:example@email.com"> mail@example.com</a></p>
									</div>
									<div class="clearfix"> </div>
								</div>
								<div class="address-grid">
									<div class="address-left">
										<i class="fa fa-map-marker" aria-hidden="true"></i>
									</div>
									<div class="address-right">
										<h6>Location</h6>
										<p>Nanfeng Street, Haidian, Beijing, China

										</p>
									</div>
									<div class="clearfix"> </div>
								</div>
							</div>
						</div>
						<div class="col-md-3 sign-gd flickr-post">
							<h4>Flickr <span>Posts</span></h4>
							<ul>
								<li><img src="images/t1.jpg" alt=" " class="img-responsive" /></li>
								<li><img src="images/t2.jpg" alt=" " class="img-responsive" /></li>
								<li><img src="images/t3.jpg" alt=" " class="img-responsive" /></li>
								<li><img src="images/t4.jpg" alt=" " class="img-responsive" /></li>
								<li><img src="images/t1.jpg" alt=" " class="img-responsive" /></li>
								<li><img src="images/t2.jpg" alt=" " class="img-responsive" /></li>
								<li><img src="images/t3.jpg" alt=" " class="img-responsive" /></li>
								<li><img src="images/t2.jpg" alt=" " class="img-responsive" /></li>
								<li><img src="images/t4.jpg" alt=" " class="img-responsive" /></li>
							</ul>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="clearfix"></div>

				<p class="copy-right-w3ls-agileits">Copyright &copy; 2018.Company name All rights reserved.</p>
			</div>
		</div>
	
	
	
	
	
		<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<!-- //js -->
	<!-- cart-js -->

	
	<!-- //cart-js -->
	<script src="js/cart.js"></script>
	<!-- /nav -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<script src="js/classie.js"></script>
	<script src="js/demo1.js"></script>
	<!-- //nav -->
	<!--search-bar-->
	<script src="js/search.js"></script>
	<!--//search-bar-->
	


	<!-- start-smoth-scrolling -->
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>

	<!-- //end-smoth-scrolling -->
	<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>

</body>
</html>
