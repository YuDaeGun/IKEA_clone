package com.ikea.member;

import java.sql.Date;

//	TABLE INFO

//	MEMBER_IDX              NUMBER          DEFAULT MEMBER_SEQ.NEXTVAL PRIMARY KEY,     -- 고객 인덱스
//	MEMBER_EMAIL            VARCHAR2(40)    UNIQUE NOT NULL,  -- ID역할
//	MEMBER_PW               VARCHAR2(200)   NOT NULL,
//	MEMBER_NAME             VARCHAR2(20)    NOT NULL,
//	MEMBER_BIRTH            DATE            NOT NULL,
//	MEMBER_PNUM             VARCHAR2(20)    NOT NULL,   -- 전화번호
//	MEMBER_ZIPCODE          VARCHAR2(20)    NOT NULL,   -- 우편번호
//	MEMBER_ADDRESS1         VARCHAR2(200)   NOT NULL,   -- 주소 (API이용시 자동으로 담기는 부분)
//	MEMBER_ADDRESS2         VARCHAR2(100),              -- 상세주소와 참고사항
//	MEMBER_GENDER           CHAR(1)         CHECK(MEMBER_GENDER IN ('M', 'F', 'X')), -- 성별('M' = 남, 'F' = 여, 'X' = 응답거부) 
//	MEMBER_ISDELETED        CHAR(1)         DEFAULT 'N' CHECK(MEMBER_ISDELETED IN ('Y', 'N')), -- 'Y' -> 삭제됨
//	MEMBER_REGDATE          DATE            DEFAULT SYSDATE   -- 회원 가입일

public class MemberDTO {
	
	private String member_email, member_pw, member_name, member_pnum, member_zipcode, 
		member_address1, member_address2, member_gender, member_isdeleted;
	private int member_idx;
	private Date member_birth, member_regdate;
	
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_pnum() {
		return member_pnum;
	}
	public void setMember_pnum(String member_pnum) {
		this.member_pnum = member_pnum;
	}
	public String getMember_zipcode() {
		return member_zipcode;
	}
	public void setMember_zipcode(String member_zipcode) {
		this.member_zipcode = member_zipcode;
	}
	public String getMember_address1() {
		return member_address1;
	}
	public void setMember_address1(String member_address1) {
		this.member_address1 = member_address1;
	}
	public String getMember_address2() {
		return member_address2;
	}
	public void setMember_address2(String member_address2) {
		this.member_address2 = member_address2;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	public String getMember_isdeleted() {
		return member_isdeleted;
	}
	public void setMember_isdeleted(String member_isdeleted) {
		this.member_isdeleted = member_isdeleted;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public Date getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(Date member_birth) {
		this.member_birth = member_birth;
	}
	public Date getMember_regdate() {
		return member_regdate;
	}
	public void setMember_regdate(Date member_regdate) {
		this.member_regdate = member_regdate;
	}
}
