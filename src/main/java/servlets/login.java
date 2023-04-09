package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import dao.UserDao;
import entities.User;
import helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
public class login extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		try{
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		//validations
		
		//Authentication
		UserDao userdao=new UserDao(FactoryProvider.getFactory());
		User user=userdao.getUserByEmailAndPasswors(email, password);
		//System.out.println(user);
		HttpSession session=request.getSession();
		
		
		if(user==null) {
			session.setAttribute("message","Invalid Email and Password");
			response.sendRedirect("login.jsp");
			
		}else {
			session.setAttribute("current-user",user);
			if(user.getUser_type().equalsIgnoreCase("admin")) {
			response.sendRedirect("admin.jsp");
			}else if(user.getUser_type().equalsIgnoreCase("normal")) {
				session.setAttribute("message","Welcome "+user.getUser_name());
				response.sendRedirect("index.jsp");
			}else {
				out.println("We dont Identify you");
			}
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
