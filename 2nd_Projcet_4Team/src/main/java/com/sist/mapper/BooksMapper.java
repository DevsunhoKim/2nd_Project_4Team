package com.sist.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.BooksVO;

public interface BooksMapper {
      // 메인페이지 출력물
	@Select("SELECT no, title, poster, genre, price FROM books "
			+"WHERE rownum <= 10 "
			+"ORDER BY buy_cnt DESC")
			public List<BooksVO> mainBooks();
	  
	  // 메인 리스트
	 @Select("<script>"
			    + "SELECT no, title, poster, author, num "
			    + "FROM ("
			    + "  SELECT no, title, poster, author, rownum AS num "
			    + "  FROM ("
			    + "    SELECT no, title, poster, author "
			    + "    FROM books "
			    + "    <where>"
			    + "      <if test='filter != null'>"
			    + "        <!-- 필터 조건에 따른 SQL 조건을 여기에 추가합니다. -->"
			    + "      </if>"
			    + "      <if test='keyword != null'>"
			    + "        AND (title LIKE '%' || #{keyword} || '%' OR author LIKE '%' || #{keyword} || '%')"
			    + "      </if>"
			    + "    </where>"
			    + "    ORDER BY "
			    + "      <choose>"
			    + "        <when test='filter == \"bestSeller\"'> buy_cnt DESC </when>"
			    + "        <when test='filter == \"highRating\"'> score </when>"
			    + "        <when test='filter == \"recent\"'> b_date DESC </when>"
			    + "        <otherwise> no ASC </otherwise>"
			    + "      </choose>"
			    + "  )"
			    + ")"
			    + "WHERE num BETWEEN #{start} AND #{end}"
			    + "</script>")
			public List<BooksVO> booksListData(@Param("start") int start, @Param("end") int end, @Param("filter") String filter, @Param("keyword") String keyword);

	  // 메인 리스트 페이지 관련
	  @Select("SELECT CEIL(COUNT(*)/12.0) FROM books")
	  public int booksTotalPage();
	  
	  //상세보기
	  @Select("SELECT no,title,poster,publ,author,content,price,score,buy_cnt,heart,jjim,keyword,genre,b_date "
			  +"FROM books WHERE no=#{no}")
	  public BooksVO booksDetailData(int no);
	  
	 

	  // 리스트 검색
	  @Select("SELECT * FROM books " +
			  "WHERE title LIKE '%' || #{ss} || '%' " +
			  "OR publ LIKE '%' || #{ss} || '%' " +
			  "OR author LIKE '%' || #{ss} || '%' " +
			  "OR genre LIKE '%' || #{ss} || '%' " +
			  "OR keyword LIKE '%' || #{ss} || '%'")
			  public List<BooksVO> searchBooks(@Param("ss") String ss);



}
