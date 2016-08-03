package com.ecommerce.service;

import java.util.*;
import com.ecommerce.model.ProductModel;

public interface PdtService {

	public void addProduct(ProductModel pm);
	
	public void updateProduct(ProductModel pm);
	
	public ProductModel getProduct(int id);
	
	public void deleteProduct(int id);
	
	@SuppressWarnings("rawtypes")
	public List getProducts(); 
	
	public ProductModel getRowById(int id);
}
