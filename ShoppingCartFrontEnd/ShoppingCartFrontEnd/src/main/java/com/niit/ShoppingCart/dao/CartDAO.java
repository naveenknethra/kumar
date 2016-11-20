package com.niit.ShoppingCart.dao;

import java.util.List;

import com.niit.ShoppingCart.model.Cart;

public interface CartDAO {

	public Cart getCart(String id);
	public void saveOrUpdate(Cart cart);
	public void delete(int id);
	public List<Cart> list() ;
	//public int getTotalAmount(String id);
	
	public List<Cart> usercartlist(String ucname);
	
}
