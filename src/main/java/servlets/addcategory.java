package servlets;

import java.io.IOException;

import dao.CategoryDao;
import entities.Category;
import helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class addcategory extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession httpsession=request.getSession();
		try {
		String op=request.getParameter("addcate");	
		if(op.trim().equals("addcategory")) {
			String title=request.getParameter("catTitle");
			String description=request.getParameter("catDescription");
			 Category category=new Category();
			category.setCategoryTitle(title);
			category.setCategoryDescription(description);
			//save category in database
			CategoryDao categorydao=new CategoryDao(FactoryProvider.getFactory());
			int catId=categorydao.saveCategory(category);
			httpsession.setAttribute("message","Category Added Successfully");
			response.sendRedirect("admin.jsp");
			return;
			
			
			
		}else if(op.trim().equals("addproduct")) {
			
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
