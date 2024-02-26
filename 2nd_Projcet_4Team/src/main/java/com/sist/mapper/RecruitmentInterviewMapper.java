package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.InterviewVO;

public interface RecruitmentInterviewMapper {
	//면접 후기 목록 출력
	@Select("SELECT ino, cno, userId, title, career, score, ilevel, result, content, TO_CHAR(regdate, 'YYYY-MM-DD') as dbday "
			+ "FROM interview "
			+ "WHERE cno=#{cno} "
			+ "ORDER BY ino DESC")
	public List<InterviewVO> interviewListData(int cno);
	
	// 면접 후기 작성
	@Insert("INSERT INTO interview(ino, cno, userId, title, career, score, ilevel, result, content) "
			+ "VALUES(it_ino_seq.nextval, #{cno}, #{userId}, #{title}, #{career}, #{score}, #{ilevel}, #{result}, #{content}")
	public void interviewInsert(InterviewVO vo);
	
	// 면접 후기 수정
	@Update("UPDATE interview SET "
			+ "title=#{title}, career=#{career}, score=#{score}, ilevel=#{ilevel}, result=#{result}, content=#{content} "
			+ "WHERE ino=#{ino} AND userId=#{userId}")
	public void interviewUpdate(InterviewVO vo);
	
	// 면접 후기 삭제
	@Delete("DELETE FROM interview "
			+ "WHERE ino=#{ino} AND userId=#{userId}")
	public void interviewDelete(@Param("ino") int ino, @Param("userId") String userId);
	
}
