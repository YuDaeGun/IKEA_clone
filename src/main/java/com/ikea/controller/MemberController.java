package com.ikea.controller;

import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@GetMapping("/alert")
	public void alert() {}

	@GetMapping("/login")	
	public void login() {}
	@PostMapping("/login")
	public String login(MemberDTO dto, HttpSession session, Model model) throws NoSuchAlgorithmException {
		MemberDTO login = mes.selectOne(dto);
		
		if(login == null) {
			model.addAttribute("url", "back");
			model.addAttribute("msg", "入力されたメールアドレスまたはパスワードが間違っています。再度お確かめの上ご入力ください。");
			return "member/alert";
		}
		session.setAttribute("loginInfo", login);
		session.setMaxInactiveInterval(60 * 60);
		
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request, Model model) {
		request.getSession().invalidate();
		
		model.addAttribute("msg", "ログアウトされました。メインページに戻ります。");
		return "member/alert";
	}
	
	@GetMapping("/join")
	public void join() {}
	@PostMapping("/join")
	public ModelAndView join(MemberDTO dto) throws NoSuchAlgorithmException, NullPointerException {
		ModelAndView mav = new ModelAndView("member/alert");
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

	@GetMapping("/pwMatchCheck/{member_pw}")
	@ResponseBody
	public MemberDTO pwMatchCheck(@PathVariable String member_pw, HttpSession session) throws NoSuchAlgorithmException, NullPointerException {
		String member_email = ((MemberDTO)session.getAttribute("loginInfo")).getMember_email();
		
		MemberDTO dto = new MemberDTO();
		dto.setMember_email(member_email);
		dto.setMember_pw(member_pw);
		dto = mes.selectOne(dto);
		
		return dto;
	}
	
	@GetMapping("/mypage")
	public void mypage() {}
}

