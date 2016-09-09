package com.niit.service;

import org.springframework.stereotype.Service;

import com.niit.models.Users;

@Service
public interface UsersServiceDAO {

	public void UserRegistration(Users users);
}
