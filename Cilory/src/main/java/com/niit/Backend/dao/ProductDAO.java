package com.niit.Backend.dao;
import java.util.List;
import com.niit.Backend.model.*;


public interface ProductDAO {
	public List<Product> list();
	public Product get(int id);
	public void saveorUpdate(Product product);
	public void delete(int id);
    public List<Product> getcatitem(int id);
	
	public List<Product> Homelist();
	
	public List<Product> getindividual(int id);
	

}
