package com.sist.mapper;

import org.apache.ibatis.annotations.Insert;
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
                "USER_NAME=#{user_name}," +
                "NICKNAME=#{nickname}," +
                "GENDER=#{gender}," +
                "PHONE=#{phone}," +
                "email=#{email}," +
                "BIRTHDAY=#{birthday}," +
                "ADDRESS=#{address}," +
                "DETAIL_ADDRESS=#{detail_address} " +
            "WHERE USER_ID=#{user_id}")
    public int updateMember(MemberVO vo); // 회원정보 수정

    @Update("UPDATE MEMBER SET "
  		  +"lastlogin=SYSDATE "
  		  +"WHERE userId=#{userId}")
     public void lastLoginUpdate(String userId); // 마지막 로그인 시점

/*------ 비밀번호 찾기 ------*/
    @Select("SELECT COUNT(*) FROM MEMBER WHERE userId = #{userId} AND email = #{email}")
    public int getEmailCount(String userId, String email); // 이메일 존재여부 확인

    @Update("UPDATE member SET userPwd=#{tempPwd} WHERE userId = #{userId}")
    public void pwdFind(String userId,String tempPwd); // 비밀번호 임시비밀번호로 변경


}
