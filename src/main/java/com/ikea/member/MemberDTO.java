package com.ikea.member;

import java.sql.Date;

//	TABLE INFO

//	MEMBER_IDX              NUMBER          DEFAULT MEMBER_SEQ.NEXTVAL PRIMARY KEY,
//	MEMBER_EMAIL            VARCHAR2(50)    NOT NULL,   -- IDの役割
//	MEMBER_PW               VARCHAR2(200)   NOT NULL,
//	MEMBER_NAME1            VARCHAR2(50)    NOT NULL,   -- 姓
//	MEMBER_NAME1_FURIGANA   VARCHAR2(50)    NOT NULL,   -- 姓(フリガナ)
//	MEMBER_NAME2            VARCHAR2(50)    NOT NULL,   -- 名
//	MEMBER_NAME2_FURIGANA   VARCHAR2(50)    NOT NULL,   -- 名(フリガナ)
//	MEMBER_BIRTH            DATE            NOT NULL,
//	MEMBER_PNUM             VARCHAR2(30)    NOT NULL,   -- 電話番号
//	MEMBER_ZIPCODE          VARCHAR2(30)    NOT NULL,   -- 郵便番号
//	MEMBER_ADDRESS1         VARCHAR2(200)   NOT NULL,   -- 都道府県
//	MEMBER_ADDRESS2         VARCHAR2(100),              -- 市区町村
//	MEMBER_ADDRESS3         VARCHAR2(100),              -- 丁番地
//	MEMBER_ADDRESS4         VARCHAR2(100),              -- 建物名・部屋番号 （オプション）
//	MEMBER_NEARBYSTORE      VARCHAR2(100),              -- 近くのイケア店舗
//	MEMBER_GENDER           CHAR(1)         CHECK(MEMBER_GENDER IN ('M', 'F', 'X')), -- 性別('M' = 男, 'F' = 女, 'X' = 応答拒否) 
//	MEMBER_ISDELETED        CHAR(1)         DEFAULT 'N' CHECK(MEMBER_ISDELETED IN ('Y', 'N')), -- 'Y' -> 削除済み
//	MEMBER_REGDATE          DATE            DEFAULT SYSDATE

public class MemberDTO {
	private String member_email, member_pw, member_name1, member_name1_furigana, member_name2, member_name2_furigana,
		member_pnum, member_zipcode, member_address1, member_address2, member_address3, member_address4, member_nearbystore,
		member_gender, member_isdeleted;
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
	public String getMember_name1() {
		return member_name1;
	}
	public void setMember_name1(String member_name1) {
		this.member_name1 = member_name1;
	}
	public String getMember_name1_furigana() {
		return member_name1_furigana;
	}
	public void setMember_name1_furigana(String member_name1_furigana) {
		this.member_name1_furigana = member_name1_furigana;
	}
	public String getMember_name2() {
		return member_name2;
	}
	public void setMember_name2(String member_name2) {
		this.member_name2 = member_name2;
	}
	public String getMember_name2_furigana() {
		return member_name2_furigana;
	}
	public void setMember_name2_furigana(String member_name2_furigana) {
		this.member_name2_furigana = member_name2_furigana;
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
	public String getMember_address3() {
		return member_address3;
	}
	public void setMember_address3(String member_address3) {
		this.member_address3 = member_address3;
	}
	public String getMember_address4() {
		return member_address4;
	}
	public void setMember_address4(String member_address4) {
		this.member_address4 = member_address4;
	}
	public String getMember_nearbystore() {
		return member_nearbystore;
	}
	public void setMember_nearbystore(String member_nearbystore) {
		this.member_nearbystore = member_nearbystore;
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
