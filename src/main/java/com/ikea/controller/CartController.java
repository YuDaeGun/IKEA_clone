package com.ikea.controller;

import java.util.Arrays;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class CartController {

	@GetMapping("/addCart/{product_idx}/{product_name}")
	public ModelAndView addCookie(@PathVariable int product_idx, @PathVariable String product_name, 
			HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("member/alert");
		
		Cookie[] list = request.getCookies();
		String cart = "";
		for (Cookie cookie : list) {
			if (cookie.getName().equals("IKEA_CART")) {
				cart = cookie.getValue();
			}
		}
		
		System.out.println("카트 문자열 : " + cart);
		String[] arr = cart.split("&");
		System.out.println("카트 속 상품 : " + Arrays.toString(arr));
		
		
		cart = cart + product_idx + "&";
		
		Cookie cookie = new Cookie("IKEA_CART", cart);
		cookie.setDomain("localhost");
		cookie.setPath("/");
		cookie.setMaxAge(60 * 60 * 24);
		response.addCookie(cookie);
		
		mav.addObject("msg", "「" + product_name + "」がカートに追加されました。");
		mav.addObject("url", "back");
		return mav;
	}
	
	@GetMapping("/getCart")
	public String getCookie(HttpServletRequest request) {
		
		Cookie[] list = request.getCookies();
		for (Cookie cookie : list) {
			if (cookie.getName().equals("IKEA_CART")) {
				System.out.println("쿠키 확인 : " + cookie.getValue());
			}
		}
		return "redirect:/";
	}
	
	@GetMapping("/resetCart")
	public String deleteCookie(HttpServletRequest request, HttpServletResponse response) {
		Cookie cookie = new Cookie("IKEA_CART", null);
		cookie.setDomain("localhost");
		cookie.setPath("/");
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		
		return "redirect:/";
	}
}
