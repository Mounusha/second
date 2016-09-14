package com.niit.dao;

import java.util.List;

import com.niit.model.Item;

public interface ItemDAO {

	  public void addItem(Item item);
	    public void updateItem(Item item);
	    public Item getItem(int id);
	    public void deleteItem(int id);
	    public List<Item> getAllItems();
	 
	
}
