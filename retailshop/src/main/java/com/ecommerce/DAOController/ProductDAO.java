package com.ecommerce.DAOController;

import org.hibernate.Query;
import com.ecommerce.model.ProductModel;

import java.util.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;


public class ProductDAO implements ProductInterface{

	List<ProductModel> products;
	
	public ProductDAO() 
	{	}
	
	@Autowired
	private SessionFactory sessionFactory;

	/*private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
*/
	public void addProduct(ProductModel pm) 
	{
		Session s=sessionFactory.getCurrentSession();
		s.saveOrUpdate(pm);
	}

	public void updateProduct(ProductModel pm) {
		Session sessionUpd = sessionFactory.openSession();
	    Transaction tx = (Transaction) sessionUpd.beginTransaction();
	    sessionUpd.saveOrUpdate(pm);
	    tx.commit();	    
	    sessionUpd.close();		
	}

	public void deleteProduct(int id) {
		Session sessionDel = sessionFactory.openSession();
		Transaction tx = sessionDel.beginTransaction();
		ProductModel pm = (ProductModel) sessionDel.load(ProductModel.class, id);
		sessionDel.delete(pm);
	    tx.commit();
	    sessionDel.close();
	}

	public ProductModel getProduct(int id) {
		System.out.println("DAO Implementation : "+id);
		Session ss = sessionFactory.getCurrentSession(); 
		ProductModel pm = (ProductModel) ss.get(ProductModel.class, id);
		//ss.flush();
		return pm;
	}
	
	public ProductModel getRowById(int id) {
		Session ses = sessionFactory.openSession();
		ProductModel pm = (ProductModel) ses.load(ProductModel.class, id);
	    return pm;
	} 
	
	@SuppressWarnings("unchecked")
	public List<ProductModel> getAllProducts()
	{
		System.out.println("DAO Implementation");
		Session ss1 = sessionFactory.openSession();
		Query qry = ss1.createQuery("from ProductModel");
		System.out.println(qry.toString());
		products = (List<ProductModel>)qry.list();
		return products;
	}
}