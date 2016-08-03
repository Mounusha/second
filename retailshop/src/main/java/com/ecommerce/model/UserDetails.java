package com.ecommerce.model;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;

@Entity
@Table(name="UserDetails")
public class UserDetails {
	
	@Id
	private int userid;
	private String userrole;
	private String username;
	private String email; 
	
	public UserDetails(){}
	
	public UserDetails(int userid,String userrole,String username,String email){
		this.userid = userid;
		this.userrole = userrole;
		this.username = username;
		this.email = email;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}
	
	public String getUserrole() {
		return userrole;
	}

	public void setUserrole(String userrole) {
		this.userrole = userrole;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}