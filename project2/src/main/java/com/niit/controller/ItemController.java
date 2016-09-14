package com.niit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.model.Item;
import com.niit.service.ItemService;

@Controller
public class ItemController {

	@Autowired
	 private ItemService itemService;
	
	/*@RequestMapping(value="/")
	public String landPage(@ModelAttribute("item")Item item,BindingResult result,Model model)
	{
		
		model.addAttribute("allData",itemService.getAllItems());
		return "itemInsert";
		
	}
	*/ 
	@RequestMapping(value={"/","/allData"})
	public String getAllData(@ModelAttribute("item")Item item,BindingResult result,Model model)
	{
	
		model.addAttribute("allData",itemService.getAllItems());
		return"itemInsert";
	}
	@RequestMapping(value="/addItem",method = RequestMethod.POST)
public String addItem(@ModelAttribute("item") Item p){
		
		this.itemService.addItem(p);
			
		
		
		return "redirect:allData";
		
	}
	@RequestMapping(value="/ItemById/{id}",method = RequestMethod.GET)
	public String editItem(@PathVariable("id") int id,RedirectAttributes redirectAttributes)
	{
		redirectAttributes.addFlashAttribute("item", itemService.getItem(id));
		return "redirect:/allData";
		
}
	@RequestMapping(value="/deleteById/{id}",method = RequestMethod.GET)
	public String deleteItem(@PathVariable("id") int id)
	{
		itemService.deleteItem(id);
		return "redirect:/allData";
		
}
}