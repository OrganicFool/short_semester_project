package servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Cart;
import bean.CartDao;
import bean.UserDao;


@WebServlet("/Login")
public class Login extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*½ÓÊÜ¸ñÊ½£ºurlÓ³Éä£¨×Ö·û´®£©
		 * ¼ü1£ºusername
		 * ¼ü2£ºpassword*/
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		UserDao lDao=new UserDao();
		int ans=lDao.Login(username, password);
		
		if (ans==1) {
			ServletContext sc =request.getSession().getServletContext();
			if(sc.getAttribute(username)==null) {
				
			CartDao cartDao=new CartDao();
			Cart cart=cartDao.getCartFromSql(username);
			request.getSession().setAttribute("username", username);
			request.getSession().setAttribute("cart", cart);
			
			
			sc.setAttribute(username, request.getSession().getId());
			Cookie cookie = new Cookie("JSESSIONID", request.getSession().getId());
	        cookie.setPath(request.getContextPath()+"/");
	        cookie.setMaxAge(30*60);
	        response.addCookie(cookie);
			System.out.println("autologin: "+request.getParameter("autologin"));
			if("on".equals(request.getParameter("autologin"))) { 
				
				int saveTime =12*60*60; 
				Cookie user_cookie = new Cookie("username", username);
				user_cookie.setMaxAge(saveTime); 
				user_cookie.setPath("/");
				response.addCookie(user_cookie); 
				response.sendRedirect("success.html");
				}
			else {
				response.sendRedirect("success.html");
			}
			}
			else {
				response.sendRedirect("somebodyHasLogin.html");
			}
		
	}else {
		response.sendRedirect("loginWrong.html");
	}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
