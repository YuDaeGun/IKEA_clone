package com.ikea.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ikea.product.ProductAndImageDTO;
import com.ikea.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService ps;

	@GetMapping("/getLargeCategory")
	@ResponseBody
	public String[] getLargeCategory() {
		return ps.getLargeCategory();
	}
	@GetMapping("/getSubCategory/{ref}")
	@ResponseBody
	public String[] getSubCategory(@PathVariable String ref) {
		return ps.getSubCategory(ref.replaceAll("_", "/"));
	}
	
	@GetMapping("/newProductList")
	@ResponseBody
	public List<ProductAndImageDTO> list() {
		return ps.newProductList();
	}
	
	@GetMapping("/product/view/{product_idx}")
	public ModelAndView productView(@PathVariable int product_idx) {
		
		ModelAndView mav = new ModelAndView("/product/view");
		mav.addObject("product", ps.productSelectOne(product_idx));
		mav.addObject("imageList", ps.imageSelect(product_idx));
		return mav;
		
	}
}
