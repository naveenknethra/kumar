package com.niit.ShoppingCart.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.niit.ShoppingCart.model.Category;

@Repository("categoryDAO")
public interface CategoryDAO 
{
	public void saveOrUpdate(Category category);
	//public boolean save(Category category);
	//public boolean update(Category category);
	public void delete(String id);
	//public boolean delete(Category category);
	public Category get(String Id);
	public List<Category> list();
	public Category getByName(String name);
	
}
