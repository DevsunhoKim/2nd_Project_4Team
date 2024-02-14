package com.sist.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.BooksVO;

public interface BooksMapper {

	@Select("SELECT no,title,poster,genre,price FROM books "
		+   "ORDER BY buy_cnt DESC "
			+"WHERE rownum >= 10")
	public List<BooksVO> mainBooks();

	  @Select("SELECT no,title,poster,author,num "
				 +"FROM (SELECT no,title,poster,author,rownum as num "
				 +"FROM (SELECT no,title,poster,author "
				 +"FROM books ORDER BY no ASC)) "
				 +"WHERE num BETWEEN #{start} AND #{end}")
	  public List<BooksVO> booksListData(@Param("start") int start,
				  @Param("end") int end);


	  @Select("SELECT CEIL(COUNT(*)/12.0) FROM books")
	  public int booksTotalPage();
	  
	  @Select("SELECT no,title,poster,publ,author,content,price,score,buy_cnt,heart,jjim,keyword,genre,b_date "
			  +"FROM books WHERE no=#{no}")
	  public BooksVO booksDetailData(int no);
}
