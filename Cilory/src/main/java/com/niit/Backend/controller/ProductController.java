package com.niit.Backend.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.multipart.MultipartFile;
import com.google.gson.Gson;
import com.niit.Backend.dao.ProductDAO;
import com.niit.Backend.model.Product;
import com.niit.Backend.dao.CategoryDAO;
import com.niit.Backend.dao.SupplierDAO;
@Controller
public class ProductController {

	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private SupplierDAO supplierDAO;
	

	
	@RequestMapping(value = { "product"})
	public String ProductPage(Model model) {
		model.addAttribute("product", new Product());
		model.addAttribute("productList", productDAO.list());
		model.addAttribute("categoryList",categoryDAO.list());
		model.addAttribute("supplierList", supplierDAO.list());
		model.addAttribute("ProductPageClicked", "true");
		return "index";
	}

	@RequestMapping(value = { "addproduct", "editproduct/addproduct" }, method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("product") Product product, HttpServletRequest request) {
		String path=request.getSession().getServletContext().getRealPath("/")+"\\resources\\Images\\product\\";
		productDAO.saveorUpdate(product);
		MultipartFile file=product.getImage();
		MultiPartController.upload(path, file, product.getId()+".jpg");

		return "redirect:/product";
	}

	@RequestMapping("editproduct/{id}")
	public String editProduct(@PathVariable("id") String id, Model model) {
		System.out.println("editProduct");
		model.addAttribute("product", this.productDAO.get(id));
		model.addAttribute("productList", productDAO.list());
		model.addAttribute("categoryList",categoryDAO.list());
		model.addAttribute("supplierList", supplierDAO.list());
		model.addAttribute("ProductPageClicked", "true");
		return "addproduct";
	}

	@RequestMapping(value = { "removeproduct/{id}", "editproduct/removeproduct/{id}" })
	public String removeproduct(@PathVariable("id") String id, Model model, HttpServletRequest request) throws Exception {
		String path=request.getSession().getServletContext().getRealPath("/")+"\\resources\\Images\\product\\";
		MultiPartController.deleteimage(path, id+".jpg");
		productDAO.delete(id);
		model.addAttribute("message", "Successfully Deleted");
		return "redirect:/product";
	}
	 @RequestMapping(value="/productgson")
		@ResponseBody
		public String ProductGson()
		{
			List<Product> list=productDAO.list();
			Gson gson=new Gson();
			String data=gson.toJson(list);
			return data;
		}	
}

