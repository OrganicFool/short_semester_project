package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.User;
import bean.UserDao;


@WebServlet("/Regist")
public class Regist extends HttpServlet {
	

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String address=request.getParameter("address");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String confirm=request.getParameter("confirm");
		
		assert username==null||password==null||address==null||email==null||phone==null||confirm==null;
		
	
		UserDao registDao=new UserDao();
		PrintWriter writer=response.getWriter();
		
		if(username.length()>10||username.length()<5) {
			writer.append("illegal username!");
		}
		else if(!User.isEmail(email)){
			writer.append("Wrong E-mail format!");
		}
		else if(!User.checkPassword(password)) {
			
			writer.append("Please confirm that your password matches the format!");
		}
		else if(!password.contentEquals(confirm)) {
			writer.append("Your confirm password must be the same as your password!");
		}
		else {
		int flag=registDao.register(username, password, phone, address, email);
		if(flag>0) {
			writer.append("Congratulations! successfully regist!");
		}
		else if (flag==-1){
			writer.append("duplicated phone number!");
		}
		else if(flag==-2) {
			writer.append("duplicated username!");
		}
		else if(flag==-3) {
			writer.append("duplicated e-mail!");
		}
	}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
