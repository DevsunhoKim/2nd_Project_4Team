package com.sist.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.BooksDAO;
import com.sist.vo.BooksVO;

@Service
public class BooksServiceImpl  implements BookService{

	@Autowired
	private BooksDAO dao;

	@Override
	public List<BooksVO> mainBooks() {
		// TODO Auto-generated method stub
		return dao.mainBooks();
	}

	@Override
	public List<BooksVO> booksListData(int start, int end) {
		// TODO Auto-generated method stub
		return dao.booksListData(start, end);
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

}
