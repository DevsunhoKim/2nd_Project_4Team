package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.InterviewVO;

public interface RecruitmentInterviewMapper {
//	// 면접 후기 목록 출력
//	@Select("SELECT ino, cno, userId, title, career, score, ilevel, result, content, TO_CHAR(regdate, 'YYYY-MM-DD'), num "
//			+ "FROM (SELECT ino, cno, userId, title, career, score, ilevel, result, content, regdate, rownum as num "
//			+ "FROM (SELECT /*+ INDEX_DESC(interview it_ino_pk)*/ino, cno, userId, title, career, score, ilevel, result, content, regdate "
//			+ "FROM interview)) "
//			+ "WHERE num BETWEEN #{start} AND {end}")
//	public List<InterviewVO> interviewListData(@Param("start") int start, @Param("end") int end);
//
//	// 면접 후기 총 페이지 수
//	@Select("SELECT CEIL(COUNT(*)/10.0) FROM interview")
//	public int interviewTotalPage();
//
//	// 면접 후기 상세보기
//	@Select("SELECT * FROM interview WHERE ino=#{ino}")
//	public InterviewVO interviewDetailData(int ino);
	
	//면접 후기 목록 출력
	@Select("SELECT ino, cno, userId, title, career, score, ilevel, result, content, TO_CHAR(regdate, 'YYYY-MM-DD') "
			+ "FROM interview "
			+ "WHERE cno=#{cno} "
			+ "ORDER BY ino DESC")
	public List<InterviewVO> interviewListData(int cno);
	
	// 면접 후기 작성
	@Insert("INSERT INTO interview(ino, cno, userId, title, career, score, ilevel, result, content, regdate) "
			+ "VALUES(it_ino_seq.nextval, #{cno}, #{userId}, #{title}, #{career}, #{score}, #{ilevel}, #{result}, #{content}, SYSDATE")
	public void interviewInsert(InterviewVO vo);
	
	// 면접 후기 수정
	@Update("UPDATE interview SET "
			+ "title=#{title}, career=#{career}, score=#{score}, ilevel=#{ilevel}, result=#{result}, content=#{content} "
			+ "WHERE ino=#{ino}")
	public void interviewUpdate(InterviewVO vo);
	
	// 면접 후기 삭제
	@Delete("DELETE FROM interview "
			+ "WHERE ino=#{ino}")
	public void interviewDelete(int ino);
}
