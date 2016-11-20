package com.niit.ShoppingCart.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.niit.ShoppingCart.model.Supplier;

@EnableTransactionManagement
@Repository("supplierDAO")
public class SupplierDAOImpl implements SupplierDAO{

	private static final Logger log=LoggerFactory.getLogger(SupplierDAOImpl.class);
	//private static final Logger log=LoggerFactory.getLogger("com.niit.shoppingcart.dao.SupplierDAOImpl");

	
	@Autowired
	private SessionFactory sessionFactory;
	
	public SupplierDAOImpl (SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Transactional
	public void saveOrUpdate(Supplier supplier) 
	{ 
		// save or update
		sessionFactory.getCurrentSession().saveOrUpdate(supplier);
		
	}
	
	@Transactional
	public void delete(String id)
	{
		Supplier supplierToDelete = new Supplier();
		supplierToDelete.setSup_id(id);
		sessionFactory.getCurrentSession().delete(supplierToDelete);
	}
	
	
@SuppressWarnings("deprecation")
@Transactional
			
public Supplier get(String id) {
	log.debug("Starting of the method get");
	log.info("Trying to get supplier based on Id"+id);
	
	String hql = "from Supplier where sup_id = " + "'" + id + "'";
	log.info("The hsql quuery is:"+hql);
	
	@SuppressWarnings("rawtypes")
	Query query =sessionFactory.getCurrentSession().createQuery(hql);
	@SuppressWarnings("unchecked")
	List<Supplier> list = query.list();
	if (list == null || list.isEmpty()) {
		log.info("No suppliers are available with Id:"+id);
		return null;
	} else {
		return list.get(0);
	}
}
@Transactional
public Supplier getByName(String name) {
	log.debug("Starting of the method ");
	log.info("Trying to get supplier based on Name"+name);
	String hql = "from Supplier where sup_name = " + "'" + name + "'";
	log.info("The hsql quuery is:"+hql);
	@SuppressWarnings({ "rawtypes" })
	Query query = sessionFactory.getCurrentSession().createQuery(hql);
	@SuppressWarnings({ "unchecked", "deprecation" })
	List<Supplier> list = query.list();
	if (list == null || list.isEmpty()) {
		log.info("No suppliers are available with name:"+name);
		return null;
	} else {
		return list.get(0);
	}
}

@Transactional
@SuppressWarnings({ "unchecked", "deprecation" })
public List<Supplier> list() {
	log.debug("Starting of the method list"); 
	String hql = "from Supplier";
	 
	 @SuppressWarnings("rawtypes")
	Query query = sessionFactory.getCurrentSession().createQuery(hql);
	 log.debug("Ending of the method list");
	 List<Supplier> listSupplier =(List<Supplier>) query.list();
	 if(listSupplier == null || listSupplier.isEmpty())
	 {
		 return null;
		 
	 }
	return query.list();
}
	
}
