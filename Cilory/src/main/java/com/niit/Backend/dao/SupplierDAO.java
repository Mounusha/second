package com.niit.Backend.dao;
import java.util.List;
import com.niit.Backend.model.*;


public interface SupplierDAO {
	public List<Supplier> list();
	public Supplier get(int id);
	public void saveorUpdate(Supplier supplier);
	public void delete(int id);
	

}
