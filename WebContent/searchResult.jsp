<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.CommodityDao" %>
<%@page import="java.util.ArrayList" %>
<%@page import="bean.Commodity" %>
<!doctype html>
<html>
<head>
<base target="_blank">
<meta charset="utf-8">
<title>test</title>
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link rel="stylesheet" href="css/shop.css" type="text/css" media="screen" property="" />
	<link href="css/style7.css" rel="stylesheet" type="text/css" media="all" />
	<!-- Owl-carousel-CSS -->
	<link rel="stylesheet" type="text/css" href="css/jquery-ui1.css">
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<!-- font-awesome-icons -->
	<link href="css/font-awesome.css" rel="stylesheet">
	<!-- <script src="js/results.js"></script> -->
</head>

<body onLoad="fun1()">
	<div id="research"></div>
	<%
	String href;
ArrayList<Commodity> ans=(ArrayList<Commodity>)request.getAttribute("commodityList");
String source= (String)request.getParameter("source");
if(source!=null){
	if(source.contentEquals("select")){
	if(ans!=null){
		if(ans.isEmpty()) {out.print("Sorry,there is no match item!");}
		else{
			String line="<div class='product-sec1' id='list'>";
		for(Commodity c:ans){
			//href="AddToCart?Id="+c.getId()+"&type="+c.getName()+"&additional="+c.getCategory()+"&price="+String.valueOf(c.getPrice());
			//out.print("<div class='banner-productSearch-text2'> <img src='#' alt='This is a picture'><p>Type :");
			//out.print(c.getName()+"</p><p>Additional :"+c.getCategory()+"</p><p>Price : "+c.getPrice()+"</p>");
			//out.print("<a class='hvr-bounce-to-right' style='border: 2px solid #99ABD5; border-radius: 10px;' href='waitToDeveloped.html' >Buy</a>");
			//out.print("<a class='hvr-bounce-to-right' style='border: 2px solid #99ABD5; border-radius: 10px;' href='"+href+"' target ='wait' onclick='announce()'>Add To Cart</a></div>");
			line += "<div class='col-md-4 product-men'><div class='product-shoe-info shoe'><div class='men-pro-item'><div class='men-thumb-item'>"
				    +"<img src='images/"+c.getName()+".jpg' alt=''>"
			        +"<div class='men-cart-pro'><div class='inner-men-cart-pro'><a target='blank' href='ViewProductDetails?productName="+c.getName()+"' class='link-product-add-cart'>Quick View</a></div></div>"+"<span class='product-new-top'>New</span></div><div class='item-info-product'><h4><a id='productname1' href='single.html'>"
					+c.getName()
					+"</a></h4>"
					+"<div class='info-product-price'><div class='grid_meta'><div class='product_price'><div class='grid-price '><input  type='hidden' class='money '>$"
					+Float.toString(c.getPrice())
					+"</input></div></div></div>"
					+"<div class='shoe single-item hvr-outline-out'><form action='AddToCartFromShop' target='_blank'><input type='hidden' name='cmd' value='_cart'><input type='hidden' name='add' value='1'><input type='hidden' name='name' value='"
					+c.getName()
					+"'><input type='hidden' name='amount' value='"
					+'1'
					+"'><button type='submit' id='add' onclick='function(){alert('Add to cart successfully !');}' class='shoe-cart pshoe-cart'><i class='fa fa-cart-plus' aria-hidden='true'></form>"
					+"</i>/button>"
					+"<a href='' >"
					+"</a></div></div>"
					+"<div class='clearfix'></div></div></div></div></div>";
		}
		line+="</div>";
		out.print(line);
		
		}
		}
	}
}


%>
	
	<script>
		window.onload = function fun1(){
			var source='<%=request.getParameter("source")%>';
			if(source=='null'){
			
			$.ajax({
				url:"ShowAllCommodities",
				type:"GET",
				success:load
			})
			// var str = '[{categoryId:"2",productName:"dog",category:"electronic",price:"100.0"},{categoryId:"1",productName:"cat",category:"automatic",price:"200.0"},{categoryId:"1",productName:"pig",category:"automatic",price:"150.0"},{categoryId:"1",productName:"fish",category:"automatic",price:"300.0"}]';
			function load(str){
			var jsonList = eval ("("+str+")");
			var line = '<div class="product-sec1" id="list"> ';
			for (var i=0; i< jsonList.length; i++){
				
				line += '<div class="col-md-4 product-men"><div class="product-shoe-info shoe"><div class="men-pro-item"><div class="men-thumb-item">'
					    +'<img src="images/'+jsonList[i].productName+'.jpg" alt="">'
				        +'<div class="men-cart-pro"><div class="inner-men-cart-pro"><a href="ViewProductDetails?productName='+jsonList[i].productName+'" class="link-product-add-cart">Quick View</a></div></div>'+'<span class="product-new-top">New</span></div><div class="item-info-product"><h4><a id="productname1" href="single.html">'
						+jsonList[i].productName
						+'</a></h4>'
						+'<div class="info-product-price"><div class="grid_meta"><div class="product_price"><div class="grid-price "><input  type="hidden" class="money ">$'
						+jsonList[i].price
						+'</input></div></div></div>'
						+'<div class="shoe single-item hvr-outline-out"><form action="AddToCartFromShop" target="_blank"><input type="hidden" name="cmd" value="_cart"><input type="hidden" name="add" value="1"><input type="hidden" name="name" value="'
						+jsonList[i].productName
						+'"><input type="hidden" name="amount" value="'
						+'1'
						+'"><button type="submit" id="add" onclick="function(){alert("Add to cart successfully !");}" class="shoe-cart pshoe-cart"><i class="fa fa-cart-plus" aria-hidden="true"></form>'
						+'</i>/button>'
						+'<a href=" " >'
						+'</a></div></div>'
						+'<div class="clearfix"></div></div></div></div></div>'
			}
			var lineplus = line + '</div>';
			//document.write(lineplus);
			document.getElementById('research').innerHTML=lineplus;

		}

	}
		}
		
		
		
	</script>
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
</body>
</html>
