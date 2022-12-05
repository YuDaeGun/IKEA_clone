package com.ikea.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ikea.member.MemberDTO;
import com.ikea.service.MailService;
import com.ikea.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired private MemberService mes;
	@Autowired private MailService ms;
	
	@GetMapping("/alert")
	public void alert() {}

	@GetMapping("/login")	
	public void login() {}
	@PostMapping("/login")
	public String login(MemberDTO dto, HttpSession session, Model model) throws NoSuchAlgorithmException {
		MemberDTO login = mes.selectOne(dto);
		
		if(login == null) {
			model.addAttribute("msg", "入力されたメールアドレスまたはパスワードが間違っています。再度お確かめの上ご入力ください。");
			model.addAttribute("url", "back");
			return "alert";
		}
		session.setAttribute("loginInfo", login);
		session.setMaxInactiveInterval(60 * 60);
		
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session, Model model) {
		session.invalidate();
		
		model.addAttribute("msg", "ログアウトされました。メインページに戻ります。");
		return "alert";
	}
	
	@GetMapping("/join")
	public void join() {}
	@PostMapping("/join")
	public ModelAndView join(MemberDTO dto) throws NoSuchAlgorithmException, NullPointerException {
		ModelAndView mav = new ModelAndView("alert");
		mes.join(dto);
		mav.addObject("msg", "登録完了。ログインページに移動します。");
		mav.addObject("url", "member/login");
		return mav;
	}
	
	@GetMapping("/emailDupCheck/{member_email}")
	@ResponseBody
	public MemberDTO emailDupCheck(@PathVariable String member_email) {
		MemberDTO dto = mes.emailDupCheck(member_email.replaceAll("_", "."));
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
	@PostMapping("/mypage")
	public void mypage(HttpSession session, MemberDTO dto) throws NoSuchAlgorithmException, NullPointerException {
		int member_idx = ((MemberDTO)session.getAttribute("loginInfo")).getMember_idx();
		dto.setMember_idx(member_idx);
		
		mes.modifyMember(dto);
		MemberDTO login = mes.selectOneByIdx(member_idx);
		
		session.setAttribute("loginInfo", login);
		session.setMaxInactiveInterval(60 * 60);
	}
	
	@GetMapping("/delete")	
	public String delete(HttpSession session) {
		int member_idx = ((MemberDTO)session.getAttribute("loginInfo")).getMember_idx();
		String member_email = ((MemberDTO)session.getAttribute("loginInfo")).getMember_email();
		mes.deleteAccByIdx(member_idx, member_email);

		session.invalidate();
		
		return "redirect:/";
	}
	
	@PostMapping(value="/sendMail", produces="application/json; charset=utf-8")
	@ResponseBody
	public String sendMail(@RequestBody String userEmail) 
			throws IOException, AddressException, MessagingException, NoSuchAlgorithmException, NullPointerException {
		int row = ms.sendMail(userEmail);
		return row == 1 ? "「" + userEmail + "」\nに臨時パスワードを送信しました。" : "メール送信に失敗しました。\n"
																		+ "メールアドレスをもう一度確認してください。\n「" + userEmail + "」";
	}
}

