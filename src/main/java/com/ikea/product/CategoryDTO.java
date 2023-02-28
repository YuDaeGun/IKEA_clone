package com.ikea.product;

//	TABLE INFO

//	CATEGORY_NAME           VARCHAR2(50)    NOT NULL, -- カテゴリー名
//	CATEGORY_REF            VARCHAR2(40),			  -- 上位カテゴリー名
//	CATEGORY_DESC           VARCHAR2(1000),   		  -- カテゴリー説明
//	CATEGORY_IMAGE_FILENAME VARCHAR2(100)             -- イメージファイル名

public class CategoryDTO {
	private String category_name, category_ref, category_desc, category_image_filename;

	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getCategory_ref() {
		return category_ref;
	}
	public void setCategory_ref(String category_ref) {
		this.category_ref = category_ref;
	}
	public String getCategory_desc() {
		return category_desc;
	}
	public void setCategory_desc(String category_desc) {
		this.category_desc = category_desc;
	}
	public String getCategory_image_filename() {
		return category_image_filename;
	}
	public void setCategory_image_filename(String category_image_filename) {
		this.category_image_filename = category_image_filename;
	}
}
