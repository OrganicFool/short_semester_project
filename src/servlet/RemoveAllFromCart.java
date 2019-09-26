package servlet;

import java.io.IOException;
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
 * Servlet implementation class RemoveAllFromCart
 */
@WebServlet("/RemoveAllFromCart")
public class RemoveAllFromCart extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*接收参数：
		 * 键：productName
		 * */
		String username=(String)request.getSession().getAttribute("username");
		Cart cart=(Cart)request.getSession().getAttribute("cart");
		CartDao dao= new CartDao();
		String name=request.getParameter("productName");
		
		assert username==null||cart==null||name==null;
		
		Commodity commodity=new CommodityDao().getCommodityByName(name);
		
		int num=cart.removeAll(commodity);
		CartDao cartDao=new CartDao();
		cartDao.removeAllFromCart(username, commodity);
		
		System.out.println(username+" remove all "+num+" "+name+" from his cart");
		
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
