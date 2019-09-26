package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.Connecter;

/**
 * Servlet implementation class AddToLike
 */
@WebServlet("/AddToLike")
public class AddToFollowing extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connecter connecter=new Connecter();
		int flag=0;
		String username=(String) request.getSession().getAttribute("username");
		/*接收格式：字符串（商品id）*/
		String categordId=request.getParameter("categoryId");
		String check ="Select from followed where username = '"+username+"' and categoryId = '"+categordId+"' ;";
		if( connecter.query(check).isEmpty()){
			/*未添加过*/
			String add="insert into followed value ('"+username+"','"+categordId+"');";
			flag=connecter.insert(add);
			System.out.println("user "+username+" add "+categordId+" to his following");
		}
		else {
			/*已经添加过了*/
			flag = -2;
		}
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().append(Integer.toString(flag));
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
