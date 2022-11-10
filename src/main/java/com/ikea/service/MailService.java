package com.ikea.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Properties;
import java.util.Scanner;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

@Service
public class MailService {
	
	@Value("classpath:account.txt")	// "[id]\n[pw]"って記入しておいた
	private Resource account;

	public int sendMail(String userEmail) throws IOException {
		System.out.println("서비스 실행 : " + userEmail);
		String targetAddress = userEmail;

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
			InternetAddress from = new InternetAddress("udaegun@naver.com");
			InternetAddress to = new InternetAddress(targetAddress);

			mimeMessage.setFrom(from);
			mimeMessage.setRecipient(Message.RecipientType.TO, to);
			
			mimeMessage.setSubject("title테스트");
			mimeMessage.setText("content테스트");
			Transport.send(mimeMessage);
			return 1;
		} catch (AddressException e) {
			e.printStackTrace();
			return -1;
		} catch (MessagingException e) {
			e.printStackTrace();
			return -2;
		}
	}
	
}