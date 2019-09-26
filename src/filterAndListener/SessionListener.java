package filterAndListener;


import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;



@WebListener
public class SessionListener implements HttpSessionListener {

private static int counter;
    
    public static  int getCounter()
    {
    	 return counter;        
    }
    public void sessionCreated(HttpSessionEvent se)  { 
    	System.out.println("build session");
         counter++;
    }

    public void sessionDestroyed(HttpSessionEvent se)  { 
    	ServletContext sc=se.getSession().getServletContext();
    	String username=(String) se.getSession().getAttribute("username");
    	sc.removeAttribute(username);
    	
    	counter--;
    }
	
}
