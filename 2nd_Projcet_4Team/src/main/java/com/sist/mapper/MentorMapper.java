package com.sist.mapper;

import java.util.*;
import org.apache.ibatis.annotations.*;
import com.sist.vo.MentorVO;

public interface MentorMapper {
/*	@Select("<script>"
		    + "SELECT * FROM ("
		    + "    SELECT mno, userId, job, career, img, keyword, title, score_avg, nickname, ROWNUM AS num "
		    + "    FROM ("
		    + "        SELECT mno, member.userId, job, career, img, keyword, title, score_avg, nickname "
		    + "        FROM Member, Mentor "
		    + "        WHERE member.userId = mentor.userId "
		    + "        <if test='selectedVal != null and searchWord != null'>"
		    + "            AND #{selectedVal} LIKE '%' || #{searchWord} || '%'"
		    + "        </if>"
		    + "        <if test='job != null'>"
		    + "            AND job = #{job}"
		    + "        </if>"
		    + "        ORDER BY "
		    + "        <choose>"
		    + "            <when test='filter == \"rev_cnt\"'> rev_cnt DESC </when>"
		    + "            <when test='filter == \"score_avg\"'> score_avg DESC </when>"
		    + "            <when test='filter == \"follower\"'> follower DESC </when>"
		    + "            <otherwise> rev_cnt DESC </otherwise>"
		    + "        </choose>"
		    + "    )"
		    + ")"
		    + "WHERE num BETWEEN #{start} AND #{end}"
		    + "</script>") */
	public List<MentorVO> getMentorListBymap(Map map);// 멘토 목록 검색(param : start, end, selectedVal, searchWord, job)

/*	@Select("<script>"
		    + "SELECT CEIL(COUNT(*)/8.0) FROM member,mentor "
		    + "WHERE "
		    + "    member.userId = mentor.userId "
		    + "    <if test='selectedVal != null and searchWord != null'>"
		    + "        AND #{selectedVal} LIKE '%' || #{searchWord} || '%'"
		    + "    </if>"
		    + "    <if test='job != null'>"
		    + "        AND job = #{job}"
		    + "    </if>"
		    + "</script>")*/
	public int getTotalMentorPageBymap(Map map);// 총 페이지
		
		
	@Select("SELECT userId,userPwd,userName,nickname,birthday,gender,email,phone,post,addr,detail_addr,hope_job,regdate " +
            "FROM MEMBER " +
            "WHERE userId=#{userId}")
    public MentorVO getMentorByID(String userId); // 아이디로 멘토정보 조회

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
