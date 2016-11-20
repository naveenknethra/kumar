package com.niit.ShoppingCart.Controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ShoppingCart.dao.CartDAO;
import com.niit.ShoppingCart.dao.CategoryDAO;
import com.niit.ShoppingCart.dao.PaymentDAO;
import com.niit.ShoppingCart.dao.ProductDAO;
import com.niit.ShoppingCart.model.Cart;
import com.niit.ShoppingCart.model.Category;
import com.niit.ShoppingCart.model.Payment;
import com.niit.ShoppingCart.model.Product;

@Controller
public class CartController {

	@Autowired(required = true)
	Cart cart;
	
	@Autowired(required = true)
	private CartDAO cartDAO;
	
	@Autowired(required = true)
	private CategoryDAO categoryDAO;
	
	@Autowired(required = true)
	private ProductDAO productDAO;
	
	@Autowired
	private Payment payment;
	
	@Autowired
	private PaymentDAO paymentDAO;
	
	@ModelAttribute("payment")
	public Payment paymodel()
	{
		System.out.println("created payment model");
		return new Payment();
	}
	
	
	@RequestMapping("/payment")
	public ModelAndView pay()
	{
		ModelAndView mv = new ModelAndView("payment");
		return mv;
	}

	@RequestMapping(value="/addpayment", method=RequestMethod.POST)
	public ModelAndView addpaymentfunc(@ModelAttribute("payment") Payment payment)
	{
		
		paymentDAO.paymentsave(payment);
		ModelAndView mv = new ModelAndView("thanks");
		return mv;
		
		
	}
	
	/*@RequestMapping(value="/myCart", method = RequestMethod.GET)
	public String usercartfunc(Model model, Principal principal)
	{
		model.addAttribute("cartList", this.cartDAO.usercartlist(principal.getName()));
		return "cart";
	}*/
	
	
	
	@RequestMapping(value = "/myCart", method = RequestMethod.GET)
	public String myCart(Model model, Principal principal) {
		model.addAttribute("category", new Category());
		model.addAttribute("categoryList", categoryDAO.list());
	
		model.addAttribute("cart", new Cart());
		model.addAttribute("cartList", this.cartDAO.usercartlist(principal.getName()));
	//	model.addAttribute("totalAmount", cartDAO.getTotalAmount("user")); // Just to test, password user
		model.addAttribute("displayCart", "true");
		
		int i,j=0;
		int s=0;
		int n=cartDAO.usercartlist(principal.getName()).size();
		System.out.println(n);
		for(i=0;i<n;i++)
		{
			s=s+cartDAO.usercartlist(principal.getName()).get(i).getPrice();
			
		}
		System.out.println(s);
		model.addAttribute("sum", s);
		model.addAttribute("cart", new Category());
		model.addAttribute("cartList", this.cartDAO.usercartlist(principal.getName()));
		
		return "cart";
	}
	
	@RequestMapping(value= "/cart/add/{id}", method = RequestMethod.GET)
	public String addToCart(@PathVariable("id") String id, HttpServletRequest request,Model model, Principal principal){
		
	
	 Product product =	 productDAO.getProduct(id);
	 Cart cart = new Cart();
	 cart.setPrice(product.getPrice());
	 cart.setProductName(product.getPro_name());
	 cart.setCartprid(product.getPro_id());
	 cart.setQuantity("1");
	 cart.setUserID(principal.getName());  //  id should keep session and use the same id
	 	cartDAO.saveOrUpdate(cart);
		//return "redirect:/views/home.jsp";
		System.out.println("connect to controller");
		
		model.addAttribute("cart", new Cart());
		model.addAttribute("cartList", this.cartDAO.usercartlist(principal.getName()));
		
		
		
		return "redirect:/myCart";
		
		
	}
	
	@RequestMapping("/cart/delete/{id}")
	public String deleteCart(@PathVariable("id") int id,Model model)
{
	
		cartDAO.delete(id);
		
		
		 return "redirect:/myCart";
}

	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public String checkout(Model model, Principal principal) {
	    
		int i,j=0;
		int s=0;
		int n=cartDAO.usercartlist(principal.getName()).size();
		System.out.println(n);
		for(i=0;i<n;i++)
		{
			s=s+cartDAO.usercartlist(principal.getName()).get(i).getPrice();
			
		}
		System.out.println(s);
		model.addAttribute("sum", s);
		model.addAttribute("cart", new Category());
		model.addAttribute("cartList", this.cartDAO.usercartlist(principal.getName()));
		//model.addAttribute("total", this.cartDAO.getTotalAmount("id"));
		
	
		
		//System.out.println(U);
		return "/checkout";
	}
	
	@RequestMapping(value = "/logout2", method = RequestMethod.GET)
	public String logout2(Model model) {
	
		
		
		
	
		
		//System.out.println(U);
		return "/logout";
	}

	@RequestMapping("/logout")
	public String logout(Model model)
	{
		int i,s=0,j=0;
		int n=cartDAO.list().size();
		System.out.println(n);
		for(i=0;i<n;i++)
		{
			s=s+cartDAO.list().get(i).getPrice();
			
		}
		System.out.println(s);
		model.addAttribute("sum", s);
		while(n!=0)
		{
			cartDAO.delete(cartDAO.list().get(j).getId());
			n=cartDAO.list().size();
			
		}
		return "logout";
	}
	
	@RequestMapping("/thanks")
	public String getthanks()
	{
		return "thanks";	
	}
 
	/*@RequestMapping("/payment")
	public String getpayment()
	{
		return "payment";	
	}*/
	
	
}
