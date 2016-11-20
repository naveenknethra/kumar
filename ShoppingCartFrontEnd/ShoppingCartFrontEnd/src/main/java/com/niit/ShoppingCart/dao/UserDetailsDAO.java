package com.niit.ShoppingCart.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.niit.ShoppingCart.model.UserDetails;

@Repository("userDetailsDAO")
public interface UserDetailsDAO {

	// Declare of CURDS Operations
	
				public boolean save(UserDetails userDetails);
				public boolean update(UserDetails userDetails);
				public boolean delete(UserDetails userDetails);
				public  UserDetails get(int id);
				public  List<UserDetails>   list();
				public UserDetails isValidUser(String name, String password);
				public UserDetails getByName(String name);
}
