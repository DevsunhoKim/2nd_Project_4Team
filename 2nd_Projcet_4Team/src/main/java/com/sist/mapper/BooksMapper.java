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

	  @Select("SELECT no,title,poster,num "
				 +"FROM (SELECT no,title,poster,rownum as num "
				 +"FROM (SELECT no,title,poster "
				 +"FROM books ORDER BY no ASC)) "
				 +"WHERE num BETWEEN #{start} AND #{end}")
	  public List<BooksVO> booksListData(@Param("start") int start,
				  @Param("end") int end);


	  @Select("SELECT CEIL(COUNT(*)/12.0) FROM books")
	  public int booksTotalPage();
}
