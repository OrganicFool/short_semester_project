package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import bean.Commodity;
import bean.CommodityDao;


@WebServlet(asyncSupported = true, urlPatterns = { "/Select" })
public class Select extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*接受json格式：
		 * 键1：priceHigh
		 * 键2：priceLow
		 * 键3：category
		 * 
		 * */
		StringBuffer price =new StringBuffer(request.getParameter("price")); 
		String category =request.getParameter("category");
		String order =request.getParameter("order");
		if(category==null) category="all";
		if(order==null)   order="none";
		                   
		//将字符串形如  “$1360 - $7506”  中的两个数字提出来（两个值范围都是0-8000
		int i=price.indexOf("$");
		String priceLow=price.substring(i+1, i+5).replace('-',' ');
		String priceHigh =price.substring(i+2);
		i=priceHigh.indexOf("$");
		priceHigh=priceHigh.substring(i+1).trim();
		
		System.out.println(priceHigh+" "+priceLow);
		assert priceHigh==null||priceLow==null||category==null||order==null;
		
		CommodityDao cD=new CommodityDao();
		ArrayList<Commodity> ans=cD.filter(cD.changeToSql(priceLow,priceHigh,category,order));
		request.setAttribute("commodityList", ans);
		
		
		request.getRequestDispatcher("searchResult.jsp?source=select").forward(request, response);
		}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
