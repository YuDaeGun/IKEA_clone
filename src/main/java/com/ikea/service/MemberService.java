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
		dto.setMember_pw(hs.getHash(dto.getMember_pw()));
		return dao.insert(dto);		
	}

	public MemberDTO emailDupCheck(String member_email) {
		return dao.emailDupCheck(member_email);
	}

	public MemberDTO selectOne(MemberDTO dto) throws NoSuchAlgorithmException, NullPointerException {
		dto.setMember_pw(hs.getHash(dto.getMember_pw()));
		return dao.selectOne(dto);
	}

	public int modifyMember(MemberDTO dto) throws NoSuchAlgorithmException, NullPointerException {
		if (dto.getMember_pw() != null) {
			dto.setMember_pw(hs.getHash(dto.getMember_pw()));
		}
		return dao.modifyMember(dto);
	}

	public MemberDTO selectOneByIdx(int member_idx) {
		return dao.selectOneByIdx(member_idx);
	}
	
}
