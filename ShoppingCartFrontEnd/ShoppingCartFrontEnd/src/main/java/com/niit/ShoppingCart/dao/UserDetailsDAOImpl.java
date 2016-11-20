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

import com.niit.ShoppingCart.model.UserDetails;



@SuppressWarnings("deprecation")
@Repository("userDetailsDAO")
@EnableTransactionManagement

public class UserDetailsDAOImpl implements UserDetailsDAO {

	private static final Logger log = LoggerFactory.getLogger(UserDetailsDAO.class); 

	@Autowired
	private SessionFactory sessionFactory;
	
	public UserDetailsDAOImpl( SessionFactory sessionFactory)
	{
        this.sessionFactory=sessionFactory;
	}
	
	@Transactional
	public boolean save(UserDetails userDetails){
		try {
			log.debug("Starting of the method save");
			sessionFactory.getCurrentSession().save(userDetails);
			log.debug("Ending of the method save");
			return true;
		} catch (Exception e) {
			log.error("Exception occured in save method" + e.getMessage());
			e.printStackTrace();
			return false;
		}
	}
	
	@Transactional
	public boolean update(UserDetails userDetails){
		try {
			log.debug("Starting of the method update");
			sessionFactory.getCurrentSession().update(userDetails);
			log.debug("Ending of the method update");
			return true;
		} catch (Exception e) {
			log.error("Exception occured in update method" + e.getMessage());
			e.printStackTrace();
			return false;
		}
	}
	
	@Transactional
	public boolean delete(UserDetails userDetails){
		try {
			log.debug("Starting of the method delete");
			sessionFactory.getCurrentSession().delete(userDetails);
			log.debug("Ending of the method delete");
			return true;
		} catch (Exception e) {
			log.error("Exception occured in delete method" + e.getMessage());
			e.printStackTrace();
			return false;
		}
	}
	@Transactional
	public  UserDetails get(int id){
		
		// select * from UserDetails  where id= '101'
		log.debug("Starting of the method get");
		log.info("Trying to get product based on id:" +id);
		
		String hql =" from UserDetails where id = " + "'" + id + "'";
		@SuppressWarnings("rawtypes")
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<UserDetails> list = query.list();
		
		if(list==null || list.isEmpty())
		{
			log.info("No product is avaliable on id:" +id);
			return null;
		}
		else
		{
			return list.get(0);
		}
	}

	@Transactional
	public UserDetails isValidUser(String name, String password)
	{
	
		
		String hql = "from UserDetails where name = '" + name+ "' and password= '" +password +"'";
		
		@SuppressWarnings("rawtypes")
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<UserDetails> list =  query.list();
		
		if(list==null || list.isEmpty())
		{
			
			return null;
		}
		else
		{
			return list.get(0);
		}
		
		
	}
	
	
	
	@Transactional
	@SuppressWarnings("unchecked")
	public List<UserDetails>    list(){
		
		String hql = " from UserDetails ";
		log.debug("Starting of the method list");
		@SuppressWarnings("rawtypes")
		Query  query = sessionFactory.getCurrentSession().createQuery(hql);
		//return  query.list();
        List<UserDetails> list = query.list();
		
		if(list==null || list.isEmpty())
		{
			log.info("No product is avaliable on id:");
		}
		return list;
		
	}

	@Transactional
	public UserDetails getByName(String name) {

		String hql = " from UserDetails where name = " + " ' " + name + " ' ";
		
		@SuppressWarnings("rawtypes")
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		
		@SuppressWarnings("unchecked")
		List<UserDetails> list = query.list();
		
		if(list==null || list.isEmpty())
		{
			return null;
		}
		else
		{
			return list.get(0);
		}	
	}
	
}
