package com.ecommerce.DAOController;

import java.util.*;
import com.ecommerce.model.ProductModel;

public interface ProductInterface {

	public void addProduct(ProductModel pm);

	public void updateProduct(ProductModel pm);
	public void deleteProduct(int id);
	
	public ProductModel getProduct(int id);
	public List<ProductModel> getAllProducts();
	
	public ProductModel getRowById(int id); 
	
	//public List<ProductModel> getProduct(String name);
	
}
