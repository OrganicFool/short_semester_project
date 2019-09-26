package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.UserDao;

@WebServlet("/Me")
public class Me extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=(String)request.getSession().getAttribute("username");
		if(username==null) {response.sendRedirect("stillNotLogin.html");}
		else{UserDao user=new UserDao();
		String[] ans=user.getUserInfo(username);
		request.setAttribute("phone", ans[0]);
		request.setAttribute("email", ans[1]);
		request.setAttribute("address", ans[2]);
		request.setAttribute("password", ans[3]);
		request.getRequestDispatcher("personalInfo.jsp").forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
