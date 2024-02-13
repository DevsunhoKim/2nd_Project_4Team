package com.sist.dao;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.BooksMapper;
import com.sist.vo.BooksVO;

@Repository
public class BooksDAO {
	@Autowired
	private BooksMapper mapper;

	public List<BooksVO> mainBooks()
	{
		return mapper.mainBooks();
	}

	public List<BooksVO> booksListData(int start,int end)
	{
		return mapper.booksListData(start, end);
	}

	public int booksTotalPage()
	{
		return mapper.booksTotalPage();
	}
}
