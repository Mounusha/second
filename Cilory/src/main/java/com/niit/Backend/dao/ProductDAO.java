package com.niit.Backend.dao;
import java.util.List;
import com.niit.Backend.model.*;


public interface ProductDAO {
	public List<Product> list();
	public Product get(String id);
	public void saveorUpdate(Product product);
	public void delete(String id);
	

}
