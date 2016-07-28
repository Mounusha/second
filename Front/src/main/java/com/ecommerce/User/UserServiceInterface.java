package com.ecommerce.User;

import com.ecommerce.model.UserDetails;


public interface UserServiceInterface {

	public void addUser(UserDetails user);
	
	public UserDetails checkUser(UserDetails user);
}