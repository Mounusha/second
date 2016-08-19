package com.niit.Backend.dao;

import java.util.List;

import com.niit.Backend.model.Cart;

public interface CartDAO {

	public List<Cart> list();

	public List<Cart> get(int userId);

	public void saveOrUpdate(Cart cart);

	public void delete(int userId);
	
	public long CartPrice(int userId);
	
}
