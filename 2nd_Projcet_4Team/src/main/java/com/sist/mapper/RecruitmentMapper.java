package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.CompanyVO;
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

/*
 * NO         NOT NULL NUMBER
LOGO                VARCHAR2(1000)
NAME       NOT NULL VARCHAR2(100)
YEAR                VARCHAR2(100)
SCALE               VARCHAR2(100)
SALES               VARCHAR2(100)
WORKER              NUMBER
TYPE                VARCHAR2(100)
CONTENT             CLOB
IMG                 VARCHAR2(1000)
ADDRESS             VARCHAR2(1000)
HOMEPAGE            VARCHAR2(1000)
PHONE               VARCHAR2(100)
EMAIL               VARCHAR2(1000)
LIKE_COUNT          NUMBER
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

	// 검색
<<<<<<< HEAD


	// 채용 공고 상세보기
		//1. 채용 공고 정보
		@Select("SELECT no, cno, title, stack_txt, stack_img, career, education, content_j, content_q, content_p, content_b, end_date, like_count, cname "
=======
	
	
	// 상세보기
//		// 1. 채용 공고 정보
//		@Select("SELECT no, cno, title, stack_txt, stack_img, career, education, content_j, content_q, content_p, content_b, end_date, like_count, cname "
//				+ "FROM recruit "
//				+ "WHERE no=#{no}")
//		public RecruitVO recuitDetailData(int no);
//		// 2. 기업 정보
//		@Select("SELECT no, logo, name, address, homepage, phone, email, like_count "
//				+ "FROM company "
//				+ "WHERE no=#{no}")
//		public CompanyVO companyDetailData(int no);
		
		// 1. 채용 공고 정보
		@Select("SELECT * "
>>>>>>> branch 'master' of https://github.com/DevsunhoKim/2nd_Project_4Team.git
				+ "FROM recruit "
				+ "WHERE no=#{no}")
		public RecruitVO recuitDetailData(int no);
		// 2. 기업 정보
		@Select("SELECT * "
				+ "FROM company "
				+ "WHERE no=#{no}")
		public CompanyVO companyDetailData(int no);
<<<<<<< HEAD

	// 기업 정보 상세보기


=======
	
	
>>>>>>> branch 'master' of https://github.com/DevsunhoKim/2nd_Project_4Team.git
	// 면접 후기 작성

}
