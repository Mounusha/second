package com.niit.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.niit.models.Users;
import com.niit.service.UsersServiceDAO;

@RestController
public class UsersRest {

	@Autowired
	UsersServiceDAO usersServiceDAO;
	
	@RequestMapping(value = ("/Register"), method = RequestMethod.POST)
	public void RegisterUser(@RequestBody Users users) 
	{
		usersServiceDAO.UserRegistration(users);
	}
}
