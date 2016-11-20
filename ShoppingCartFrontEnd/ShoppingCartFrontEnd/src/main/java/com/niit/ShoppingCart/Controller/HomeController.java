package com.niit.ShoppingCart.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.ShoppingCart.dao.CategoryDAO;
import com.niit.ShoppingCart.dao.ProductDAO;
import com.niit.ShoppingCart.model.Product;

@Controller
public class HomeController {
	
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private ProductDAO productDAO;
	
	
	
	@Autowired
	private Product product;

	@RequestMapping("/aboutus")
	public String about()
	{
		return "aboutus";
	}
	
	
	
	@RequestMapping(value={"/", "/homepage"}, method=RequestMethod.GET)
	public String homep(Model model)
	{
		model.addAttribute("product", product);
		model.addAttribute("hprolist", this.productDAO.somelist());
		model.addAttribute("hcatlist", this.categoryDAO.list());
		return "homepage";
	}

	
	@RequestMapping(value="/homepro{pro_id}", method=RequestMethod.GET)
	public String homecatpro(@PathVariable("pro_id") String pro_id, Model model)
	{
		model.addAttribute("homecatpro", this.productDAO.getProduct(pro_id));
		model.addAttribute("hcatlist", this.categoryDAO.list());
		return "prodetails";
	}

	
	@RequestMapping(value="/category{cat_id}", method = RequestMethod.GET)
	public String cadisplaypro(@PathVariable("cat_id") String cat_id, Model model)
	{
		model.addAttribute("product", product);
		model.addAttribute("capro" + "lists", this.productDAO.getByCatPro(cat_id));
		model.addAttribute("hcatlist", this.categoryDAO.list());
		
		return "categorypage";
	}

	
	
	
	
}
