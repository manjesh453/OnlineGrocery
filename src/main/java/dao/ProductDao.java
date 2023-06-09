package dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entities.Product;

public class ProductDao {
     private SessionFactory factory;
     
     public ProductDao(SessionFactory factory) {
    	 this.factory=factory;
    	 
     }
     //get all products
     public List<Product> getAllProducts(){
    	Session s= factory.openSession();
    	Query query=s.createQuery("from Product");
    	List<Product>list=query.getResultList();
    	return list;
     }
     public boolean saveProduct(Product product) {
    	 boolean f=false;
    	 try {
    		 Session session=this.factory.openSession();
    		 Transaction tx=session.beginTransaction();
    		 session.save(product);
    		 
    		 tx.commit();
    		 session.close();
    		 f=true;
    		 
    	 }catch(Exception e) {
    		e.printStackTrace(); 
    		f=false;
    	 }
    	 return f;
     }
   //get all as per id of category
     public List<Product> getAllProductsById(int cid){
    	Session s= this.factory.openSession();
    	Query query=s.createQuery("from Product as p where p.category.categoryid=:id");
    	query.setParameter("id", cid);
    	List<Product>list=query.getResultList();
    	 System.out.println(list);
    	return list;
     }
}
