package com.ikea.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ikea.product.CategoryDAO;
import com.ikea.product.ProductAndImageDAO;
import com.ikea.product.ProductAndImageDTO;

@Service
public class ProductService {
	
	@Autowired private CategoryDAO cdao;
	@Autowired private ProductAndImageDAO pdao;
	
	public String[] getLargeCategory() {
		return cdao.getLargeCategory();
	}

	public String[] getSubCategory(String ref) {
		return cdao.getSubCategory(ref);
	}

	public List<ProductAndImageDTO> newProductList() {
		return pdao.newProductList();
	}
}
