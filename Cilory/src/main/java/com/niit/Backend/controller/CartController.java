package com.niit.Backend.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;

import com.niit.Backend.dao.CartDAO;
import com.niit.Backend.dao.CategoryDAO;
import com.niit.Backend.dao.ProductDAO;
import com.niit.Backend.model.Cart;
import com.niit.Backend.model.Product;


@SuppressWarnings("unused")
@Controller
public class CartController {
	
	
	@Autowired
	private CartDAO cartDAO;
	
	@Autowired 
	private ProductDAO productDAO;

	@RequestMapping("{userId}/addtoCart/{id}")
	public String addToCart(@PathVariable("id") String Productid,@PathVariable("userId") int userId)throws Exception 
	{
		Cart item=new Cart();
		Product product=productDAO.get(Productid);
		item.setProductname(product.getName());
		item.setUserid(userId);
		item.setPrice(product.getPrice());
		item.setStatus("C");
		item.setQuantity(1);
		cartDAO.saveOrUpdate(item);
		return "redirect:/ViewCart";
	}
	
	@RequestMapping("{userId}/viewcart")
	public String viewCart(@PathVariable("userId") int userId,Model model)
	{
		model.addAttribute("CartList",cartDAO.get(userId));
		model.addAttribute("CartPrice",cartDAO.CartPrice(userId));
		return "ViewCart";
	}

}
