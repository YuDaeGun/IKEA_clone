package com.ikea.product;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface CategoryDAO {

	@Select("SELECT CATEGORY_NAME FROM PRODUCT_CATEGORY "
			+ "WHERE CATEGORY_REF = #{category_ref} ")
	String[] getSubCategory(String category_ref);

	@Select("SELECT * FROM PRODUCT_CATEGORY "
			+ "WHERE CATEGORY_REF = #{category_ref}")
	List<CategoryDTO> getSubCateWithImage(String category_ref);
	
	@Select("SELECT CATEGORY_NAME FROM PRODUCT_CATEGORY "
			+ "WHERE CATEGORY_REF IS NULL")
	String[] getLargeCategory();

	@Select("SELECT CATEGORY_DESC FROM PRODUCT_CATEGORY WHERE CATEGORY_NAME = #{category_name}")
	String getCateDesc(String category_name);

}
