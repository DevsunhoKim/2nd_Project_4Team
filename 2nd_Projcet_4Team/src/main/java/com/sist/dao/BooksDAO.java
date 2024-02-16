package com.sist.dao;
import java.util.List;

import org.apache.ibatis.annotations.Param;
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
	
	public BooksVO booksDetailData(int no)
	{
		return mapper.booksDetailData(no);
	}
	
	public List<BooksVO> booksBuyListData(int start,int end)
	{
		return mapper.booksBuyListData(start, end);
	}
	
	public List<BooksVO> booksRecListData(int start,int end)
	{
		return mapper.booksRecBuyListData(start, end);
	}
	
	public List<BooksVO> booksScoListData(int start,int end)
	{
		return mapper.booksScoListData(start, end);
	}
	
	public List<BooksVO> searchBooks(String ss)
	{
		return mapper.searchBooks(ss);
	}
}
