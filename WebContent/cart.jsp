<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Commodity"%>
<%@page import="java.util.HashMap"%>
<%@page import="bean.Cart"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>cart</title>
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
<%Cart cart=(Cart)request.getSession().getAttribute("cart");
HashMap<Commodity,Integer> cartHashMap= new HashMap<Commodity,Integer>();
boolean isLogin=!(cart==null);
String addToCartHref;
String removeFromCartHref;

int count=0;%>
</head>
<body >
<%if(!isLogin) response.sendRedirect("stillNotLogin.html"); %>
		<!-- banner -->
	<div class="banner_top innerpage" id="home">
		<div class="wrapper_top_w3layouts">
			<div class="header_agileits">
				<div class="logo inner_page_log">
					<h1><a class="navbar-brand" href="index.html"><span>Angle</span> <i>Tech</i></a></h1>
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
				  <li><a href="index.html">Home</a><em>|</em></li>
				  <li>Cart</li>
				</ul>
			</div>
		</div>
		<!-- //banner_inner -->
	</div>
	
	<div class="ads-grid_shop">
		<div class="shop_inner_inf">
			<div class="privacy about">
			<h3>Shopping Cart</h3>

	<div class="checkout-right">
	<h4>hope you enjoy your time</h4>
		<table class="timetable_sub" id="cartTable">
    <thead>
        <tr>
            <th>check</th>
            <th>Goods</th>
            <th>Price</th>
            <th>quantity</th>
            <th>SubTotal</th>
            <th>Operate</th>
        </tr>
    </thead>
    <tbody id="productLine">
		
		
		
		

						</tbody>
			</table>
	</div>
	
	
<div class="foot" id="foot">
    <label class="fl select-all"><input type="checkbox" class="check-all check"/>&nbsp;All</label>
    <a class="fl delete" id="deleteAll" href="javascript:;" onclick="cleanCart()">cleanCart</a>
	<div class="fr closing"><a href="Order">PAY</a></div>
    <div class="fr total">Total:<span id="priceTotal">0.00</span></div>
    <div class="fr selected" id="selected">Have selected
        <span id="selectedTotal">0</span> thingsS
 
    </div>
    <div class="selected-view">
        <div id="selectedViewList" class="clearfix">
            <!--<div><img src="images/1.jpg"><span>å–æ¶ˆé€‰æ‹©</span></div>-->
        </div>
        <span class="arrow">â—†<span>â—†</span></span>
    </div>
		</div>
		<div class="clearfix"> </div>
		
		</div>
			
		</div>
		
		<!-- //top products -->
		<div>&nbsp;</div><div> &nbsp;  </div>
		<div>&nbsp;</div><div> &nbsp;  </div>
		<div class="mid_slider_w3lsagile">
			
			<div class="col-md-3 mid_slider_text">
				<h5>Some More Dogs</h5>
			</div>
			<div class="col-md-9 mid_slider_info">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class=""></li>
						<li data-target="#myCarousel" data-slide-to="1" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="2" class=""></li>
						<li data-target="#myCarousel" data-slide-to="3" class=""></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="item">
							<div class="row">
								<div class="col-md-3 col-sm-3 col-xs-3 slidering">
									<div class="thumbnail"><img src="images/dog3.jpg" alt="Image" style="max-width:100%;"></div>
								</div>
								<div class="col-md-3 col-sm-3 col-xs-3 slidering">
									<div class="thumbnail"><img src="images/dog4.jpg" alt="Image" style="max-width:100%;"></div>
								</div>
								<div class="col-md-3 col-sm-3 col-xs-3 slidering">
									<div class="thumbnail"><img src="images/dog1.jpg" alt="Image" style="max-width:100%;"></div>
								</div>
								<div class="col-md-3 col-sm-3 col-xs-3 slidering">
									<div class="thumbnail"><img src="images/dog2.jpg" alt="Image" style="max-width:100%;"></div>
								</div>
							</div>
						</div>
						<div class="item active">
							<div class="row">
								<div class="col-md-3 col-sm-3 col-xs-3 slidering">
									<div class="thumbnail"><img src="images/dog1.jpg" alt="Image" style="max-width:100%;"></div>
								</div>
								<div class="col-md-3 col-sm-3 col-xs-3 slidering">
									<div class="thumbnail"><img src="images/dog2.jpg" alt="Image" style="max-width:100%;"></div>
								</div>
								<div class="col-md-3 col-sm-3 col-xs-3 slidering">
									<div class="thumbnail"><img src="images/dog3.jpg" alt="Image" style="max-width:100%;"></div>
								</div>
								<div class="col-md-3 col-sm-3 col-xs-3 slidering">
									<div class="thumbnail"><img src="images/dog4.jpg" alt="Image" style="max-width:100%;"></div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="row">
								<div class="col-md-3 col-sm-3 col-xs-3 slidering">
									<div class="thumbnail"><img src="images/dog1.jpg" alt="Image" style="max-width:100%;"></div>
								</div>
								<div class="col-md-3 col-sm-3 col-xs-3 slidering">
									<div class="thumbnail"><img src="images/dog2.jpg" alt="Image" style="max-width:100%;"></div>
								</div>
								<div class="col-md-3 col-sm-3 col-xs-3 slidering">
									<div class="thumbnail"><img src="images/dog3.jpg" alt="Image" style="max-width:100%;"></div>
								</div>
								<div class="col-md-3 col-sm-3 col-xs-3 slidering">
									<div class="thumbnail"><img src="images/dog4.jpg" alt="Image" style="max-width:100%;"></div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="row">
								<div class="col-md-3 col-sm-3 col-xs-3 slidering">
									<div class="thumbnail"><img src="images/dog1.jpg" alt="Image" style="max-width:100%;"></div>
								</div>
								<div class="col-md-3 col-sm-3 col-xs-3 slidering">
									<div class="thumbnail"><img src="images/dog2.jpg" alt="Image" style="max-width:100%;"></div>
								</div>
								<div class="col-md-3 col-sm-3 col-xs-3 slidering">
									<div class="thumbnail"><img src="images/dog3.jpg" alt="Image" style="max-width:100%;"></div>
								</div>
								<div class="col-md-3 col-sm-3 col-xs-3 slidering">
									<div class="thumbnail"><img src="images/dog4.jpg" alt="Image" style="max-width:100%;"></div>
								</div>
							</div>
						</div>
					</div>
					<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
			<span class="fa fa-chevron-left" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
					<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
			<span class="fa fa-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
					<!-- The Modal -->

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
		
	</div>			
	<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<!-- //js -->
	<!-- cart-js -->

	
	<!-- //cart-js -->
	
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

	<script>
	 $.ajax({
	        url:"ShowCart",
	        type:"GET",
	        success:loading
	    })
	
