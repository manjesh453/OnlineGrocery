package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import org.hibernate.Session;
import org.hibernate.Transaction;

import entities.User;
import helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class register extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	PrintWriter out=response.getWriter();
	HttpSession session=request.getSession();
	
	try {
		String userName=request.getParameter("user_name");
		String userEmail=request.getParameter("email");
		String userpassword=request.getParameter("password");
		String userPhone=request.getParameter("phone");
		String userAddress=request.getParameter("address");
		//validation
		if(userName.isEmpty()) {
			out.println("Empty name");
			return;
		}
		if(userpassword.length()<8) {
		out.println("Password must be greater then 8 character");
		return;
		}
		boolean isValid=validateEmail(userEmail);
		if(isValid=false) {
			out.println("Email must be in proper formate");
			return;
			
		}
		
		
		//creating user obj to store data
		
			User user=new User(userName,userEmail,userpassword,userPhone,"default.jpg",userAddress,"normal");
			Session hibernatesession=FactoryProvider.getFactory().openSession();
			Transaction tx=hibernatesession.beginTransaction();
			hibernatesession.save(user);
			
			
			tx.commit();
			hibernatesession.close();
			session.setAttribute("message","Sign Up successfull");
			response.sendRedirect("login.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	private boolean validateEmail(String userEmail) {
		  return userEmail != null && userEmail.matches("[a-zA-Z0-9]+@[a-zA-Z0-9]+\\.[a-zA-Z0-9]+");
		    }

}
