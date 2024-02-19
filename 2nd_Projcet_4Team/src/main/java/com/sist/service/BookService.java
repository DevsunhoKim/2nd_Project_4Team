package com.sist.service;

import java.util.List;


import com.sist.vo.B_ReviewVO;
import com.sist.vo.BooksVO;

public interface BookService {

	// 도서 리스트 관련
	public List<BooksVO> mainBooks();
	public List<BooksVO> booksListData(int start,int end,String filter,String keyword);
	public int booksTotalPage();
	public BooksVO booksDetailData(int no);
	public List<BooksVO> searchBooks(String ss);
	
	// 도서 리뷰 관련
	public void insertReview(B_ReviewVO vo);
	public B_ReviewVO reviewDetaildata(int rno);
	public List<B_ReviewVO> reviewListData();
	public void reviewUpdate(B_ReviewVO vo);
	public void reviewDelete(int rno);
	
}
