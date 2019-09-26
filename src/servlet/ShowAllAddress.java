package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.UserDao;


@WebServlet("/ShowAllAddress")
public class ShowAllAddress extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=(String)request.getSession().getAttribute("username");
		UserDao userDao=new UserDao();
		ArrayList<String> ans=userDao.selectAllAddress(username);
		
		/*返回类型：字符串，地址之间使用逗号分隔，使用split分离即可*/
		String returnValue="";
		for(String temp:ans) {
			returnValue=returnValue+ans+",";
		}
		response.getWriter().append(returnValue);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
