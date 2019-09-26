package filterAndListener;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.bcel.internal.generic.NEW;

import bean.Cart;
import bean.CartDao;
import bean.UserDao;


@WebFilter({ "/index.jsp" })
public class LoginFilter implements Filter {

   
   
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		
		String username="";
		String password="";
		
		UserDao userDao=new UserDao();
		if(req.getCookies()!=null) {
		for(Cookie c:req.getCookies()){
			if(c.getName().equals("username")) username=c.getValue();
			if(c.getName().equals("password")) username=c.getValue(); 
		}
		int state=userDao.Login(username, password);
		if(state==1) 
			if (req.getSession().getServletContext().getAttribute(username)==null) {
				req.getSession().setAttribute("username", username);
				
				CartDao cartDao=new CartDao();
				Cart cart=cartDao.getCartFromSql(username);
				req.getSession().setAttribute("cart",cart);
				
			}
		
		}
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
