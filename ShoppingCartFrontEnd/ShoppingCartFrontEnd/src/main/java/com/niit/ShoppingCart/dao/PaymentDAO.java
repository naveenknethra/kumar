package com.niit.ShoppingCart.dao;

import org.springframework.stereotype.Repository;

import com.niit.ShoppingCart.model.Payment;

@Repository("paymentDAO")
public interface PaymentDAO {

	public void paymentsave(Payment payment);
	
}
