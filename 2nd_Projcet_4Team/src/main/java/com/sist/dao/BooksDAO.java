package com.sist.dao;
import com.sist.mapper.*;
import java.util.*;
import com.sist.vo.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BooksDAO {
	@Autowired
	private BooksMapper mapper;
	
	public List<BooksVO> mainBooks()
	{
		return mapper.mainBooks();
	}
}