function loading(jsonData){
		if(jsonData=="[]"){
				alert("empty! try to buy something now!");
		}

		else{
			var jsonObj = eval('('+jsonData+')'); 

			var line = "";
			for(var i=0;i<jsonObj.length;i++){ 
				var ls = jsonObj[i];
	
	//alert("ProductName : "+ls.productName+"\n Price : "+ls.price+"\n number:"+ls.num);
// line +='<tr class="rem1">'
// 	+'<td class="checkbox1"><input class="check-one check" type="checkbox"/></td>'
// 	+'<td class="invert-image">'
// 	+'<a href="single.html">'+'<img src="images/s1.jpg" alt=" " class="img-responsive">'+'<span>'
// 	+ls.productName+'</span></a></td>'
// 	+'<td class="price">'
// 	+ls.price+'</td>'
// 	+'<td class="count"><span class="reduce"> &nbsp;</span><input class="entry value" type="text" value="'
// 	+ls.num+'"/><span class="add">+</span></td><td class="subTotal">675.00</td><td class="operation"><a class="delete" href="#">delete</a></td>'
// 	+'</tr>';
		line +='<tr class="rem1">'
     +'<td class="checkbox1"><input class="check-one check" type="checkbox"/></td>'
     +'<td class="invert-image">'
     +'<a href="ViewProductDetails?productName='+ls.productName+'">'+'<img src="images/'+ls.productName+'.jpg" alt=" " class="img-responsive">'+'<span>'
     +ls.productName+'</span> </a> </td>'
     +'<td class="price">'
     +ls.price+'</td>'
     +'<td class="count"><span class="reduce" id="'
     +ls.productName+'"> -</span><input id="numb" class="entry value" type="text" value="'
     +ls.num+'"/><span class="add" id="'
     +ls.productName+'">+</span></td><td class="subTotal">'
     +(ls.price*ls.num).toFixed(2)+'</td><td class="operation"><a class="delete" href="#" id="'
     +ls.productName+'">delete</ a></td>'
     +'</tr>';
}
	
$("#productLine").html(line);
test();	


		}

}

	 function test(){
		


	var table = document.getElementById('cartTable'); // è´­ç‰©è½¦è¡¨æ ¼
    var selectInputs = document.getElementsByClassName('check'); // æ‰€æœ‰å‹¾é€‰æ¡†
    var checkAllInputs = document.getElementsByClassName('check-all') // å…¨é€‰æ¡†
    var tr = table.children[1].rows; //è¡Œ
    var selectedTotal = document.getElementById('selectedTotal'); //å·²é€‰å•†å“æ•°ç›®å®¹å™¨
    var priceTotal = document.getElementById('priceTotal'); //æ€»è®¡
    var deleteAll = document.getElementById('deleteAll'); // åˆ é™¤å…¨éƒ¨æŒ‰é’®
    var selectedViewList = document.getElementById('selectedViewList'); //æµ®å±‚å·²é€‰å•†å“åˆ—è¡¨å®¹å™¨
    var selected = document.getElementById('selected'); //å·²é€‰å•†å“
    var foot = document.getElementById('foot');
	
	
    // æ›´æ–°æ€»æ•°å’Œæ€»ä»·æ ¼ï¼Œå·²é€‰æµ®å±‚
    function getTotal() {
        var selected = 0;
		var price = 0;
		var html = '';
        for (var i = 0; i < tr.length; i++) {
            if (tr[i].getElementsByTagName('input')[0].checked) {
                tr[i].className = 'on';
                selected += parseInt(tr[i].getElementsByTagName('input')[1].value); //è®¡ç®—å·²é€‰å•†å“æ•°ç›®
                price += parseFloat(tr[i].getElementsByTagName('td')[4].innerHTML); //è®¡ç®—æ€»è®¡ä»·æ ¼
                
            }else{
                tr[i].className = '';
            }
        }
        selectedTotal.innerHTML = selected; // å·²é€‰æ•°ç›®
        priceTotal.innerHTML = price.toFixed(2); // æ€»ä»·
        selectedViewList.innerHTML = html;
        if (selected==0) {
            foot.className = 'foot';
        }
    }

    // è®¡ç®—å•è¡Œä»·æ ¼
    function getSubtotal(tr) {
        var cells = tr.cells;
        var price = cells[2]; //å•ä»·
        var subtotal = cells[4]; //å°è®¡td
        var countInput = tr.getElementsByTagName('input')[1]; //æ•°ç›®input
        var span = tr.getElementsByTagName('span')[1];
        //å†™å…¥HTML
        subtotal.innerHTML = (parseInt(countInput.value) * parseFloat(price.innerHTML)).toFixed(2);
        if (countInput.value == 1) {
            span.innerHTML = '&nbsp';
        }else{
            span.innerHTML = '-';
        }
        //å¦‚æžœæ•°ç›®åªæœ‰ä¸€ä¸ªï¼ŒæŠŠ-å·åŽ»æŽ‰
        
    }

    // ç‚¹å‡»é€‰æ‹©æ¡†
    for(var i = 0; i < selectInputs.length; i++ ){
        selectInputs[i].onclick = function () {
            if (this.className.indexOf('check-all') >= 0) { //å¦‚æžœæ˜¯å…¨é€‰ï¼Œåˆ™å§æ‰€æœ‰çš„é€‰æ‹©æ¡†é€‰ä¸­
                for (var j = 0; j < selectInputs.length; j++) {
                    selectInputs[j].checked = this.checked;
                }
            }
            if (!this.checked) { //åªè¦æœ‰ä¸€ä¸ªæœªå‹¾é€‰ï¼Œåˆ™å–æ¶ˆå…¨é€‰æ¡†çš„é€‰ä¸­çŠ¶æ€
                for (var i = 0; i < checkAllInputs.length; i++) {
                    checkAllInputs[i].checked = false;
                }
            }
            getTotal();//é€‰å®Œæ›´æ–°æ€»è®¡
        }
    }

    // æ˜¾ç¤ºå·²é€‰å•†å“å¼¹å±‚
    selected.onclick = function () {
        if (selectedTotal.innerHTML != 0) {
            foot.className = (foot.className == 'foot' ? 'foot show' : 'foot');
        }
    }


    //ä¸ºæ¯è¡Œå…ƒç´ æ·»åŠ äº‹ä»¶
    for (var i = 0; i < tr.length; i++) {
        //å°†ç‚¹å‡»äº‹ä»¶ç»‘å®šåˆ°trå…ƒç´ 
        tr[i].onclick = function (e) {
            var e = e || window.event;
            var el = e.target || e.srcElement; //é€šè¿‡äº‹ä»¶å¯¹è±¡çš„targetå±žæ€§èŽ·å–è§¦å‘å…ƒç´ 
            var cls = el.className; //è§¦å‘å…ƒç´ çš„class
            var countInout = this.getElementsByTagName('input')[1]; // æ•°ç›®input
            var value = parseInt(countInout.value); //æ•°ç›®
            //é€šè¿‡åˆ¤æ–­è§¦å‘å…ƒç´ çš„classç¡®å®šç”¨æˆ·ç‚¹å‡»äº†å“ªä¸ªå…ƒç´ 
            switch (cls) {
                case 'add': //ç‚¹å‡»äº†åŠ å·
					{
                    countInout.value = value + 1;
                    getSubtotal(this);
                    break;
					}
                case 'reduce': //ç‚¹å‡»äº†å‡å·				
                    if (value > 1) {
                        countInout.value = value - 1;
                        getSubtotal(this);
                    }
                    break;
					
                case 'delete': //ç‚¹å‡»äº†åˆ é™¤
                    var conf = confirm('are you sure to delete?');
                    if (conf) {
                        this.parentNode.removeChild(this);
                    }
                    break;
					
            }
            getTotal();
        }
        // ç»™æ•°ç›®è¾“å…¥æ¡†ç»‘å®škeyupäº‹ä»¶
        tr[i].getElementsByTagName('input')[1].onkeyup = function () {
            var val = parseInt(this.value);
            if (isNaN(val) || val <= 0) {
                val = 1;
            }
            if (this.value != val) {
                this.value = val;
            }
            getSubtotal(this.parentNode.parentNode); //æ›´æ–°å°è®¡
            getTotal(); //æ›´æ–°æ€»æ•°
        }
    }

    // ç‚¹å‡»å…¨éƒ¨åˆ é™¤
    deleteAll.onclick = function () {
            var con = confirm('Are you sure to clean the cart ?Ÿ'); //å¼¹å‡ºç¡®è®¤æ¡†
            if (con) {
            	$.ajax({
            url:"CleanCart",
			type: "GET",
			success:function(){
			}
        })
                for (var i = 0; i < tr.length; i++) {
                        tr[i].parentNode.removeChild(tr[i]); // åˆ é™¤ç›¸åº”èŠ‚ç‚¹
                        i--; //å›žé€€ä¸‹æ ‡ä½ç½®
                }
            }
		
        
        getTotal(); //æ›´æ–°æ€»æ•°
    }


	    // ç‚¹å‡»å…¨éƒ¨åˆ é™¤
	    deleteAll.onclick = function () {
			        $.ajax({
	            url:"CleanCart",
				type: "GET",
				success:function(){
				}
	        })
	            var con = confirm('Are you sure to clean the cart ?'); //å¼¹å‡ºç¡®è®¤æ¡†
	            if (con) {
	                for (var i = 0; i < tr.length; i++) {
	                        tr[i].parentNode.removeChild(tr[i]); // åˆ é™¤ç›¸åº”èŠ‚ç‚¹
	                        i--; //å›žé€€ä¸‹æ ‡ä½ç½®
	                }
	            }
			
	        
	        getTotal(); //æ›´æ–°æ€»æ•°
	    }

		//post removeAll to back
		//function cleanCart(){
//	        $.ajax({
//	            url:"cleanCart",
//				type: "post",
//				data:'{"productName": pName}',
//				success:function(){
//				}
//	        })
		
		//+ 
	 	$(document).ready(function(){
	     $(".count").on("click",'.add',function(){
	       var pName = $(this).attr('id');
	 		 $.ajax({
	            url:"AddToCart",
	 			type: "GET",
	 			data:{"productName": pName},
	 			success:function(result, testStatus){
	 			
	 			}     
	         })
	     });
	});

	 	//-
	$(document).ready(function(){
	     $(".count").on("click",'.reduce',function(){
	       var pName = $(this).attr('id');
	 		 $.ajax({
	            url:"RemoveFromCart",
	 			type: "GET",
	 			data:{"productName": pName},
	 			success:function(result, testStatus){
	 					
	 			}     
	         })
	     });
	});

		

	 	//åˆ é™¤å•è¡Œ    
	$(document).ready(function(){
	     $(".operation").on("click",'.delete',function(){
	       var pName = $(this).attr('id');
	 		 $.ajax({
	             url:"RemoveAllFromCart",
	 			type: "GET",
	 			data:{"productName": pName},
	 			success:function(result, testStatus){
	 				var conf = confirm('are you sure to delete?');
	                     if (conf) {
	                         this.parentNode.removeChild(this);
	                     }
	 			}     
	         })
	     });
	});

		
	    // é»˜è®¤å…¨é€‰
	    checkAllInputs[0].checked = true;
	    checkAllInputs[0].onclick();
	}



	
	
	</script>
	
</body>
</html>