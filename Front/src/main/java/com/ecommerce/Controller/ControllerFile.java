package com.ecommerce.Controller;


import org.springframework.validation.BindingResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.util.List;

import com.google.gson.Gson;

import com.ecommerce.model.UserDetails;
import com.ecommerce.model.ProductModel;
import com.ecommerce.DAOController.ProductDAO;
import com.ecommerce.service.PdtService;
import com.ecommerce.service.PdtServiceImpl;
import com.ecommerce.User.*;


@SuppressWarnings("unused")
@Controller
public class ControllerFile 
{
	@Autowired
	PdtService pdtServiceImpl;
	
	@Autowired
	UserServiceInterface usrServiceImpl;
	
	
	String message = "Welcome ! ";
	String setName = ""; 
	

	@RequestMapping("/loginPage")
	public ModelAndView showLoginPage()
	{
		ModelAndView mv = new ModelAndView("Login");
		return mv;
	}
	
	/*
	@RequestMapping(value = { "/", "/welcome**" })
	public ModelAndView welcomePage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Custom Login Form");
		model.addObject("message", "This is welcome page!");
		model.setViewName("Home");
		return model;
	}
	*/

	@RequestMapping(value = "/admin**")
	public ModelAndView adminPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Custom Login Form");
		model.addObject("message", "This is protected page!");
		model.setViewName("Admin");

		return model;
	}

	//Spring Security see this :
	@RequestMapping(value = "/login")
	public ModelAndView login(
		@RequestParam(value = "error", required = false) String error,
		@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		if (error != null) { 
			model.addObject("error", "Invalid username and password!");
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("Login");

		return model;
	}
	
	/*
	@RequestMapping(value="/error-login")
	public ModelAndView invalidLogin() {
		ModelAndView modelAndView = new ModelAndView("Login-Form");
		modelAndView.addObject("error", true);
		return modelAndView;
	}
	
	@RequestMapping(value="/success-login")
	public ModelAndView successLogin() {
		return new ModelAndView("Success-Login");
	}

	@RequestMapping("/loginValidate")
	public String userValidation(UserDetails user) {
		
		System.out.println("in controller");
 
		String msg = usrServiceImpl.checkUser(user).toString();
		if(msg!=null)
			return "success";
		else
			return "Login";	
	}
	*/
	
	@RequestMapping("/register")
	public ModelAndView showRegister()
	{
		ModelAndView mv = new ModelAndView("Register");
		return mv;
	}
	
	@RequestMapping("/registerUser")
	public String registerUserDetails(UserDetails user)
	{
		usrServiceImpl.addUser(user);
		return "success";		
	}
		
	@RequestMapping("/productsInfo")
	public ModelAndView showProducts(
			@RequestParam(value = "name", required = false, defaultValue = "img") String name)
	{
		ModelAndView mv = null;
		setName = name;
		
		mv = new ModelAndView("GsonConvert");			  
		
		return mv;
	}


	List<ProductModel> list;
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/GsonCon")
	public @ResponseBody String getValues()throws Exception
	{
		String result = "";
		
		if(setName.equals("all")){			
			list = pdtServiceImpl.getProducts();
			Gson gson = new Gson();			  
			result = gson.toJson(list);			
		}
		else{
			System.out.println("Controller : "+setName);
			ProductModel pm = pdtServiceImpl.getProduct(Integer.parseInt(setName));
			List<ProductModel> list = new ArrayList<ProductModel>();
			list.add(pm);
			Gson gson = new Gson();
			result = gson.toJson(list);
		}
		return result;
	}
	
	@RequestMapping("/insert")
	public ModelAndView showInsertPage(ProductModel pm)		
	{	
		return new ModelAndView("InsertProduct");
	}

	@RequestMapping("/insertProductValues")
	public String insertProduct(ProductModel pm)		
	{	
		pdtServiceImpl.addProduct(pm);
		return "success";
	}
	
	int pid = 0;
	
	@RequestMapping("/edit")
	public ModelAndView editProductPage(
			@RequestParam(value = "ProductId", required = false, defaultValue = "pid") int ProductId,@ModelAttribute("pm") ProductModel pm,BindingResult result)
	{	
		System.out.println(ProductId);
		pid = ProductId;
		ProductModel pmObject = pdtServiceImpl.getRowById(ProductId);
		return new ModelAndView("EditProduct","PIDObj",pmObject);	  
	}
	
	@RequestMapping("/updateProduct")
	public ModelAndView updateProduct(@ModelAttribute("pm") ProductModel pm) {
		pm.setPid(pid);
		
		pdtServiceImpl.updateProduct(pm);
		
	 	ModelAndView modelAndView = new ModelAndView("success");

		String message = "Product was successfully edited.";

		modelAndView.addObject("message", message);

		return modelAndView;
	}

	@RequestMapping("/delete")
	public ModelAndView deleteProduct(
			@RequestParam(value = "ProductId", required = false, defaultValue = "pid") int PId,@ModelAttribute("pm") ProductModel pm,BindingResult result){
		System.out.println(PId);
		
		pdtServiceImpl.deleteProduct(PId);
		
		ModelAndView modelAndView = new ModelAndView("success");
		
		String message = "Product was successfully deleted.";
		
		modelAndView.addObject("message", message);
		
		return modelAndView;
	}

}