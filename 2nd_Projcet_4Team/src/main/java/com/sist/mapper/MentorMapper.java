package com.sist.mapper;

import java.util.*;
import org.apache.ibatis.annotations.*;
import com.sist.vo.MentorVO;

public interface MentorMapper {
	public List<MentorVO> getMentorListBymap(Map map);// 멘토 목록 검색(param : start, end, selectedVal, searchWord, job)
	
	public int getTotalMentorPageBymap(Map map);// 총 페이지
	
	
	@Results({
		  @Result(column="nickname", property="mvo.nickname"),
	})
	@Select("SELECT m.nickname, ment.* "
			+ "FROM member m "
			+ "JOIN mentor ment ON m.userId = ment.userId "
            + "WHERE mno=#{mno}")
    public MentorVO mentorDetailData(int mno); // mno로 멘토정보 조회

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
