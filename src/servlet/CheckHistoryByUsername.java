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

import bean.Cart;
import bean.CartDao;
import bean.Check;
import bean.CheckDao;


@WebServlet("/CheckHistoryByUsername")
public class CheckHistoryByUsername extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*业务数据层*/
		String username=(String)request.getSession().getAttribute("username");
		if(username==null) response.sendRedirect("stillNotLogin.html");
		else {
		CheckDao checkDao=new CheckDao();
		List<Check> checkList=checkDao.checkHistoryByUsername(username);
		
		CartDao cartDao=new CartDao();
		List<Cart> cartList=new ArrayList<Cart>();
		
		
		for(Check check:checkList) {
			String orderId=check.getOrderID();
			cartList.add(cartDao.getCartFromOrder(orderId));
		}
		
		
		
		/*操作json数组*/
//		Gson gson=new Gson();
//		String ans=gson.toJson(checkList);
//		gson.fromJson(username,  new TypeToken<List<Check>>() {}.getType());// 此句为解析之用
		
		/*返回格式：json数组
		 * 键：check的所有属性*/
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		request.setAttribute("checkList", checkList);
		request.setAttribute("cartList", cartList);
		request.getRequestDispatcher("history.jsp").forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
