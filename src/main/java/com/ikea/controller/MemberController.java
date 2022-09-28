package com.ikea.controller;

import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String join(MemberDTO dto) throws NoSuchAlgorithmException, NullPointerException {
		int row = mes.join(dto);
		System.out.println(row != 0 ? "가입 성공" : "가입 실패");
		return "redirect:/member/login";
	}
}

