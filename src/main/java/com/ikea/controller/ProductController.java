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
		mav.addObject("newProducts", ps.newProductList());	// 신상품 10개
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
		return ps.getSubCategory(ref);
	}
	
	@GetMapping("/product/view/{product_idx}")
	public ModelAndView productView(@PathVariable int product_idx) {
		ModelAndView mav = new ModelAndView("/product/view");
		mav.addObject("p", ps.productSelectOne(product_idx));		// 해당 상품
		mav.addObject("imageList", ps.imageSelect(product_idx));	// 해당상품의 이미지(들)
		mav.addObject("newProducts", ps.newProductList());	// 신상품 10개
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
	
	@GetMapping("/product/categoryView/{large_medium_small}")
	public ModelAndView categoryView(@PathVariable String large_medium_small) {
		ModelAndView mav = new ModelAndView("/product/categoryView");

		String largecate = large_medium_small.split("_")[0];
		String mediumcate = null;
		String smallcate = null;
		mav.addObject("largecate", largecate);

		if (large_medium_small.split("_").length == 3) {	// 대,중,소분류 카테고리 모두 받았을 때
			mediumcate = large_medium_small.split("_")[1];
			smallcate = large_medium_small.split("_")[2];
			mav.addObject("smallcate", smallcate);
			mav.addObject("mediumcate", mediumcate);
			
			mav.addObject("cateDesc", ps.getCateDesc(smallcate));
			mav.addObject("productList", ps.smallCateView(smallcate));
			return mav;
		} else if (large_medium_small.split("_").length == 2) {	// 대,중분류 카테고리만 받았을 때
			mediumcate = large_medium_small.split("_")[1];
			mav.addObject("mediumcate", mediumcate);
			
			mav.addObject("cateDesc", ps.getCateDesc(mediumcate));
			mav.addObject("productList", ps.mediumCateView(mediumcate));
			
			mav.addObject("smallcateList", ps.getSubCateWithImage(mediumcate));
			return mav;
		}
		// 대분류 카테고리만 받았을 때
		mav.addObject("cateDesc", ps.getCateDesc(largecate));
		mav.addObject("productList", ps.largeCateView(largecate));
		
		mav.addObject("mediumcateList", ps.getSubCateWithImage(largecate));
		return mav;
	}
	
	@GetMapping("/product/searchView/{keyword}")
	public ModelAndView searchView(@PathVariable String keyword) {
		ModelAndView mav = new ModelAndView("/product/searchView");
		mav.addObject("productList", ps.searchView(keyword));
		
		return mav;
	}
}
