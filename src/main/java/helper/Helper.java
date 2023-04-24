package helper;

import java.util.HashMap;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class Helper {
public static String get10Words(String desc) {
	String[] strs=desc.split("");
	if(strs.length>10) {
		String res="";
		for(int i=0;i<10;i++) {
			res=res+strs[i]+"";
		}
		return (res+"..");
	}else {
		return(desc+"..."); 
				
	}
	
}
public static Map<String,Long> getCount(SessionFactory factory) {
	Session s=factory.openSession();
	String q1="Select count(*)from User";
	String q2="Select count(*)from Product";
	Query qu1=s.createQuery(q1);
	Query qu2=s.createQuery(q2);
	 Long userCount=(Long)qu1.list().get(0);
	 Long productCount=(Long)qu2.list().get(0);
	 
	Map<String,Long>map=new HashMap<>();
	map.put("userCount", userCount);
	map.put("productCount", productCount);
	
	s.close();
	return map;
}
}
