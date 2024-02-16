package com.sist.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.BooksVO;

public interface BooksMapper {
      // 메인페이지 출력물
	 @Select("SELECT no,title,poster,genre,price FROM books "
			+"ORDER BY buy_cnt DESC "
			+"WHERE rownum >= 10")
	 public List<BooksVO> mainBooks();
	  
	  // 메인 리스트
	  @Select("SELECT no,title,poster,author,num "
				 +"FROM (SELECT no,title,poster,author,rownum as num "
				 +"FROM (SELECT no,title,poster,author "
				 +"FROM books ORDER BY no ASC)) "
				 +"WHERE num BETWEEN #{start} AND #{end}")
	  public List<BooksVO> booksListData(@Param("start") int start,
				  @Param("end") int end);

	  // 메인 리스트 페이지 관련
	  @Select("SELECT CEIL(COUNT(*)/12.0) FROM books")
	  public int booksTotalPage();
	  
	  //상세보기
	  @Select("SELECT no,title,poster,publ,author,content,price,score,buy_cnt,heart,jjim,keyword,genre,b_date "
			  +"FROM books WHERE no=#{no}")
	  public BooksVO booksDetailData(int no);
	  
	  //많이 구매한 리스트
	  @Select("SELECT no,title,poster,author,num "
				 +"FROM (SELECT no,title,poster,author,rownum as num "
				 +"FROM (SELECT no,title,poster,author "
				 +"FROM books ORDER BY buy_cnt DESC)) "
				 +"WHERE num BETWEEN #{start} AND #{end}")
	  public List<BooksVO> booksBuyListData(@Param("start") int start,
				  @Param("end") int end);
	  // 평점 높은 리스트
	  @Select("SELECT no,title,poster,author,num "
				 +"FROM (SELECT no,title,poster,author,rownum as num "
				 +"FROM (SELECT no,title,poster,author "
				 +"FROM books ORDER BY score DESC)) "
				 +"WHERE num BETWEEN #{start} AND #{end}")
	  public List<BooksVO> booksScoListData(@Param("start") int start,
				  @Param("end") int end);
	  // 최근 출간 순 
	  @Select("SELECT no, title, poster, author, num "
		        + "FROM (SELECT no, title, poster, author, rownum as num "
		        + "FROM (SELECT no, title, poster, author "
		        + "FROM books ORDER BY b_date DESC)) "
		        + "WHERE num BETWEEN #{start} AND #{end}")
		public List<BooksVO> booksRecBuyListData(@Param("start") int start,
		                @Param("end") int end);

	  
	  // 리스트 검색
	  @Select("SELECT * FROM books " +
			  "WHERE title LIKE '%' || #{ss} || '%' " +
			  "OR publ LIKE '%' || #{ss} || '%' " +
			  "OR author LIKE '%' || #{ss} || '%' " +
			  "OR genre LIKE '%' || #{ss} || '%' " +
			  "OR keyword LIKE '%' || #{ss} || '%'")
			  public List<BooksVO> searchBooks(@Param("ss") String ss);



}
