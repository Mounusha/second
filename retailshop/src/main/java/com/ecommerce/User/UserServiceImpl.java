package com.ecommerce.User;
import com.ecommerce.model.UserDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserServiceInterface{

	@Autowired
	UserDAOImpl usrDAO;

	public void addUser(UserDetails user){
		usrDAO.addUser(user);
	}

	public UserDetails checkUser(UserDetails user){
		return usrDAO.checkUser(user);
	}
}