package com.sist.mapper;

import java.util.*;
import org.apache.ibatis.annotations.*;

import com.sist.vo.MentorReserveVO;
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
    
    @Insert("INSERT INTO mentor_reserve VALUES(mr_mno_seq.nextval,#{mno},#{userId},#{rDate},0,#{totalAmount},#{inquiry},SYSDATE,#{str_time},#{end_time})")
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
    
    @Results({
		  @Result(column="nickname", property="mvo.nickname"),
	})
    @Select("SELECT ment.mno,ment.img,ment.title,ment.job,ment.career,ment.keyword,ment.intro,m.nickname "
    		+ "FROM member m JOIN mentor ment ON m.userId = ment.userId "
    		+ "WHERE job = #{cate}")
	public List<MentorVO> getMentorBytech(String cate); // 검색어(기술연관 직무)에 대한 멘토리스트
    
    @Results({
        @Result(column="userId", property="userId"),
        @Result(column="str_time", property="str_time"),
        @Result(column="end_time", property="end_time"),
        @Result(column="nickname", property="mvo.nickname"),
        @Result(column="job", property="mtvo.job"),
        @Result(column="title", property="mtvo.title")
    })
    @Select("SELECT * FROM ( "
    		+ "SELECT "
    		+ "mr.*, "
    		+ "m.nickname, "
    		+ "mt.job, "
    		+ "mt.career, "
    		+ "mt.img, "
    		+ "mt.title, "
    		+ "ROWNUM AS num "
    		+ "FROM mentor_reserve mr "
    		+ "JOIN member m ON mr.userId = m.userId "
    		+ "JOIN mentor mt ON m.userId = mt.userId "
    		+ "WHERE mr.userId = #{userId}"
    		+ ") WHERE num BETWEEN #{start} AND #{end}")
    public List<MentorReserveVO> getAllMyMentorRev(Map map); // 마이페이지 멘토링 내역
    
    @Select("SELECT COUNT(*) FROM mentor_reserve WHERE userId = #{userId}")
    public int getMRTotalCount(String userId); // 마이페이지 멘토링 총 갯수
    
    @Select("SELECT CEIL(COUNT(*)/7.0) FROM mentor_reserve WHERE userId = #{userId}")
    public int getMRTotalPage(String userId); // 마이페이지 멘토링 총페이지
}
