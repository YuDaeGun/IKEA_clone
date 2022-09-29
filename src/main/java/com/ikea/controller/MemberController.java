package com.ikea.controller;

import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ikea.member.MemberDTO;
import com.ikea.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired private MemberService mes;

	@GetMapping("/login")	
	public void login() {}
	
	@GetMapping("/join")
	public void join() {}
	
	@PostMapping("/join")
	public ModelAndView join(MemberDTO dto) throws NoSuchAlgorithmException, NullPointerException {
		ModelAndView mav = new ModelAndView("alert");
		int row = mes.join(dto);
		mav.addObject("msg", "登録完了。ログインページに移動します。");
		mav.addObject("url", "member/login");
		return mav;
	}
	
	@GetMapping("/emailDupCheck/{member_email}")
	@ResponseBody
	public MemberDTO emailDupCheck(@PathVariable String member_email) {
		MemberDTO dto = mes.emailDupCheck(member_email.replace("_", "."));
		return dto;
	}
}

