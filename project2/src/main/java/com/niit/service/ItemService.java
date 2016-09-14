package com.niit.service;

import java.util.List;

import com.niit.model.Item;

public interface ItemService {


	  public boolean addItem(Item item);
	    public void updateItem(Item item);
	    public Item getItem(int id);
	    public void deleteItem(int id);
	    public List<Item> getAllItems();
	
}
