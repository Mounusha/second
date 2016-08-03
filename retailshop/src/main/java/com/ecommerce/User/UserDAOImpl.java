package com.ecommerce.User;

import com.ecommerce.model.UserDetails;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class UserDAOImpl implements UserDAOInterface {

	@Autowired
	private SessionFactory sessionFactory;

	/*private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	*/
	public void addUser(UserDetails user){
		Session s=sessionFactory.getCurrentSession();
		s.saveOrUpdate(user);
	}
	 
	@SuppressWarnings({ "unchecked", "unused" })
	public UserDetails checkUser(UserDetails user){
		System.out.println(user.getUsername()+" "+user.getEmail());
		String result = "";
		Session ss1 = sessionFactory.openSession();
		Query qry = ss1.createQuery("from UserDetails where username=?");
		qry.setParameter(0, user.getUsername());
		List<UserDetails> lst = (List<UserDetails>)qry.list();
		
		for(UserDetails usr : lst)
	    {
	        System.out.println(usr.getUsername()+" "+usr.getEmail());
	    }
		if(lst.size()>0)
			return lst.get(0);
		else
			return null;			
	}
}