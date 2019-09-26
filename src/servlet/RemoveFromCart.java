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


@WebServlet("/RemoveFromCart")
public class RemoveFromCart extends HttpServlet {
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*接受格式同addtocart
		 * */
		String username=(String)request.getSession().getAttribute("username");
		Cart cart=(Cart)request.getSession().getAttribute("cart");
		String name=request.getParameter("productName");
		
		assert username==null||cart==null||name==null;

		CartDao dao= new CartDao();
		Commodity commodity=(new CommodityDao()).getCommodityByName(name);
		System.out.println(username+"remove a "+name+" from his cart");
		cart.remove(commodity, 1);
		
		CartDao cartDao=new CartDao();
		cartDao.addToCart(username, commodity, 1);
		
		response.getWriter().append("1");
		/*发送格式同addtocart*/
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
