package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.ApplyVO;
import com.sist.vo.CompanyVO;
import com.sist.vo.RecruitVO;

/*
 * RNO         NOT NULL NUMBER
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
 * CNO         NOT NULL NUMBER
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

// 어노테이션을 사용하여 SQL 쿼리를 지정
public interface RecruitmentMapper {
	// 목록 출력
	@Results({
	  @Result(column="logo", property="cvo.logo"),
	  @Result(column="name", property="cvo.name"),
	  @Result(column="address", property="cvo.address")
	})
	@Select("SELECT r.rno, r.cno, r.title, r.stack_txt, r.career, r.education, r.end_date, r.like_count, "
	      + "c.logo, c.name, c.address "
	      + "FROM recruit r "
	      + "JOIN company c ON r.cno=c.cno "
	      + "WHERE r.rno BETWEEN #{start} AND #{end} "
	      + "ORDER BY r.rno DESC")
	public List<RecruitVO> recruitListData(@Param("start") int start, @Param("end") int end);

	
	// 총 페이지 수
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM recruit")
	public int recruitTotalPage();

	
	// 검색
	@Results({
	  @Result(column="logo", property="cvo.logo"),
	  @Result(column="name", property="cvo.name"),
	  @Result(column="address", property="cvo.address")
	})
	@Select("SELECT r.rno, r.cno, r.title, r.stack_txt, r.career, r.education, r.end_date, r.like_count, "
			+ "c.logo, c.name, c.address "
			+ "FROM recruit r "
			+ "JOIN company c ON r.cno=c.cno "
			+ "WHERE r.title LIKE '%' || #{word} || '%' "
			+ "OR r.stack_txt LIKE '%' || #{word} || '%' "
			+ "OR r.career LIKE '%' || #{word} || '%' "
			+ "OR c.name LIKE '%' || #{word} || '%' "
			+ "OR c.address LIKE '%' || #{word} || '%'")
	public List<RecruitVO> recruitFindData(@Param("word") String word);
	// 메소드의 파라미터 이름과 SQL 쿼리의 변수 이름을 일치시켜주는 역할

	// 정렬

	// 상세보기
	// 1. 채용 공고 정보 => recurit 테이블에서 각 rno에 해당하는 채용 공고 정보 가져오기
	@Select("SELECT * FROM recruit WHERE rno=#{rno}")
	public RecruitVO recuitDetailData(int rno);
	
	// 2. 기업 정보 => company 테이블에서 각 cno에 해당하는 기업 정보 가져오기
	@Select("SELECT * FROM company WHERE cno=#{cno}")
	public CompanyVO companyDetailData(int cno);

	// 채용 공고 추가
	@Results({
	  @Result(column="cno", property="cvo.cno"),
	  @Result(column="logo", property="cvo.logo"),
	  @Result(column="name", property="cvo.name"),
	  @Result(column="address", property="cvo.address"),
	  @Result(column="phone", property="cvo.phone"),
	  @Result(column="homepage", property="cvo.homepage"),
	  @Result(column="email", property="cvo.email")
	})
	@Insert("INSERT INTO recruit (rno, cno, title, stack_txt, stack_img, career, education, content_j, content_q, content_p, content_b, end_date) "
		    + "VALUES (#{rno}, #{cno}, #{title}, #{stack_txt}, #{stack_img}, #{career}, #{education}, #{content_j}, #{content_q}, #{content_p}, #{content_b}, #{end_date}) "
		    + "INSERT INTO company (cno, logo, name, address, phone, homepage, email) "
		    + "VALUES (#{cvo.cno}, #{cvo.logo}, #{cvo.name}, #{cvo.address}, #{cvo.phone}, #{cvo.homepage}, #{cvo.email})")
	public void recruitInsert(RecruitVO vo);
		
	// 채용 공고 수정
	@Results({
	  @Result(column="cno", property="cvo.cno"),
	  @Result(column="logo", property="cvo.logo"),
	  @Result(column="name", property="cvo.name"),
	  @Result(column="address", property="cvo.address"),
	  @Result(column="phone", property="cvo.phone"),
	  @Result(column="homepage", property="cvo.homepage"),
	  @Result(column="email", property="cvo.email")
	})
	@Update("UPDATE recruit SET "
			+ "no=#{rno}, cno=#{cno}, title=#{title}, stack_txt=#{stack_txt}, stack_img=#{stack_img}, career=#{career}, education=#{education}, content_j=#{content_j}, content_q=#{content_q}, content_p=#{content_p}, content_b=#{content_b}, end_date=#{end_date} "
			+ "UPDATE company SET "
			+ "no=#{cvo.cno}, logo=#{cvo.logo}, name=#{cvo.name}, address=#{cvo.address}, phone=#{cvo.phone}, homepage=#{cvo.homepage}, email=#{cvo.email} "
			+ "WHERE no=#{rno}")
	public void recruitUpdate(RecruitVO vo);
	
	// 채용 공고 삭제
	@Delete("DELETE FROM recruit WHERE rno=#{rno}")
	public void recruitDelete(int rno);
		

	// 지원하기
	@Insert("INSERT INTO apply VALUES("
 	   + "ap_ano_seq.nextval, #{cno}, #{userId}, SYSDATE, #{filename}, #{filesize}, #{filecount})")
	public void applyInsert(ApplyVO vo);
	

	// 면접 후기 작성
}
