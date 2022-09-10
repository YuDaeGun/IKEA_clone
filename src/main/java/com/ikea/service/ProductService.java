package com.ikea.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ikea.product.CategoryDAO;

@Service
public class ProductService {
	
	@Autowired private CategoryDAO cdao;
	
	public String[] getLargeCategory() {
		return cdao.getLargeCategory();
	}

	public String[] getSubCategory(String ref) {
		return cdao.getSubCategory(ref);
	}
}
