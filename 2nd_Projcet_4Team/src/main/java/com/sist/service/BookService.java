package com.sist.service;

import java.util.List;

import com.sist.vo.BooksVO;

public interface BookService {

	public List<BooksVO> mainBooks();
	public List<BooksVO> booksListData(int start,int end);
	public int booksTotalPage();
}
