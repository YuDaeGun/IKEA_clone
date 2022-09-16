package com.ikea.product;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

//	TABLE INFO

//	PRODUCT
//	PRODUCT_IDX             NUMBER          DEFAULT PRODUCT_SEQ.NEXTVAL PRIMARY KEY,    -- 상품 인덱스
//	PRODUCT_LARGECATEGORY   VARCHAR2(40),   NOT NULL,   -- 대분류 카테고리
//	PRODUCT_MEDIUMCATEGORY  VARCHAR2(40),   NOT NULL,   -- 중분류 카테고리
//	PRODUCT_SMALLCATEGORY   VARCHAR2(40)    NOT NULL,   -- 소분류 카테고리
//	PRODUCT_NAME            VARCHAR2(100)   NOT NULL,   -- 상품명
//	PRODUCT_DESC            VARCHAR2(500),   			-- 상품 상세구성 설명 EX) 침대프레임+침대헤드2 -- (BYTE크기 수정예정)
//	PRODUCT_SUMMARY         VARCHAR2(1000),             -- 제품 간단 설명
//	PRODUCT_DETAILS         VARCHAR2(2000),             -- 제품 상세 설명
//	PRODUCT_LENGTH          NUMBER, -- 상품 길이(cm) (미입력 시 -> 0)
//	PRODUCT_WIDTH           NUMBER, -- 상품 너비(cm)
//	PRODUCT_HEIGHT          NUMBER, -- 상품 높이(cm)
//	PRODUCT_COLOR           VARCHAR2(50),               -- 상품 색상
//	PRODUCT_PRICE           NUMBER          NOT NULL,   -- 상품 가격
//	PRODUCT_STOCK           NUMBER          NOT NULL,   -- 상품 재고
//	PRODUCT_STAR			NUMBER, -- 별점평균
//	PRODUCT_REGDATE         DATE            DEFAULT SYSDATE     -- 상품 등록일

//	PRODUCT_IMAGE
//	IMAGE_IDX               NUMBER          DEFAULT IMAGE_SEQ.NEXTVAL PRIMARY KEY,  -- 상품 이미지 인덱스
//	IMAGE_PI                NUMBER          NOT NULL,   -- FK : 상품 인덱스
//	IMAGE_FILENAME1         VARCHAR2(100)   NOT NULL,   -- 이미지 파일명 (날짜 + UUID난수)
//	IMAGE_FILENAME2         VARCHAR2(100),              -- 마우스 오버시 출력 할 이미지 파일명
//	IMAGE_ISTHUMBNAIL       CHAR(1)         CHECK(IMAGE_ISTHUMBNAIL IN ('Y', 'N')) NOT NULL,  -- 1번 대표 이미지인가? ('Y' OR 'N') 
//	IMAGE_REGDATE           DATE            DEFAULT SYSDATE,     -- 이미지 등록일

public class ProductAndImageDTO {
	private String product_largecategory, product_mediumcategory, product_smallcategory, 
		product_name, product_desc, product_summary, product_details, product_color, product_price_String;
	private int product_idx, product_length, product_width, product_height, product_price, product_stock;
	private double product_star;
	private Date product_regdate;
	
	private String image_filename1, image_filename2, image_isthumbnail;
	private int image_idx, image_pi;
	private Date image_regdate;
	
	private List<MultipartFile> imageFile;
	
	public String getProduct_largecategory() {
		return product_largecategory;
	}
	public void setProduct_largecategory(String product_largecategory) {
		this.product_largecategory = product_largecategory;
	}
	public String getProduct_mediumcategory() {
		return product_mediumcategory;
	}
	public void setProduct_mediumcategory(String product_mediumcategory) {
		this.product_mediumcategory = product_mediumcategory;
	}
	public String getProduct_smallcategory() {
		return product_smallcategory;
	}
	public void setProduct_smallcategory(String product_smallcategory) {
		this.product_smallcategory = product_smallcategory;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_desc() {
		return product_desc;
	}
	public void setProduct_desc(String product_desc) {
		this.product_desc = product_desc;
	}
	public String getProduct_summary() {
		return product_summary;
	}
	public void setProduct_summary(String product_summary) {
		this.product_summary = product_summary;
	}
	public String getProduct_details() {
		return product_details;
	}
	public void setProduct_details(String product_details) {
		this.product_details = product_details;
	}
	public String getProduct_color() {
		return product_color;
	}
	public void setProduct_color(String product_color) {
		this.product_color = product_color;
	}
	public String getProduct_price_String() {
		return product_price_String;
	}
	public void setProduct_price_String(String product_price_String) {
		this.product_price_String = product_price_String;
	}
	public int getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}
	public int getProduct_length() {
		return product_length;
	}
	public void setProduct_length(int product_length) {
		this.product_length = product_length;
	}
	public int getProduct_width() {
		return product_width;
	}
	public void setProduct_width(int product_width) {
		this.product_width = product_width;
	}
	public int getProduct_height() {
		return product_height;
	}
	public void setProduct_height(int product_height) {
		this.product_height = product_height;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getProduct_stock() {
		return product_stock;
	}
	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}
	public double getProduct_star() {
		return product_star;
	}
	public void setProduct_star(double product_star) {
		this.product_star = product_star;
	}
	public Date getProduct_regdate() {
		return product_regdate;
	}
	public void setProduct_regdate(Date product_regdate) {
		this.product_regdate = product_regdate;
	}
	public String getImage_filename1() {
		return image_filename1;
	}
	public void setImage_filename1(String image_filename1) {
		this.image_filename1 = image_filename1;
	}
	public String getImage_filename2() {
		return image_filename2;
	}
	public void setImage_filename2(String image_filename2) {
		this.image_filename2 = image_filename2;
	}
	public String getImage_isthumbnail() {
		return image_isthumbnail;
	}
	public void setImage_isthumbnail(String image_isthumbnail) {
		this.image_isthumbnail = image_isthumbnail;
	}
	public int getImage_idx() {
		return image_idx;
	}
	public void setImage_idx(int image_idx) {
		this.image_idx = image_idx;
	}
	public int getImage_pi() {
		return image_pi;
	}
	public void setImage_pi(int image_pi) {
		this.image_pi = image_pi;
	}
	public Date getImage_regdate() {
		return image_regdate;
	}
	public void setImage_regdate(Date image_regdate) {
		this.image_regdate = image_regdate;
	}
	public List<MultipartFile> getImageFile() {
		return imageFile;
	}
	public void setImageFile(List<MultipartFile> imageFile) {
		this.imageFile = imageFile;
	}
}
