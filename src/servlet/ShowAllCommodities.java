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

/**
 * Servlet implementation class ShowAllCommodities
 */
@WebServlet("/ShowAllCommodities")
public class ShowAllCommodities extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommodityDao commodityDao=new CommodityDao();
		ArrayList<Commodity> ans=commodityDao.filter("select * from product ;");
		
		Gson gson=new Gson();
		String returnValue=gson.toJson(ans);
		
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().append(returnValue);
		
		
		
		/*返回格式：request中的参数
		 * 键名：数据库中的product对象
		 * */
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
