package servlet;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

import bean.Cart;
import bean.CartElement;
import bean.Commodity;

/**
 * Servlet implementation class ShowCart
 */
@WebServlet("/ShowCart")
public class ShowCart extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cart cart=(Cart)request.getSession().getAttribute("cart");
		String username=(String)request.getSession().getAttribute("username");
		System.out.println(username);
		
		Gson gson = new Gson();
		List<CartElement> ans=cart.getCart();
		String returnValue="";
		if (!ans.isEmpty()) {
			returnValue=gson.toJson(ans);
		}
		
		/*
		 * 返回类型：json数组
		 * 键1：num：int
		 * 键2：Id：String
		 * 键3：price：float
		 * 键4：name：String
		 * 键5：category：String
		 * 每个小数组会包含一个
		 */
		System.out.println(returnValue);
		
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().append(returnValue);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
