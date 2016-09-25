package com.niit.Backend.dao;

import java.util.List;

import com.niit.Backend.model.Cart;

public interface CartDAO {
	public List<Cart> list();

	public List<Cart> get(int userId);
	
	public Cart getitem(int cartId);

	public void saveOrUpdate(Cart cart);

	public void delete(int userId);
	
	public long CartPrice(int userId);	
	
	public Cart getitem(int productid,int userId);
	
	public long cartsize(int userId);
	
	public void pay(int userId);	
	 
}
