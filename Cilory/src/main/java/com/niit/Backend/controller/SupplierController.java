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
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.niit.Backend.dao.SupplierDAO;
import com.niit.Backend.model.Supplier;
@Controller
public class SupplierController {

	
	@Autowired
	private SupplierDAO supplierDAO;
	

	@RequestMapping(value = {"supplier"})
	public String SupplierPage(Model model) {
		model.addAttribute("supplier", new Supplier());
		model.addAttribute("supplierList", supplierDAO.list());
		model.addAttribute("SupplierPageClicked", "true");
		return "index";
	}

	@RequestMapping(value = {"addsupplier", "editsupplier/addsupplier" }, method = RequestMethod.POST)
	public String addSupplier(@ModelAttribute("supplier") Supplier supplier , HttpServletRequest request) {
		String path=request.getSession().getServletContext().getRealPath("/")+"\\resources\\Images\\supplier\\";
		supplierDAO.saveorUpdate(supplier);
		MultipartFile file=supplier.getImage();
		MultiPartController.upload(path, file, supplier.getId()+".jpg");
		return "redirect:/supplier";
		
	}

	@RequestMapping("editsupplier/{id}")
	public String editSupplier(@PathVariable("id") String id, Model model) {
		System.out.println("editSupplier");
		model.addAttribute("supplier", this.supplierDAO.get(id));
		model.addAttribute("supplierList", supplierDAO.list());
		model.addAttribute("SupplierPageClicked", "true");
		return "addsupplier";
	}

	@RequestMapping(value = { "removesupplier/{id}", "editsupplier/removesupplier/{id}" })
	public String removeSupplier(@PathVariable("id") String id, Model model, HttpServletRequest request) throws Exception {
		String path=request.getSession().getServletContext().getRealPath("/")+"\\resources\\Images\\supplier\\";
		MultiPartController.deleteimage(path, id+".jpg");
		supplierDAO.delete(id);
		model.addAttribute("message", "Successfully Deleted");
		return "redirect:/supplier";
	}
	@RequestMapping(value="/suppliergson")
	@ResponseBody
	public String SupplierGson()
	{
		List<Supplier> list=supplierDAO.list();
		Gson gson=new Gson();
		String data=gson.toJson(list);
		return data;
	}
	


}
