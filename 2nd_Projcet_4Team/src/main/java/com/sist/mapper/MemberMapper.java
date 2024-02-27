package com.sist.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.MemberVO;

public interface MemberMapper {
    @Select("SELECT m.userId, m.userPwd, m.userName, m.nickname, m.birthday, m.gender, "
    		+ "m.email, m.phone, m.post, m.addr, m.detail_addr, m.hope_job, m.regdate, m.mentor, "
    		+ "a.authority "
    		+ "FROM MEMBER m JOIN authority a ON m.userId = a.userId "
    		+ "WHERE m.userId = #{userId}")
    public MemberVO getMemberByID(String userId); // 아이디로 회원정보 조회

    @Select("SELECT COUNT(*) FROM MEMBER WHERE userId=#{userId}")
    public int getIDCount(String userId); // 아이디 중복 조회

    @Select("SELECT COUNT(*) FROM MEMBER WHERE NICKNAME=#{nickname}")
    public int getNicknameCount(String nickname); // 닉네임 중복 조회

    @Insert("INSERT INTO member(userId,userPwd,userName,nickname,birthday,gender,email,phone,post,addr,detail_addr,hope_job,regdate) VALUES (" +
    		"#{userId}," +
    		"#{userPwd}," +
    		"#{userName}," +
            "#{nickname}," +
            "#{birthday}," +
            "#{gender}," +
            "#{email}," +
            "#{phone}," +
            "#{post}," +
            "#{addr}," +
            "#{detail_addr}," +
            "#{hope_job}," +
            "SYSDATE)")
    public int joinMember(MemberVO vo); // 회원가입

    @Insert("insert into authority values(#{userId},'ROLE_USER')")
	public void memberAuthorityInsert(String userId); // 회원 권한부여

	@Select("SELECT m.userId,userName,userPwd,enabled,authority "
			  +"FROM Member m,Authority a "
			  +"WHERE m.userId=a.userId "
			  +"AND m.userId=#{userId}")
	   public MemberVO login(String userId); // 로그인

    @Update("UPDATE MEMBER SET " +
                "NICKNAME=#{nickname}," +
                "USERPWD=#{userPwd}," +
                "GENDER=#{gender}," +
                "PHONE=#{phone}," +
                "EMAIL=#{email}," +
                "BIRTHDAY=#{birthday}," +
                "POST=#{post}," +
                "ADDR=#{addr}," +
                "DETAIL_ADDR=#{detail_addr}, " + 
                "HOPE_JOB=#{hope_job} " +
            "WHERE USERID=#{userId}")
    public int updateMember(MemberVO vo); // 회원정보 수정

    @Update("UPDATE MEMBER SET "
  		  +"lastlogin=SYSDATE "
  		  +"WHERE userId=#{userId}")
     public void lastLoginUpdate(String userId); // 마지막 로그인 시점

    /*------ 아이디 찾기 ------*/
    @Select("SELECT COUNT(*) FROM MEMBER WHERE email=#{email}")
    public int getEmailCount(@Param("email") String email); //  이메일 존재여부 확인

    @Insert("UPDATE member SET code=#{code} WHERE email = #{email}")
    public void sendCode(@Param("code") int code,@Param("email") String email); // 인증번호 저장

    @Select("SELECT SUBSTR(userId, 1, LENGTH(userId) - 3) || '***' AS userId "
    		+ "FROM member WHERE code = #{code} AND email = #{email}")
    public String idFind(@Param("code") int code,@Param("email") String email); // 아이디 찾기
    /*-----------------------*/

    /*------ 비밀번호 찾기 ------*/
    @Select("SELECT COUNT(*) FROM MEMBER WHERE userId = #{userId} AND email = #{email}")
    public int getEmailCountbyUserId(@Param("userId") String userId, @Param("email") String email); // 이메일 존재여부 확인

    @Update("UPDATE member SET userPwd=#{tempPwd} WHERE userId = #{userId}")
    public void pwdFind(@Param("userId") String userId,@Param("tempPwd") String tempPwd); // 비밀번호 임시비밀번호로 변경
    /*-----------------------*/

}
