package com.sist.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.MentorVO;

public interface MentorMapper {
	@Select("SELECT userId,userPwd,userName,nickname,birthday,gender,email,phone,post,addr,detail_addr,hope_job,regdate " +
            "FROM MEMBER " +
            "WHERE userId=#{userId}")
    public MentorVO getMentorByID(String userId); // 아이디로 멘토정보 조회

	/*
	private int mno,pay,follower,rev_cnt;
	private double score_avg;
	private String userId,job,career,department,img,keyword,title,intro;
	 */
    @Insert("INSERT INTO mentor(mno,pay,userId,job,career,department,img,keyword,title,intro) VALUES (" +
    		"mt_mno_seq.nextval,"
    		+ "#{pay}, "
    		+ "#{userId}, "
    		+ "#{job}, "
    		+ "#{career}, "
    		+ "#{department}, "
    		+ "#{img}, "
    		+ "#{keyword}, "
    		+ "#{title}, "
    		+ "#{intro})")
    public void enrollMentor(MentorVO vo); // 멘토 등록
    
    @Update("UPDATE member "
    		+ "SET mentor = 1 "
    		+ "WHERE userId = #{userId}")
	public void updateMentorById(String userId); // 회원에 멘토컬럼 활성화
	
    @Update("UPDATE Mentor SET " +
                "USER_NAME=#{user_name}," +
                "NICKNAME=#{nickname}," +
                "GENDER=#{gender}," +
                "PHONE=#{phone}," +
                "email=#{email}," +
                "BIRTHDAY=#{birthday}," +
                "ADDRESS=#{address}," +
                "DETAIL_ADDRESS=#{detail_address} " +
            "WHERE USER_ID=#{user_id}")
    public int updateMentor(MentorVO vo); // 멘토정보 수정
}
