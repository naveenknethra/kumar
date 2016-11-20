package com.niit.ShoppingCart.Controller;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.ShoppingCart.dao.CategoryDAO;
import com.niit.ShoppingCart.dao.ProductDAO;
import com.niit.ShoppingCart.dao.SupplierDAO;
import com.niit.ShoppingCart.model.Category;
import com.niit.ShoppingCart.model.Product;
import com.niit.ShoppingCart.model.Supplier;
import com.niit.ShoppingCart.util.FileUtil;

@Controller
public class ProductController {

	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	Product product;
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	Category category;
	
	@Autowired
	SupplierDAO supplierDAO;
	
	@Autowired
	Supplier supplier;
	
	private Path path;
	

	@RequestMapping("/manageproduct")
	public ModelAndView productpage()
	{
		ModelAndView mv = new ModelAndView("manageproduct");
		return mv;
	}
	
	@ModelAttribute("product")
	public Product addcat()
	{
		System.out.println("Created model for Product");
		return new Product();
	}
	
	
	
	@RequestMapping(value = "/addproduct", method = RequestMethod.POST)
	public String addprofunc(@ModelAttribute("product") Product product, HttpServletRequest request)
	{
		Category category = categoryDAO.getByName(product.getCategory().getCat_name());
		System.out.println(categoryDAO.getByName(product.getCategory().getCat_name()));
		categoryDAO.saveOrUpdate(category);
		
		Supplier supplier = supplierDAO.getByName(product.getSupplier().getSup_name());
		supplierDAO.saveOrUpdate(supplier);
		
		product.setCategory(category);
		product.setSupplier(supplier);
		
		product.setCategory_id(category.getCat_id());
		product.setSupplier_id(supplier.getSup_id());
		productDAO.saveOrUpdate(product);
		
		
		MultipartFile file=product.getImage();
		String rootDirectory=request.getSession().getServletContext().getRealPath("/");
		path=Paths.get(rootDirectory + "\\resources\\images\\"+product.getPro_id()+".jpg");
		
		if(file!=null && !file.isEmpty()){
			try{
				file.transferTo(new File(path.toString()));
				System.out.println("Image Uploaded to Product.....");
			}catch(Exception e)
			{
				e.printStackTrace();
				throw new RuntimeException("image saving failed ",e);
			}
		}
		
		FileUtil.upload(path.toString(), file, product.getPro_id() + ".jpg");
		
		return "adminhome";
	
	}
	
	
	@RequestMapping(value="/productdetails-{pro_id}", method = RequestMethod.GET)
	public String getSelectedProduct(@PathVariable("pro_id") String pro_id, Model model, RedirectAttributes redirectAttributes)
	{
		model.addAttribute("product", new Product());
		model.addAttribute("supplier", new Supplier());
		model.addAttribute("category", new Category());
		
		model.addAttribute("productList", this.productDAO.list());
		model.addAttribute("categoryList", this.categoryDAO.list());
		model.addAttribute("supplierList", this.supplierDAO.list());
		
		redirectAttributes.addFlashAttribute("selected products", productDAO.getProduct(pro_id));
		
		return "manageproduct";
	}
	
	/*@RequestMapping(value="/manageproduct", method = RequestMethod.GET)
	public String listProduct(Model model)
	{
		model.addAttribute("product", new Product());
		model.addAttribute("supplier", new Supplier());
		model.addAttribute("category", new Category());
		
		model.addAttribute("productList", this.productDAO.list());
		model.addAttribute("categoryList", this.categoryDAO.list());
		model.addAttribute("supplierList", this.supplierDAO.list());
		
		return "manageproduct";
	}*/
	
	
	@RequestMapping(value="/product-edit-{pro_id}",method = RequestMethod.GET)
	public String proeditfunc(@PathVariable("pro_id") String pro_id, Model model)
	{
		model.addAttribute("product", this.productDAO.getProduct(pro_id));
		model.addAttribute("listProduct", this.productDAO.list());
		model.addAttribute("supplierList", this.supplierDAO.list());
		model.addAttribute("categoryList", this.categoryDAO.list());
		
		return "manageproduct";
	}
	
	@RequestMapping("/productdelete-{pro_id}")
	public String deleteProduct(@PathVariable("pro_id") String pro_id, ModelMap model) throws Exception {

		try {
			productDAO.delete(pro_id);
			model.addAttribute("message", "Successfully Deleted");
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			e.printStackTrace();
		}
		// redirectAttrs.addFlashAttribute(arg0, arg1)
		return "adminhome";
	}
	
	
}
