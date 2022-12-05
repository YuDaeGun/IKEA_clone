package com.ikea.service;

import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.Properties;
import java.util.Scanner;
import java.util.UUID;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

import com.ikea.component.HashComponent;
import com.ikea.member.MemberDAO;
import com.ikea.member.MemberDTO;

@Service
public class MailService {
	
	@Autowired private MemberDAO dao;
	@Autowired private HashComponent hs;
	
	@Value("classpath:account.txt")	// "[id]\n[pw]"って記入しておいた
	private Resource account;

	public int sendMail(String userEmail) throws IOException, NoSuchAlgorithmException, NullPointerException {
		MemberDTO dto = dao.selectOneByEmail(userEmail);
		if (dto == null) return -1;
		
		File f = account.getFile();
		Scanner sc = new Scanner(f);
		
		String serverId = sc.nextLine();
		String serverPw = sc.nextLine();
		sc.close();
		
		String host = "smtp.naver.com";
		int port = 465;
		
		Properties props = System.getProperties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		
		Session mailSession = Session.getDefaultInstance(props, new Authenticator() {
			String id = serverId;
			String pw = serverPw;
			
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(id, pw);
			}
		});
//		mailSession.setDebug(true);
		
		Message mimeMessage = new MimeMessage(mailSession);
		try {
			InternetAddress from = new InternetAddress("udaegun@naver.com", "IKEA_clone");
			InternetAddress to = new InternetAddress(userEmail);

			mimeMessage.setFrom(from);
			mimeMessage.setRecipient(Message.RecipientType.TO, to);
			
			String newPw = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 10);
			
			mimeMessage.setSubject("臨時パスワード");
			mimeMessage.setText(dto.getMember_name1() + "様に臨時発行されたパスワードは「" + newPw + "」です。\n"
					+ "臨時パスワードを使用してログインした後、設定したいパスワードに変更してください。");
			Transport.send(mimeMessage);

			dto.setMember_pw(hs.getHash(newPw));
			dao.modifyMember(dto);
			
			return 1;
		} catch (AddressException e) {
			e.printStackTrace();
			return -2;
		} catch (MessagingException e) {
			e.printStackTrace();
			return -3;
		}
	}
	
}