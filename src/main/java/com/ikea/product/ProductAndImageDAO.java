package com.ikea.product;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface ProductAndImageDAO {

	@Select("SELECT PRODUCT.*, PRODUCT_IMAGE.IMAGE_FILENAME1, PRODUCT_IMAGE.IMAGE_FILENAME2 "
			+ "FROM PRODUCT JOIN PRODUCT_IMAGE ON PRODUCT_IDX = IMAGE_PI "
			+ "WHERE IMAGE_ISTHUMBNAIL = 'Y'")
	List<ProductAndImageDTO> newProductList();
	
}
