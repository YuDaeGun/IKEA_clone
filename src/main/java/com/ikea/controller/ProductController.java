package com.ikea.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ikea.product.ProductAndImageDTO;
import com.ikea.service.ProductService;

@Controller
public class ProductController {
	private int product_idx = 0;
	
	@Autowired
	private ProductService ps;

	@RequestMapping("/")
	public ModelAndView newProductList() {
		ModelAndView mav = new ModelAndView("/home");
		mav.addObject("newProducts", ps.newProductList());
		return mav;
	}

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
	
	@GetMapping("/product/view/{product_idx}")
	public ModelAndView productView(@PathVariable int product_idx) {
		ModelAndView mav = new ModelAndView("/product/view");
		mav.addObject("p", ps.productSelectOne(product_idx));
		mav.addObject("imageList", ps.imageSelect(product_idx));
		return mav;
		
	}
	
	@GetMapping("/product/insertForm")
	public void productInsert() {}
	@PostMapping("/product/insertForm")
	public ModelAndView productInsert(ProductAndImageDTO dto) throws Exception {
		List<MultipartFile> imageFileList = dto.getImageFile();
		
		ps.productInsert(dto);	// 상품 등록
		product_idx = ps.imageInsert(imageFileList);	// 이미지(들) 등록 후 마지막에 등록된 상품의 인덱스를 반환

		ModelAndView mav = new ModelAndView("/product/insertResult");
		mav.addObject("p", ps.productSelectOne(product_idx));
		mav.addObject("imageList", ps.imageSelect(product_idx));
		return mav;
	}
	
	@GetMapping("/product/modifyForm/{product_idx}")
	public ModelAndView productModify(@PathVariable int product_idx) {
		ModelAndView mav = new ModelAndView("/product/modifyForm");
		mav.addObject("p", ps.productSelectOne(product_idx));
		mav.addObject("imageList", ps.imageSelect(product_idx));
		return mav;
	}
	@PostMapping("/product/modifyForm/{product_idx}")
	public ModelAndView productModify(@PathVariable int product_idx, ProductAndImageDTO dto) throws Exception {
		dto.setProduct_idx(product_idx);
		List<MultipartFile> imageFileList = dto.getImageFile();
		
		ps.productModify(dto);
		ps.imageModify(imageFileList, product_idx);

		ModelAndView mav = new ModelAndView("/product/insertResult");
		mav.addObject("p", ps.productSelectOne(product_idx));
		mav.addObject("imageList", ps.imageSelect(product_idx));
		return mav;
	}
	
	@GetMapping("/product/categoryView/{product_category}")
	public ModelAndView categoryView(@PathVariable String product_category) {
		
		
		ModelAndView mav = new ModelAndView("/product/categoryView");
		mav.addObject("productList", ps.categoryView(product_category));
		return mav;
	}
}
