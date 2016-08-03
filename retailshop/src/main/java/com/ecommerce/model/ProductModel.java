package com.ecommerce.model;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;

@Entity
@Table(name="ProductModel")
public class ProductModel {
	
	@Id	
	private int pid;
	private String pname;
	private String pdesc;
	private int price;
	public ProductModel(){} 
	
	public ProductModel(int pid,String pname,String pdesc,int price)
	{
		this.pid = pid;
		this.pname = pname;
		this.pdesc = pdesc;
		this.price = price;
	}
	
	public void setPid(int pid){ 
		this.pid = pid;
	}
	
	public int getPid(){
		return pid;
	}
	
	public void setPname(String pname){
		this.pname = pname;
	}
	
	public String getPname(){
		return pname;
	}
	
	public void setPdesc(String pdesc){
		this.pdesc = pdesc;
	}
	
	public String getPdesc(){
		return pdesc;
	}
	
	public void setPrice(int price){
		this.price = price;
	}
	
	public int getPrice(){
		return price;
	}
}