package com.ikea.member;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface MemberDAO {

	@Insert("INSERT INTO MEMBER VALUES (MEMBER_SEQ.NEXTVAL, #{member_email}, #{member_pw}, "
			+ "#{member_name1}, #{member_name1_furigana}, #{member_name2}, #{member_name2_furigana}, "
			+ "#{member_birth}, #{member_pnum}, #{member_zipcode}, "
			+ "#{member_address1}, #{member_address2}, #{member_address3}, #{member_address4}, #{member_nearbystore}, "
			+ "#{member_gender}, 'N', SYSDATE)")
	int insert(MemberDTO dto);
	
	@Select("SELECT MEMBER.* FROM MEMBER WHERE MEMBER_EMAIL = #{member_email} AND ROWNUM <= 1")
	MemberDTO emailDupCheck(String member_email);

	@Select("SELECT * FROM MEMBER WHERE MEMBER_EMAIL = #{member_email} AND MEMBER_PW = #{member_pw} AND MEMBER_ISDELETED != 'Y'")
	MemberDTO selectOne(MemberDTO dto);
	
	@Select("SELECT * FROM MEMBER WHERE MEMBER_IDX = #{member_idx}")
	MemberDTO selectOneByIdx(int member_idx);

	@Select("SELECT * FROM MEMBER WHERE MEMBER_EMAIL = #{member_email}")
	MemberDTO selectOneByEmail(String member_email);

	// Dynamic Query使用 (config/member.xml)
	int modifyMember(MemberDTO dto);

	@Update("UPDATE MEMBER SET MEMBER_EMAIL = '(DELETED)${arg1}', MEMBER_ISDELETED = 'Y' WHERE MEMBER_IDX = #{arg0}")
	int deleteAccByIdx(int arg0, String arg1);
}
