package com.ecommerce.service;

import com.ecommerce.DAOController.ProductDAO;
import com.ecommerce.model.ProductModel;
import java.util.*;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional 
public class PdtServiceImpl implements PdtService {

	@Autowired
	ProductDAO ProductDAO;

	public void addProduct(ProductModel Product) {
		ProductDAO.addProduct(Product);		
	}

	public void updateProduct(ProductModel Product) {
		ProductDAO.updateProduct(Product);
	}

	public ProductModel getProduct(int id) {
		System.out.println("Service Implementation : "+id);
		return ProductDAO.getProduct(id);
	}

	public void deleteProduct(int id) {
		ProductDAO.deleteProduct(id);
	}

	@SuppressWarnings("rawtypes")
	public List getProducts() {
		System.out.println("Service Implementation");
		return ProductDAO.getAllProducts();
	}
	
	public ProductModel getRowById(int id){
		return ProductDAO.getRowById(id); 
	}
}