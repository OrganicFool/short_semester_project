
function fun1(data){
			// var str = '[{categoryId:"2",productName:"dog",category:"electronic",price:"100.0"},{categoryId:"1",productName:"cat",category:"automatic",price:"200.0"}]';
			var jsonList = eval ("("+data+")");
			var line = "" ;
			for (var i=0; i< jsonList.length; i++){
				line += '<div class="col-md-4 product-men"><div class="product-shoe-info shoe"><div class="men-pro-item"><div class="men-thumb-item">'
					    +'<img src="images/s1.jpg" alt="">'
				        +'<div class="men-cart-pro"><div class="inner-men-cart-pro"><a href="single.html" class="link-product-add-cart">Quick View</a></div></div>'+'<span class="product-new-top">New</span></div><div class="item-info-product"><h4><a href="single.html">'
						+jsonList[i].productName
						+'</a></h4>'
						+'<div class="info-product-price"><div class="grid_meta"><div class="product_price"><div class="grid-price "><input  type="hidden" class="money ">$'
						+jsonList[i].price
						+'</input></div></div></div>'
						+'<div class="shoe single-item hvr-outline-out"><input type="hidden" name="cmd" value="_cart"><input type="hidden" name="add" value="1"><input type="hidden" name="shoe_item" value="Bella Toes"><input type="hidden" name="amount" value="675.00"><button type="submit" name="add" class="shoe-cart pshoe-cart" onclick="addToCart()"><i class="fa fa-cart-plus" aria-hidden="true">'
						+'</i>/button>'
						+'<a href=" " >'
						+'</a></div></div>'
						+'<div class="clearfix"></div></div></div></div></div>'
			}
			document.write(line);
		}