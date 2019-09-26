package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Logout")
public class Logout extends HttpServlet {
   
   
  

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=(String)request.getSession().getAttribute("username");
		for(Cookie cookie:request.getCookies()) {
			if(cookie.getName().equals("username")) {
				Cookie c=new Cookie("username", null);
				c.setPath("/");
				c.setMaxAge(0);
				response.addCookie(c);
			}
		}
		request.getSession().invalidate();
		response.sendRedirect("logout.html");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
