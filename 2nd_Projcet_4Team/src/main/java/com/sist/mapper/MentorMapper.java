package com.sist.mapper;

import java.util.*;
import org.apache.ibatis.annotations.*;

import com.sist.vo.MentorReserveVO;
import com.sist.vo.MentorVO;
import com.sist.vo.StudyRoomReserveVO;

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

	@Insert("INSERT INTO mentor(mno,pay,userId,job,career,department,img,keyword,title,intro,str_Mtime,end_Mtime) VALUES ("
	        + "#{userId}, "
	        + "#{job}, "
	        + "#{career}, "
	        + "#{department}, "
	        + "#{img}, "
	        + "#{keyword}, "
	        + "#{title}, "
	        + "#{intro},"
	        + "#{str_Mtime},"
	        + "#{end_Mtime})")
	public void enrollMentor(MentorVO vo);

    @Update("UPDATE member SET mentor = 1 WHERE userId = #{userId}")
	public void updateMentorById(String userId); // 회원에 멘토컬럼 활성화
    
    @Insert("INSERT INTO mentor_reserve VALUES(mr_mno_seq.nextval,#{mno},#{userId},#{rDate},0,#{totalAmount},#{inquiry},SYSDATE)")
    public void insertMentoring(MentorReserveVO vo); // 멘토링 예약
    
    @Update("UPDATE mentor SET rev_cnt = (SELECT MAX(rev_cnt) + 1 FROM mentor) WHERE mno = #{mno}")
	public void increaseRevCnt(int mno); // 멘토 예약수 증가

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
