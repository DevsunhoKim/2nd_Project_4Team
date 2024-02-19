package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;

import com.sist.vo.RecruitVO;

/*
 * NO         NOT NULL NUMBER         
CNO                 NUMBER         
TITLE      NOT NULL VARCHAR2(1000) 
STACK_TXT           VARCHAR2(1000) 
STACK_IMG           CLOB           
CAREER     NOT NULL VARCHAR2(100)  
EDUCATION  NOT NULL VARCHAR2(100)  
CONTENT_J           CLOB           
CONTENT_Q           CLOB           
CONTENT_P           CLOB           
CONTENT_B           CLOB           
END_DATE   NOT NULL VARCHAR2(1000) 
LIKE_COUNT          NUMBER         
CNAME               VARCHAR2(500) 
 */
public interface RecruitmentMapper {	
	// 목록 출력
	@Results({
	  @Result(column="logo",property="cvo.logo"),
	  @Result(column="name",property="cvo.name"),
	  @Result(column="address",property="cvo.address")
	 })
	@Select("SELECT r.no, r.cno, r.title, r.stack_txt, r.career, r.education, r.end_date, r.like_count, " +
	        "c.logo, c.name, c.address " +
	        "FROM recruit r " +
	        "JOIN company c ON r.cno=c.no " +
	        "WHERE r.no BETWEEN #{start} AND #{end} " +
	        "ORDER BY r.no DESC")
	public List<RecruitVO> recruitListData(@Param("start") int start, @Param("end") int end);
	
	// 총 페이지 수
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM recruit")
	public int recruitTotalPage();
	
	// 
}
