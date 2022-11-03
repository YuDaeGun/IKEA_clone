package com.ikea.product;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface ProductAndImageDAO {

	@Select("SELECT * FROM (SELECT PRODUCT.*, PRODUCT_IMAGE.IMAGE_FILENAME1, PRODUCT_IMAGE.IMAGE_FILENAME2 "
			+ "FROM PRODUCT JOIN PRODUCT_IMAGE ON PRODUCT_IDX = IMAGE_PI "
			+ "WHERE IMAGE_ISTHUMBNAIL = 'Y' ORDER BY PRODUCT_IDX DESC) WHERE ROWNUM <= 10")
	List<ProductAndImageDTO> newProductList();
	
	@Insert("INSERT INTO PRODUCT (PRODUCT_LARGECATEGORY, PRODUCT_MEDIUMCATEGORY, PRODUCT_SMALLCATEGORY, PRODUCT_NAME, PRODUCT_DESC, PRODUCT_SUMMARY, PRODUCT_DETAILS, "
			+ "PRODUCT_LENGTH, PRODUCT_WIDTH, PRODUCT_HEIGHT, PRODUCT_COLOR, PRODUCT_PRICE, PRODUCT_STOCK) "
			+ "VALUES ( #{product_largecategory}, #{product_mediumcategory}, #{product_smallcategory}, #{product_name}, #{product_desc}, #{product_summary}, #{product_details}, "
			+ "#{product_length}, #{product_width}, #{product_height}, #{product_color}, #{product_price}, #{product_stock} )")
	int productInsert(ProductAndImageDTO dto);
	
	@Insert("INSERT INTO PRODUCT_IMAGE (IMAGE_PI, IMAGE_FILENAME1, IMAGE_ISTHUMBNAIL)"
			+ " VALUES ( #{image_pi}, #{image_filename1}, #{image_isthumbnail} )")
	int imageInsert(ProductAndImageDTO dto);

	@Select("SELECT PRODUCT_IDX FROM (SELECT * FROM PRODUCT ORDER BY PRODUCT_IDX DESC) WHERE ROWNUM = 1")
	int getLastProductIdx();

	@Select("SELECT IMAGE_IDX FROM (SELECT * FROM PRODUCT_IMAGE ORDER BY IMAGE_IDX DESC) WHERE ROWNUM = 1")
	int getLastImageIdx();
	
	@Select("SELECT * FROM PRODUCT WHERE PRODUCT_IDX = #{product_idx}")
	ProductAndImageDTO productSelectOne(int product_idx);

	@Select("SELECT PRODUCT.*, PRODUCT_IMAGE.IMAGE_FILENAME1 "
			+ "FROM PRODUCT JOIN PRODUCT_IMAGE ON PRODUCT_IDX = IMAGE_PI "
			+ "WHERE PRODUCT_IDX = #{product_idx} AND ROWNUM = 1")
	ProductAndImageDTO productSelectOneWithImage(int product_idx);

	@Select("SELECT * FROM PRODUCT_IMAGE WHERE IMAGE_PI = #{product_idx} ORDER BY IMAGE_IDX")
	List<ProductAndImageDTO> imageSelect(int product_idx);
	
	@Delete("DELETE FROM PRODUCT_IMAGE WHERE IMAGE_PI = #{image_pi}")
	void deleteOldImage(int image_pi);

	@Update("UPDATE PRODUCT SET PRODUCT_LARGECATEGORY=#{product_largecategory}, PRODUCT_MEDIUMCATEGORY=#{product_mediumcategory}, "
			+ "PRODUCT_SMALLCATEGORY=#{product_smallcategory}, PRODUCT_NAME=#{product_name}, PRODUCT_DESC=#{product_desc}, "
			+ "PRODUCT_SUMMARY=#{product_summary}, PRODUCT_DETAILS=#{product_details}, "
			+ "PRODUCT_LENGTH=#{product_length}, PRODUCT_WIDTH=#{product_width}, PRODUCT_HEIGHT=#{product_height}, "
			+ "PRODUCT_COLOR=#{product_color}, PRODUCT_PRICE=#{product_price}, PRODUCT_STOCK=#{product_stock} "
			+ "WHERE PRODUCT_IDX=#{product_idx}")
	int productModify(ProductAndImageDTO dto);

	@Update("UPDATE PRODUCT_IMAGE SET IMAGE_FILENAME2 = #{arg1} WHERE IMAGE_IDX=#{arg0}")
	int insertFilename2(int arg0, String arg1);

	@Select("SELECT PRODUCT.*, PRODUCT_IMAGE.IMAGE_FILENAME1, PRODUCT_IMAGE.IMAGE_FILENAME2 "
			+ "FROM PRODUCT JOIN PRODUCT_IMAGE ON PRODUCT_IDX = IMAGE_PI "
			+ "WHERE IMAGE_ISTHUMBNAIL = 'Y' AND PRODUCT_LARGECATEGORY = #{product_category} ORDER BY PRODUCT_IDX DESC")
	List<ProductAndImageDTO> largeCateView(String product_category);
	@Select("SELECT PRODUCT.*, PRODUCT_IMAGE.IMAGE_FILENAME1, PRODUCT_IMAGE.IMAGE_FILENAME2 "
			+ "FROM PRODUCT JOIN PRODUCT_IMAGE ON PRODUCT_IDX = IMAGE_PI "
			+ "WHERE IMAGE_ISTHUMBNAIL = 'Y' AND PRODUCT_MEDIUMCATEGORY = #{product_category} ORDER BY PRODUCT_IDX DESC")
	List<ProductAndImageDTO> mediumCateView(String product_category);
	@Select("SELECT PRODUCT.*, PRODUCT_IMAGE.IMAGE_FILENAME1, PRODUCT_IMAGE.IMAGE_FILENAME2 "
			+ "FROM PRODUCT JOIN PRODUCT_IMAGE ON PRODUCT_IDX = IMAGE_PI "
			+ "WHERE IMAGE_ISTHUMBNAIL = 'Y' AND PRODUCT_SMALLCATEGORY = #{product_category} ORDER BY PRODUCT_IDX DESC")
	List<ProductAndImageDTO> smallCateView(String product_category);

	@Select("SELECT PRODUCT.*, PRODUCT_IMAGE.IMAGE_FILENAME1, PRODUCT_IMAGE.IMAGE_FILENAME2 "
			+ "FROM PRODUCT JOIN PRODUCT_IMAGE ON PRODUCT_IDX = IMAGE_PI "
			+ "WHERE IMAGE_ISTHUMBNAIL = 'Y' AND UPPER (PRODUCT_NAME) LIKE UPPER ('%${keyword}%')")
	List<ProductAndImageDTO> searchView(String keyword);

	
}
