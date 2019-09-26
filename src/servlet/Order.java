package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import bean.Cart;
import bean.CartDao;
import bean.CartElement;
import bean.Check;
import bean.CheckDao;


@WebServlet("/Order")
public class Order extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 老版本：直接结算全部购物车
		 * 不传值，直接使用session中的购物车
		 */
		String username=(String)request.getSession().getAttribute("username");
		Cart cart=(Cart)request.getSession().getAttribute("cart");
		
		
		/*新版本：使用购物车选择来进行页面结算
		 * 所传值为json数组，形如cartElement*/
		
//		String username=(String)request.getSession().getAttribute("username");
//		String jsonArray=request.getParameter("这里前台给定一个名称");
//		System.out.println(jsonArray);
		
		
		/*处理json数据*/
//		Gson gson =new Gson();
//		ArrayList<CartElement> cartElements=gson.fromJson(jsonArray,  new TypeToken<List<Check>>() {}.getType());
//		Cart cart=new Cart(cartElements);
		
		CheckDao checkDao=new CheckDao();
		
		/*生成新订单*/
		Check check=new Check(username,cart);
		int flag=checkDao.checkToSql(check);
		
		/*存入详细信息*/
		CartDao cartDao=new CartDao();
		cartDao.orderCart(cart, username, check.getOrderID());
		
		/*清空当前购物车*/
		cartDao.clean(username);
		cart.clean();
		
		System.out.println("user "+username+" has ordered something with orderid "+check.getOrderID());
		response.sendRedirect("successfulBuying.html");/*此跳转页尚未加入*/
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
