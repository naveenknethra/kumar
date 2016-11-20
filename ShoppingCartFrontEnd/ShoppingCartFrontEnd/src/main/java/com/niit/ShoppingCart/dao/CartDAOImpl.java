package com.niit.ShoppingCart.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.ShoppingCart.model.Cart;

@SuppressWarnings("deprecation")
@Repository("cartDAO")
public class CartDAOImpl implements CartDAO {

	@Autowired
	private Cart cart;
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public CartDAOImpl(SessionFactory sessionFactory){   //Constructor
		this.sessionFactory=sessionFactory;
	}
	@Transactional
	public void saveOrUpdate(Cart cart){            //save or update
		sessionFactory.getCurrentSession().saveOrUpdate(cart);
		System.out.println("connect to controllerimp");
	}
	
	@Transactional
	public void delete(int id){
		Cart cartToDelete = new Cart();
		cartToDelete.setId(id);
		sessionFactory.getCurrentSession().delete(cartToDelete);
	
	}
	
		/*cart.setUserID(id);
		try {
			sessionFactory.getCurrentSession().delete(cart);
			
		} catch (HibernateException e) {
			e.printStackTrace();
			return e.getMessage();
			// TODO: handle exception
		}*/
		
	
	
	@Transactional
	public Cart getCart(String id){
		String hql = "from Cart where userID=" + "'" + id + "'";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
	
	
		@SuppressWarnings("unchecked")
		List<Cart> listCart= (List<Cart>)query.getResultList();
		
		if(listCart!=null &&!(listCart.isEmpty()))
		{
			return listCart.get(0);
		}
		System.out.println("connect to controller");
		return null;
		
	}
	
	@Transactional
	public List<Cart> list() {
		
		@SuppressWarnings("unchecked")
		List<Cart> listCart = (List<Cart>) sessionFactory
				.getCurrentSession().createCriteria(Cart.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();

		return listCart;
	}
	
	/*@Transactional
	public int getTotalAmount(String id){
		String hql="select sum(price) from Cart where userID='"+id+"'";
		//Query query=sessionFactory.getCurrentSession().createQuery(hql);
		//int sum=query.uniqueResult();
		return 5677;
	}*/
	
	
	@Transactional
	public List<Cart> usercartlist(String ucname)
	{
		String hql = " from Cart where userID = " + "'" + ucname + "'";
		
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		
		List<Cart> cartuserlist = query.list();
		
		if(cartuserlist!=null || !cartuserlist.isEmpty()){
			return cartuserlist;
		}
		return null;
	}
	
}
