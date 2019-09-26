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
import bean.Engine;

/**
 * Servlet implementation class ViewProductDetails
 */
@WebServlet("/ViewProductDetails")
public class ViewProductDetails extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String product = (String)request.getParameter("productName");
		System.out.println(product);
		
		CommodityDao commodityDao=new CommodityDao();
		ArrayList<Commodity> ans=commodityDao.filter("select * from product where productName= '"+product+"' ;");
		Commodity commodity=ans.get(0);
		
		Engine engine=new Engine();
		ArrayList<String> recommendStrings=engine.recommendCommoditiesByCommodity(product);
		
		ArrayList<Commodity> recommendCommodities=new ArrayList<Commodity>();
		for(String temp:recommendStrings) recommendCommodities.add(commodityDao.getCommodityByName(temp));
		
		request.setAttribute("recommend", recommendCommodities);
		
		request.getRequestDispatcher("single.jsp?productName="+commodity.getName()+"&category="+commodity.getCategory()+"&price="+Float.toString(commodity.getPrice())).forward(request, response);;
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
