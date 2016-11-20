package com.niit.ShoppingCart.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ShoppingCart.dao.CategoryDAO;
import com.niit.ShoppingCart.model.Category;


@Controller
public class CategoryController {

	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	Category category;
	
	@RequestMapping("/managecategory")
	public ModelAndView catpage()
	{
		ModelAndView mv = new ModelAndView("managecategory");
		return mv;
	}
	
	@ModelAttribute("categorypage")
	public Category addcat()
	{
		System.out.println("Created model for Category");
		return new Category();
	}
	
/*----------------------save function---------------------------*/
	
	@RequestMapping(value="/addcategory", method=RequestMethod.POST)
	public ModelAndView categoryaddFunc(@ModelAttribute("categorypage") Category categorypage){
		
	categoryDAO.saveOrUpdate(categorypage);
	ModelAndView mv= new ModelAndView("adminhome");
	return mv;

	
	}
	

/*--------------------------------------UPDATE FUNCTION FOR CATEGORY---------------------------------------*/
	
	
	@RequestMapping(value="/categoryedit-{cat_id}", method = RequestMethod.GET)
	public String editCategory(@PathVariable("cat_id") String cat_id, Model model) {
		System.out.println("editCategory");
		model.addAttribute("category", this.categoryDAO.get(cat_id));
		model.addAttribute("listCategory", this.categoryDAO.list());
		return "managecategory";
	}
	
	/*@RequestMapping("/categoryedit-{cat_id}")
	public String editCatt(@PathVariable("cat_id") String cat_id , Model model) {
	System.out.println("editProduct");
	model.addAttribute("category", this.categoryDAO.get(cat_id));
	model.addAttribute("categoryList", this.categoryDAO.list());
	return "category";
	
	}*/
	
	/*@RequestMapping("/updatecategory-{CAT_ID}")
	public ModelAndView catupdatefunc(@ModelAttribute("categorypage") Category categorypage)
	{
		ModelAndView mv=new ModelAndView("redirect:/category");
		if(categoryDAO.get(categorypage.getCat_id())!=null)
		{
			categoryDAO.update(categorypage);
			mv.addObject("message", "Updated category successfully");
		}
		else
		{
			mv.addObject("message", "Not updated");
		}
		return mv;
	}*/

/*--------------------------------------DELETE FUNCTION FOR CATEGORY---------------------------------------*/
	
	
	@RequestMapping("/categorydelete/{cat_id}")
	public String deletecategory(@PathVariable("cat_id") String cat_id , Model model) throws Exception {
	try {
		
		categoryDAO.delete(cat_id);
		model.addAttribute("message", "Deleted successfully");
		
	} catch (Exception e) {
		model.addAttribute("message", e.getMessage());
		e.printStackTrace();
	}
	return "redirect:/managecategory";
	}
	
	

/*---------------------------------------LIST FUNCTION FOR CATEGORY----------------------------------------*/
	
    @RequestMapping(value="/managecategory", method=RequestMethod.GET)
	public String listCategory(Model model)
	{
	
		model.addAttribute("category", category);
		model.addAttribute("categoryList", this.categoryDAO.list());
		return "managecategory";
	}

	

	
}
