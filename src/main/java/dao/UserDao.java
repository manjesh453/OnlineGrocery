package dao;

import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import entities.User;

public class UserDao {
    private SessionFactory factory;

	public UserDao(SessionFactory factory) {
		this.factory = factory;
	}
    //get user by email and password
	public User getUserByEmailAndPasswors(String email,String password) {
		User user=null;
		try {
			String query="from User where user_email=:e and user_password=:p";
			Session session=this.factory.openSession();
		Query q=session.createQuery(query);
			q.setParameter("e",email);
			q.setParameter("p",password);
			user=(User)((org.hibernate.query.Query)q).uniqueResult();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return user;
	}
}
