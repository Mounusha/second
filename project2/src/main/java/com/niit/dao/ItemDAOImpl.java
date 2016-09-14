package com.niit.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.niit.model.Item;


@Repository("itemDA0")
public class ItemDAOImpl implements ItemDAO {

	public void addItem(Item item) {
		// TODO Auto-generated method stub
		
	}

	public void updateItem(Item item) {
		// TODO Auto-generated method stub
		
	}

	public Item getItem(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public void deleteItem(int id) {
		// TODO Auto-generated method stub
		
	}

	public List<Item> getAllItems() {
		// TODO Auto-generated method stub
		return null;
	}
}


	/*@Autowired 
	private SessionFactory sessionFactory;
	
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	

	public void addItem(Item item) {
		 Session session=sessionFactory.getCurrentSession();
		   Transaction trans=session.beginTransaction();
		   session.saveOrUpdate(item);
		   trans.commit();
		}
	
	
	public void updateItem(Item item) {
		Item itemToUpdate = getItem(item.getId());
		itemToUpdate.setName(item.getName());
		itemToUpdate.setDescription(item.getDescription());
		itemToUpdate.setPrice(item.getPrice());
		 Session session=sessionFactory.getCurrentSession();
		   Transaction trans=session.beginTransaction();
		   session.saveOrUpdate(item);
		   trans.commit();
		
	
         
    }
		

	public Item getItem(int id) {
		
		Session session=sessionFactory.getCurrentSession();
		   Transaction trans=session.beginTransaction();
		   Item item=(Item)session.get(Item.class, id);
		   trans.commit();
	        return item;
	}

	public void deleteItem(int id) {
		Session session=sessionFactory.openSession();
		Transaction trans=session.beginTransaction();
		 Item item = getItem(id);
	        if (item != null)
	        session.delete(item);
	    
	        trans.commit();
	}

	@SuppressWarnings("unchecked")
	public List<Item> getAllItems() {
		Session session=sessionFactory.getCurrentSession();
		   Transaction trans=session.beginTransaction();
		 List<Item> list=  session.createQuery("from Item").list();
		   trans.commit();
		   return list;
	}

}
*/