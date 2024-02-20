package com.sist.service;

import java.util.List;

import com.sist.vo.BooksVO;

public interface BookService {

	// 도서 리스트 관련
	public List<BooksVO> mainBooks();
	public List<BooksVO> booksListData(int start,int end,String filter,String keyword);
	public int booksTotalPage();
	public BooksVO booksDetailData(int no);
	public List<BooksVO> searchBooks(String ss);




}
