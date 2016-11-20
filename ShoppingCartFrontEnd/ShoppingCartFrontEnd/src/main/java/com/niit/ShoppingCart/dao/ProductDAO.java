package com.niit.ShoppingCart.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.niit.ShoppingCart.model.Product;

@Repository("productDAO")
public interface ProductDAO {
	
	public List<Product> list();
	public Product getProduct(String id);
	public void saveOrUpdate(Product product);
	public void delete(String id);
	public Product getByName(String name);
	
	public List<Product> somelist();
	
	
	public List<Product> getByCatPro(String name);

}
