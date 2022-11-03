package com.ikea.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.ikea.product.CategoryDAO;
import com.ikea.product.CategoryDTO;
import com.ikea.product.ProductAndImageDAO;
import com.ikea.product.ProductAndImageDTO;

@Service
public class ProductService {
	
	@Autowired private ProductAndImageDAO pdao;
	@Autowired private CategoryDAO cdao;
	private String imageRepoFolder = "D:\\IKEA_productImage";
	
	public ProductService() {
		File dir = new File(imageRepoFolder);
		if(dir.exists() && dir.isFile()) dir.delete();
		if(dir.exists() == false) dir.mkdirs();
	}
	
	public int productInsert(ProductAndImageDTO dto) {
		dto.setProduct_price(Integer.parseInt(dto.getProduct_price_String().replace(",", "")));
		return pdao.productInsert(dto);
	}
	@Transactional
	public int imageInsert(List<MultipartFile> imageFileList) throws IllegalStateException, IOException {
		int image_pi = pdao.getLastProductIdx();	// 마지막에 등록된 상품의 인덱스
		for (int i = 0; i < imageFileList.size(); i++) {
			MultipartFile imageFile = imageFileList.get(i);
			if (imageFile.getSize() == 0) continue;
			
			SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
			String today = sdf.format(new Date());
			String newFileName = UUID.randomUUID().toString().replaceAll("-", "");

			String originalName = imageFile.getOriginalFilename();
			String extName = originalName.substring(originalName.lastIndexOf("."));
			
			newFileName = today + "_" + newFileName + extName;
			
			File dest = new File(imageRepoFolder, newFileName);
			imageFile.transferTo(dest);
			
			if (i == 1) {
				int image_idx = pdao.getLastImageIdx();	// 마지막에 등록된 이미지의 인덱스
				pdao.insertFilename2(image_idx, newFileName);
				continue;
			}

			ProductAndImageDTO dto = new ProductAndImageDTO();
			dto.setImage_pi(image_pi);
			dto.setImage_filename1(newFileName);
			dto.setImage_isthumbnail(i == 0 ? "Y" : "N");
			
			pdao.imageInsert(dto);
		}
		return image_pi;
	}

	public int productModify(ProductAndImageDTO dto) {
		dto.setProduct_price(Integer.parseInt(dto.getProduct_price_String().replaceAll(",", "")));
		return pdao.productModify(dto);
	}
	@Transactional
	public int imageModify(List<MultipartFile> imageFileList, int product_idx) throws IllegalStateException, IOException {
		int image_pi = product_idx;		// 수정 할 상품의 인덱스
		pdao.deleteOldImage(image_pi);	// 원래 있던 이미지(들) 삭제
		for (int i = 0; i < imageFileList.size(); i++) {
			MultipartFile imageFile = imageFileList.get(i);
			if (imageFile.getSize() == 0) continue;
			
			SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
			String today = sdf.format(new Date());
			String newFileName = UUID.randomUUID().toString().replaceAll("-", "");

			String originalName = imageFile.getOriginalFilename();
			String extName = originalName.substring(originalName.lastIndexOf("."));
			
			newFileName = today + "_" + newFileName + extName;
			
			File dest = new File(imageRepoFolder, newFileName);
			imageFile.transferTo(dest);
			
			if (i == 1) {
				int image_idx = pdao.getLastImageIdx();	// 마지막에 등록된 이미지의 인덱스
				pdao.insertFilename2(image_idx, newFileName);
				continue;
			}

			ProductAndImageDTO dto = new ProductAndImageDTO();
			dto.setImage_pi(image_pi);
			dto.setImage_filename1(newFileName);
			dto.setImage_isthumbnail(i == 0 ? "Y" : "N");
			
			pdao.imageInsert(dto);
		}
		return 1;
	}
	
	public List<ProductAndImageDTO> newProductList() {
		return pdao.newProductList();
	}
	
	public String[] getSubCategory(String ref) {
		return cdao.getSubCategory(ref);
	}
	
	public List<CategoryDTO> getSubCateWithImage(String ref) {
		return cdao.getSubCateWithImage(ref);
	}

	public String[] getLargeCategory() {
		return cdao.getLargeCategory();
	}

	public ProductAndImageDTO productSelectOne(int product_idx) {
		return pdao.productSelectOne(product_idx);
	}

	public ProductAndImageDTO productSelectOneWithImage(int product_idx) {
		return pdao.productSelectOneWithImage(product_idx);
	}

	public List<ProductAndImageDTO> imageSelect(int product_idx) {
		return pdao.imageSelect(product_idx);
	}

	public List<ProductAndImageDTO> largeCateView(String product_category) {
		return pdao.largeCateView(product_category);
	}
	public List<ProductAndImageDTO> mediumCateView(String product_category) {
		return pdao.mediumCateView(product_category);
	}
	public List<ProductAndImageDTO> smallCateView(String product_category) {
		return pdao.smallCateView(product_category);
	}

	public String getCateDesc(String category_name) {
		return cdao.getCateDesc(category_name);
	}

	public List<ProductAndImageDTO> searchView(String keyword) {
		return pdao.searchView(keyword);
	}

}
