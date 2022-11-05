package com.ikea.controller;

import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ikea.product.ProductAndImageDTO;
import com.ikea.service.ProductService;


@Controller
public class CartController {

	@Autowired private ProductService ps;
	
	@GetMapping("product/cart")
	public ModelAndView cart(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("product/cart");
		
		Cookie[] cookieList = request.getCookies();
		String idx = "";
		String number = "";
		for (Cookie cookie : cookieList) {
			if (cookie.getName().equals("IKEA_CART_IDX")) idx = cookie.getValue();
			if (cookie.getName().equals("IKEA_CART_NUMBER")) number = cookie.getValue();
		}
		
		String[] idxArr = idx.split("&");
		String[] numberArr = number.split("&");
		
		ArrayList<ProductAndImageDTO> list = new ArrayList<ProductAndImageDTO>();
		if (idx != "") {
			for (String s : idxArr) {
				list.add(ps.productSelectOneWithImage(Integer.parseInt(s)));
			}
		}
		
		int total = 0;
		for (int i = 0; i < list.size(); i++) {
			total += list.get(i).getProduct_price() * Integer.parseInt(numberArr[i]);
		}
		
		mav.addObject("productList", list);
		mav.addObject("productNumber", numberArr);
		mav.addObject("totalPrice", total);
		mav.addObject("newProducts", ps.newProductList());
		return mav;
	}
	
	@GetMapping("/addCart/{product_idx}")
	@ResponseBody
	public void addCart(@PathVariable String product_idx, 
			HttpServletRequest request, HttpServletResponse response) {
		
		Cookie[] cookieList = request.getCookies();
		String idx = "";
		String number = "";
		for (Cookie cookie : cookieList) {
			if (cookie.getName().equals("IKEA_CART_IDX")) idx = cookie.getValue();
			if (cookie.getName().equals("IKEA_CART_NUMBER")) number = cookie.getValue();
		}
		
		String[] idxArr = idx.split("&");
		String[] numberArr = number.split("&");
		ArrayList<String> list = new ArrayList<String>(Arrays.asList(idxArr));
		
		int cartIdx = list.indexOf(product_idx);
		if (cartIdx == -1) {					//	新たな商品をカートに追加する場合、
			idx = product_idx + "&" + idx;		//	"IKEA_CART_IDX" Cookieに商品番号を記入し、
			number = "1" + "&" + number;		//	"IKEA_CART_NUMBER" Cookieの同じ位置に数量(1)を記入する
		} else { //	既にカートの中に入っている商品を再び追加する場合、IKEA_CART_NUMBERの文字列の中で、当該商品の数量を現す数字を探し、１増加させる
			numberArr[cartIdx] = Integer.parseInt(numberArr[cartIdx]) + 1 + "";
			number = "";
			for (String s : numberArr) number += s + "&";
		}
		
		Cookie cookie1 = new Cookie("IKEA_CART_IDX", idx);
		Cookie cookie2 = new Cookie("IKEA_CART_NUMBER", number);
		cookie1.setDomain("localhost");		cookie2.setDomain("localhost");
		cookie1.setPath("/");				cookie2.setPath("/");
		cookie1.setMaxAge(60 * 60 * 24);	cookie2.setMaxAge(60 * 60 * 24);
		response.addCookie(cookie1);		response.addCookie(cookie2);
	}
	
	@GetMapping("/getCartNumber")
	@ResponseBody
	public int getCartNumber(HttpServletRequest request) {
		
		Cookie[] cookieList = request.getCookies();
		String cart = "";
		for (Cookie cookie : cookieList) {
			if (cookie.getName().equals("IKEA_CART_NUMBER")) cart = cookie.getValue();
		}
		if (cart != "") {
			String[] arr = cart.split("&");
			int number = 0;
			for (String s : arr) number += Integer.parseInt(s);
			return number;
		}
		return 0;
	}
	
	@GetMapping("/deleteCart/{product_idx}")
	public String deleteCart(@PathVariable String product_idx, Model model,
			HttpServletRequest request, HttpServletResponse response) {
		
		Cookie[] cookieList = request.getCookies();
		String idx = "";
		String number = "";
		for (Cookie cookie : cookieList) {
			if (cookie.getName().equals("IKEA_CART_IDX")) idx = cookie.getValue();
			if (cookie.getName().equals("IKEA_CART_NUMBER")) number = cookie.getValue();
		}
		
		String[] idxArr = idx.split("&");
		String[] numberArr = number.split("&");
		ArrayList<String> idxList = new ArrayList<String>(Arrays.asList(idxArr));
		ArrayList<String> numberList = new ArrayList<String>(Arrays.asList(numberArr));
		
		int cartIdx = idxList.indexOf(product_idx);
		idxList.remove(cartIdx);				 numberList.remove(cartIdx);
		idx = "";								 number = "";
		for (String s : idxList) idx += s + "&"; for (String s : numberList) number += s + "&";
		
		Cookie cookie1 = new Cookie("IKEA_CART_IDX", idx);
		Cookie cookie2 = new Cookie("IKEA_CART_NUMBER", number);
		cookie1.setDomain("localhost");		cookie2.setDomain("localhost");
		cookie1.setPath("/");				cookie2.setPath("/");
		cookie1.setMaxAge(60 * 60 * 24);	cookie2.setMaxAge(60 * 60 * 24);
		response.addCookie(cookie1);		response.addCookie(cookie2);
		
		model.addAttribute("url", "product/cart");
		
		return "redirect";
	}
}
