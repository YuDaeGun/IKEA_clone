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
		mav.addObject("msg", "登録失敗。入力情報をもう一度確認してください。");
		if (dto.getMember_pw().equals(dto.getMember_pw_re())) {
			mes.join(dto);
			mav.addObject("msg", "登録完了。ログインページに移動します。");
			mav.addObject("url", "member/login");
		}
		return mav;
	}
	
	@GetMapping("/emailDupCheck/{email}")
	@ResponseBody
	public String emailDupCheck(@PathVariable String email) {
		System.out.println("실행되나?");
		String row = mes.emailDupCheck(email);
		System.out.println("컨트롤러 중복 확인 : " + row);
		return row;
	}
}

