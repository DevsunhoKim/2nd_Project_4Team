package com.sist.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.B_ReviewDAO;
import com.sist.dao.BooksDAO;
import com.sist.vo.B_ReviewVO;
import com.sist.vo.BooksVO;

@Service
public class BooksServiceImpl  implements BookService{

	@Autowired
	private BooksDAO dao;
	
	@Autowired
	private B_ReviewDAO rDao;

	@Override
	public List<BooksVO> mainBooks() {
		// TODO Auto-generated method stub
		return dao.mainBooks();
	}

	@Override
	public List<BooksVO> booksListData(int start,int end,String filter,String keyword) {
		// TODO Auto-generated method stub
		return dao.booksListData(start, end,filter,keyword);
	}

	@Override
	public int booksTotalPage() {
		// TODO Auto-generated method stub
		return dao.booksTotalPage();
	}

	@Override
	public BooksVO booksDetailData(int no) {
		// TODO Auto-generated method stub
		return dao.booksDetailData(no);
	}

	@Override
	public List<BooksVO> searchBooks(String ss) {
		// TODO Auto-generated method stub
		return dao.searchBooks(ss);
	}

	@Override
	public void insertReview(B_ReviewVO vo) {
		// TODO Auto-generated method stub
		 rDao.insertReview(vo);
	}

	@Override
	public B_ReviewVO reviewDetaildata(int rno) {
		// TODO Auto-generated method stub
		return rDao.reviewDetaildata(rno);
	}

	@Override
	public List<B_ReviewVO> reviewListData() {
		// TODO Auto-generated method stub
		return rDao.reviewListData();
	}

	@Override
	public void reviewUpdate(B_ReviewVO vo) {
		// TODO Auto-generated method stub
		rDao.reviewUpdate(vo);
		
	}

	@Override
	public void reviewDelete(int rno) {
		// TODO Auto-generated method stub
		rDao.reviewDelete(rno);
	}
	

}
