package com.ikea.controller;

import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class CartController {

	@GetMapping("/addCart/{product_idx}")
	@ResponseBody
	public void addCart(@PathVariable String product_idx, 
			HttpServletRequest request, HttpServletResponse response) {
		
		Cookie[] cookieList = request.getCookies();
		String cart = "";
		for (Cookie cookie : cookieList) {
			if (cookie.getName().equals("IKEA_CART")) {
				cart = cookie.getValue();
			}
		}
		
		String[] arr = cart.split("&");
		ArrayList<String> list = new ArrayList<String>(Arrays.asList(arr));
		
		if (list.contains(product_idx) == false) {
			cart = cart + product_idx + "&";
		}
		
		Cookie cookie = new Cookie("IKEA_CART", cart);
		cookie.setDomain("localhost");
		cookie.setPath("/");
		cookie.setMaxAge(60 * 60 * 24);
		response.addCookie(cookie);
	}
	
	@GetMapping("/getCartNumber")
	@ResponseBody
	public int getCartNumber(HttpServletRequest request) {
		
		Cookie[] cookieList = request.getCookies();
		String cart = "";
		for (Cookie cookie : cookieList) {
			if (cookie.getName().equals("IKEA_CART")) {
				cart = cookie.getValue();
			}
		}
		if (cart != "") {
			String[] arr = cart.split("&");
			return arr.length;
		}
		return 0;
	}
	
	@GetMapping("/getCart")
	public String getCart(HttpServletRequest request) {
		
		Cookie[] list = request.getCookies();
		for (Cookie cookie : list) {
			if (cookie.getName().equals("IKEA_CART")) {
				System.out.println("쿠키 확인 : " + cookie.getValue());
			}
		}
		return "redirect:/";
	}
	
	@GetMapping("/deleteCart")
	public String deleteCart(HttpServletRequest request, HttpServletResponse response) {
		Cookie cookie = new Cookie("IKEA_CART", null);
		cookie.setDomain("localhost");
		cookie.setPath("/");
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		
		return "redirect:/";
	}
}
