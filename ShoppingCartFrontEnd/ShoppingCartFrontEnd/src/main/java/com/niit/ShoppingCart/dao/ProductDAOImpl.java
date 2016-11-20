package com.niit.ShoppingCart.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.ShoppingCart.model.Product;

@SuppressWarnings("deprecation")
@Repository("productDAO")
public class ProductDAOImpl implements ProductDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public ProductDAOImpl(SessionFactory sessionFactory){
		this.sessionFactory = sessionFactory;
	}
	
	
	@Transactional
	public void saveOrUpdate(Product product)
	{
		sessionFactory.getCurrentSession().saveOrUpdate(product);
	
	}
	
	@Transactional
	public void delete(String id)
	{
		Product producttodelete=new Product();
		producttodelete.setPro_id(id);
		sessionFactory.getCurrentSession().delete(producttodelete);
		
	}
	
	
	@Transactional
	public Product getProduct(String id) {
		String hql = "from Product where pro_id=" + "'"+ id +"'";
		@SuppressWarnings("rawtypes")
		Query query= sessionFactory.getCurrentSession().createQuery(hql); 
		@SuppressWarnings("unchecked")
		List<Product> listProduct = query.list();
		
		if (listProduct != null && !listProduct.isEmpty()) {
			return listProduct.get(0);
		}
		return null;
	}
	
	
	@Transactional
	public List<Product> list() {
		@SuppressWarnings("unchecked")
		List<Product> listProduct = (List<Product>) 
		          sessionFactory.getCurrentSession()
				.createCriteria(Product.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return listProduct;
	}
	
	@Transactional
	public List<Product> somelist()
	{
		String hql = "from Product order by pro_id desc";
		
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult(0).setMaxResults(8);
		
		List<Product> someprolist = query.list();
		
		if(someprolist!=null || !someprolist.isEmpty())
		{
			return someprolist;
		}
		return null;
		
	}
	
	@Transactional
	public Product getByName(String name) {
		String hql = "from Product where pro_name=" + "'"+ name +"'";
		@SuppressWarnings("rawtypes")
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		
		@SuppressWarnings("unchecked")
		List<Product> listProduct = (List<Product>) query.list();
		
		if (listProduct != null && !listProduct.isEmpty()) {
			return listProduct.get(0);
		}
		
		return null;
	}

	
	@Transactional
	public List<Product> getByCatPro(String name)
	{
		String hql = "from Product where category_id = " + "'" + name + "'";
		
		@SuppressWarnings("rawtypes")
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		
		List<Product> catlistpro = query.list();
		
		if(catlistpro!=null || !catlistpro.isEmpty())
		{
			return catlistpro;
		}
		
		return null;
	}
}
