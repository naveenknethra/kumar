package com.niit.ShoppingCart.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ShoppingCart.dao.SupplierDAO;
import com.niit.ShoppingCart.model.Supplier;


@Controller
public class SupplierController {

	@Autowired
	SupplierDAO supplierDAO;
	
	@Autowired
	Supplier supplier;
	
	@RequestMapping("/managesupplier")
	public ModelAndView catpage()
	{
		ModelAndView mv = new ModelAndView("managesupplier");
		return mv;
	}
	
	@ModelAttribute("supplierpage")
	public Supplier addcat()
	{
		System.out.println("Created model for Category");
		return new Supplier();
	}
	
/*----------------------save function---------------------------*/
	
	@RequestMapping(value="/addsupplier", method=RequestMethod.POST)
	public ModelAndView supplieraddFunc(@ModelAttribute("supplierpage") Supplier supplierpage){
		
		supplierDAO.saveOrUpdate(supplierpage);
	ModelAndView mv= new ModelAndView("adminhome");
	return mv;

	
	}
	

/*--------------------------------------UPDATE FUNCTION FOR CATEGORY---------------------------------------*/
	
	
	@RequestMapping(value="/supplieredit-{cat_id}", method = RequestMethod.GET)
	public String editCategory(@PathVariable("cat_id") String cat_id, Model model) {
		System.out.println("editsupplier");
		model.addAttribute("supplier", this.supplierDAO.get(cat_id));
		model.addAttribute("listSupplier", this.supplierDAO.list());
		return "managesupplier";
	}
	
	

/*--------------------------------------DELETE FUNCTION FOR CATEGORY---------------------------------------*/
	
	
	@RequestMapping("/supplierdelete/{sup_id}")
	public String deletesupplier(@PathVariable("sup_id") String sup_id , Model model) throws Exception {
	try {
		
		supplierDAO.delete(sup_id);
		model.addAttribute("message", "Deleted successfully");
		
	} catch (Exception e) {
		model.addAttribute("message", e.getMessage());
		e.printStackTrace();
	}
	return "redirect:/managesupplier";
	}
	
	

/*---------------------------------------LIST FUNCTION FOR CATEGORY----------------------------------------*/
	
    @RequestMapping(value="/managesupplier", method=RequestMethod.GET)
	public String listSupplier(Model model)
	{
	
		model.addAttribute("supplier", supplier);
		model.addAttribute("supplierList", this.supplierDAO.list());
		return "managesupplier";
	}

}
