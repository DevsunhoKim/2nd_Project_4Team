package com.sist.mapper;
import java.util.*;
import com.sist.vo.*;
import org.apache.ibatis.annotations.Select;

public interface BooksMapper {
  
	@Select("SELECT no,title,poster,genre,price FROM books "
		+   "ORDER BY buy_cnt DESC "
			+"WHERE rownum >= 10")
	public List<BooksVO> mainBooks();
}
