package com.niit.ShoppingCart.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.stereotype.Component;


import com.niit.ShoppingCart.dao.UserDetailsDAO;
import com.niit.ShoppingCart.model.UserDetails;

@Component
public class RegistrationHandler {

	@Autowired
	UserDetailsDAO userDetailsDAO;
	
	public UserDetails initFlow()
	{
		return new UserDetails();
	}
	
	public String validateDetails(UserDetails userDetails, MessageContext messageContext)
	{
		String status = "success";
		
		
		if(userDetails.getName().isEmpty())
		{
			messageContext.addMessage(new MessageBuilder().error().source("name").defaultText("UserName cannt be empty").build());
			//messageContext.addMessage(new MessageBuilder().error().source("name").defaultText("UserName cannot be empty").build());
			status = "failure";
		}
		
		if(userDetails.getPassword().isEmpty())
		{
			messageContext.addMessage(new MessageBuilder().error().source("password").defaultText("Password Cannot be Empty").build());
			status ="failure";
		}
		
		if(userDetails.getEmail().isEmpty())
		{
			messageContext.addMessage(new MessageBuilder().error().source("email").defaultText("Email cannot be Empty").build());
			status = "faliure";
		}
		
		if(userDetails.getMob_no().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source("mobile").defaultText("Mobile cannot be Empty").build());
			status = "failure";
		}
		if(userDetails.getAddress().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source("address").defaultText("Address cannot be Empty").build());
			status = "failure";
		}
		return status;
		
	}
	
	public String saveDetails(UserDetails userDetails)
	{
	      userDetailsDAO.save(userDetails);
	      return "success";
	}
	
	/*public String updateDetails(UserDetails userDetails)
	{
	      userDetailsDAO.update(userDetails);
	      return "success";
	}*/
	
	
}
