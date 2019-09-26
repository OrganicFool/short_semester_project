package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.UserDao;

/**
 * Servlet implementation class ChangeUserInfo
 */
@WebServlet("/ChangeUserInfo")
public class ChangeUserInfo extends HttpServlet {

       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		String phone=request.getParameter("phone");
		String password=request.getParameter("password");
		
		UserDao userDao=new UserDao();
		int flag=userDao.update(username, password, address, email, phone);
		
		response.sendRedirect("xia.html");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
