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


@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*接受内容：字符串
		 * 键：productName
		 * */
		String username=(String)request.getSession().getAttribute("username");
		Cart cart=(Cart)request.getSession().getAttribute("cart");
		String name=request.getParameter("productName");
		assert username==null||cart==null||name==null;
		assert username.contentEquals("null")||name.contentEquals("null");
		System.out.println(username+" "+name);
		
		Commodity commodity=new CommodityDao().getCommodityByName(name);
		
		System.out.println(request.getSession().getAttribute("username")+" add a "+name+" to his cart");
		
		cart.add(commodity, 1);	
		CartDao cartDao=new CartDao();
		cartDao.addToCart(username, commodity, 1);
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().append("1");
		/*如果成功，回传值为1*/
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
