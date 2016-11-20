package com.niit.ShoppingCart.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.ShoppingCart.model.Payment;

@Repository("paymentDAO")
public class PaymentDAOImpl implements PaymentDAO{

	@Autowired
	PaymentDAO paymentDAO;
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public PaymentDAOImpl(SessionFactory sessionFactory){
		this.sessionFactory = sessionFactory;
	}
	
	
	@Transactional
	public void paymentsave(Payment payment)
	{
		sessionFactory.getCurrentSession().save(payment);
	}
	
	
}
