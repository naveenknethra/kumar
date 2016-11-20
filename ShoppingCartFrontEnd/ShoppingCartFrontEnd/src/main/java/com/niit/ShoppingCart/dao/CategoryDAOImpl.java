package com.niit.ShoppingCart.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.niit.ShoppingCart.model.Category;

@SuppressWarnings("deprecation")
@EnableTransactionManagement
@Repository("categoryDAO")
public class CategoryDAOImpl implements CategoryDAO{
	
	private static Logger log = LoggerFactory.getLogger(CategoryDAOImpl.class);
	


@Autowired
private SessionFactory sessionFactory;

public CategoryDAOImpl(SessionFactory sessionFactory)
{
 this.sessionFactory = sessionFactory;
}

@Transactional
public void saveOrUpdate(Category category) 
{ 
	// save or update
	sessionFactory.getCurrentSession().saveOrUpdate(category);
	
}

/*@Transactional
public boolean save(Category category){	
	
	try{
		log.debug("Starting of the method save");
		sessionFactory.getCurrentSession().save(category);
		log.debug("Ending of the method save");
		return true;
	} catch (Exception e) {
		
		log.error("Exception occured in save method"+e.getMessage());
		e.printStackTrace();
		return false;}
}	
@Transactional
public boolean update(Category category){
	
	try{
		log.debug("Starting of the method update");
		sessionFactory.getCurrentSession().update(category);
		log.debug("Ending of the method update");
		return true;
	} catch (Exception e) {
		log.error("Eror occured:"+e.getMessage());

		e.printStackTrace();
		return false;
	}
}*/


@Transactional
public Category get(String Id)
{
	log.debug("Starting of the method get");
	log.info("Trying to get category based on Id"+Id);
	
String hql = "from Category where CAT_ID = " + "'" + Id + "'";
log.info("The hsql quuery is:"+hql);

@SuppressWarnings("rawtypes")
Query query =sessionFactory.getCurrentSession().createQuery(hql);


@SuppressWarnings("unchecked")
List<Category> list =query.list();


if (list == null || list.isEmpty()){
	log.info("No categories are available with Id:"+Id);
	return null;
  } 
else
  {
	  return list.get(0);
  }
}
@Transactional
public Category getByName(String name) {
	log.debug("Starting of the method ");
	log.info("Trying to get category based on Name"+name);
	String hql = "from Category where cat_name = " + "'" + name + "'";
	log.info("The hsql quuery is:"+hql);
	@SuppressWarnings({ "rawtypes" })
	Query query = sessionFactory.getCurrentSession().createQuery(hql);
	@SuppressWarnings({ "unchecked" })
	List<Category> list = query.list();
	if (list == null || list.isEmpty()) {
		log.info("No categories are available with name:"+name);
		return null;
	} else {
		return list.get(0);
	}
}


@SuppressWarnings("unchecked")
@Transactional
public List<Category> list(){
	log.debug("Starting of the method list");
	
	String hql = "from Category";
@SuppressWarnings("rawtypes")
Query query =sessionFactory.getCurrentSession().createQuery(hql);
log.debug("Ending of the method list");
List<Category> listCategory = query.list();
if(listCategory == null  || listCategory.isEmpty())
{
	 return null;
	 
}
return query.list();
}

@Transactional
public void delete(String id)
{
	Category categoryToDelete = new Category();
	categoryToDelete.setCat_id(id);
	sessionFactory.getCurrentSession().delete(categoryToDelete);
}

}
