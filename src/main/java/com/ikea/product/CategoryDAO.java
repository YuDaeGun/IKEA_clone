package com.ikea.product;

import org.apache.ibatis.annotations.Select;

public interface CategoryDAO {

	@Select("SELECT CATEGORY_NAME FROM PRODUCT_CATEGORY "
			+ "WHERE CATEGORY_REF = #{category_ref} "
			+ "ORDER BY CATEGORY_NAME")
	String[] getSubCategory(String category_ref);

	@Select("SELECT CATEGORY_NAME FROM PRODUCT_CATEGORY "
			+ "WHERE CATEGORY_REF IS NULL")
	String[] getLargeCategory();

}
