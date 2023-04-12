package servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import dao.CategoryDao;
import dao.ProductDao;
import entities.Category;
import entities.Product;
import helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@MultipartConfig
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
			String pName=request.getParameter("pName");
			String pDescription=request.getParameter("pDescription");
			int pPrice=Integer.parseInt(request.getParameter("pPrice"));
			int pQuantity=Integer.parseInt(request.getParameter("pQuantity"));
			int pDiscount=Integer.parseInt(request.getParameter("pDiscount"));
			int catId=Integer.parseInt(request.getParameter("catId"));
			Part part=request.getPart("pPic");
			
			Product p=new Product();
			p.setpName(pName);
			p.setpDesc(pDescription);
			p.setpPrice(pPrice);
			p.setpPhoto(part.getSubmittedFileName());
			p.setpQuantity(pQuantity);
			p.setpDiscount(pDiscount);
		  //get category by ID
			CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
			Category category=cdao.getCategoryById(catId);
			
			p.setCategory(category);
			
			//product save
			ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
			pdao.saveProduct(p);
			//save(upload) picture
			
			
			//find path to upload image
			
			String path = getServletContext().getRealPath("/img")+File.separator+"products"+File.separator+part.getSubmittedFileName();
			System.out.println(path);
			//uploading code
			FileOutputStream fos=new FileOutputStream(path);
			InputStream is=part.getInputStream();
			//reading data
			byte[]data=new byte[is.available()];
			is.read(data);
			//writing data
			fos.write(data);
			fos.close();
			//
			
			
			httpsession.setAttribute("message","Product Added Successfully");
			response.sendRedirect("admin.jsp");
			return;
			
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
