package net.ecomm.onlineshopping.controller;

import java.util.List;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.ecomm.shoppingbackend.dao.CategoryDAO;
import net.ecomm.shoppingbackend.dao.ProductDAO;
import net.ecomm.shoppingbackend.dto.Category;
import net.ecomm.shoppingbackend.dto.Product;

@Controller
@RequestMapping("/manage")
public class ManagementController {
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private static final Logger logger = LoggerFactory.getLogger(ManagementController.class);
	
	@RequestMapping(value="/products",method=RequestMethod.GET)
	public ModelAndView showManageProducts(@RequestParam(name="operation",required=false) String operation){
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("userClickManageProducts",true);
		mv.addObject("title","Manage Products");
		
		Product nProduct = new Product();
		//set few of the fields
		nProduct.setSupplierId(1);
		nProduct.setActive(true);
		
		mv.addObject("product",nProduct);
		
		if (operation != null) {
			if(operation.equals("product")) {
				mv.addObject("message","Product Submitted Successfully!");
			}
		}
		return mv;
	}
	
	//handle product submission
	@RequestMapping(value="/products",method=RequestMethod.POST)
	public String handleProductSubmission(@Valid @ModelAttribute("product") Product mProduct, BindingResult results, Model model) {
		
		//check if there are any errors
		if (results.hasErrors()) {
			model.addAttribute("userClickManageProducts",true);
			model.addAttribute("title","Manage Products");
			model.addAttribute("message","Validation failed for Product Submission!");
			return "page";
		}
		
		logger.info(mProduct.toString());
		
		//create a new product record
		productDAO.add(mProduct);
		
		return "redirect:/manage/products?operation=product";
	}
	
	@ModelAttribute("categories")
	public List<Category> getCategories(){
		return categoryDAO.list();
	}

}
