package com.ikea.service;

import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ikea.component.HashComponent;
import com.ikea.member.MemberDAO;
import com.ikea.member.MemberDTO;

@Service
public class MemberService {
	
	@Autowired private MemberDAO dao;
	@Autowired private HashComponent hs;
	
	public int join(MemberDTO dto) throws NoSuchAlgorithmException, NullPointerException {
		String hash = hs.getHash(dto.getMember_pw());
		dto.setMember_pw(hash);
		int row = dao.insert(dto);
		return row;		
	}

	public String emailDupCheck(String member_email) {
		String row = dao.emailDupCheck(member_email);
		System.out.println("서비스 중복확인 : " + row);
		return row;
	}
}
