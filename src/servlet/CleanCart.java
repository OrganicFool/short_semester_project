package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Cart;
import bean.CartDao;

/**
 * Servlet implementation class CleanCart
 */
@WebServlet("/CleanCart")
public class CleanCart extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=(String)request.getSession().getAttribute("username");
		Cart cart=(Cart)request.getSession().getAttribute("cart");
		cart.clean();
		
		CartDao cartDao=new CartDao();
		cartDao.clean(username);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
