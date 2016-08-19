package com.niit.Backend.dao;
import java.util.List;
import com.niit.Backend.model.*;


public interface CategoryDAO {
	public List<Category> list();
	public Category get(String id);
	public void saveorUpdate(Category category);
	public void delete(String id);
	

}
