package servlet;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Cart;
import bean.CartDao;
import bean.Commodity;
import bean.CommodityDao;

/**
 * Servlet implementation class AddToCartFromShop
 */
@WebServlet("/AddToCartFromShop")
public class AddToCartFromShop extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=(String)request.getSession().getAttribute("username");
		Cart cart=(Cart)request.getSession().getAttribute("cart");
		String name=request.getParameter("name");
		String amountString=request.getParameter("amount");
		int amount;
		if(amountString==null||amountString.contentEquals("null"))  amount=1;
		else  amount=Integer.parseInt(amountString);
		
		assert username==null||cart==null||name==null;
		
		if(username==null) response.sendRedirect("stillNotLogin.html");
		else {
		
//		Map paramMap = request.getParameterMap();
//		Iterator<String> iterator=paramMap.keySet().iterator();
//		while(iterator.hasNext()) {
//			String tempString=iterator.next();
//			System.out.println(tempString+":"+paramMap.get(tempString));
//		}
//		System.out.println(name);
		Commodity commodity=new CommodityDao().getCommodityByName(name);
		System.out.println(request.getSession().getAttribute("username")+" add "+amount+" "+name+" to his cart");
		
		cart.add(commodity, amount);	
		CartDao cartDao=new CartDao();
		cartDao.addToCart(username, commodity, amount);
		
		response.sendRedirect("cart.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
