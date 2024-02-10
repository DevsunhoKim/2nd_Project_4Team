package com.sist.service;
import java.util.*;
import com.sist.mapper.*;
import com.sist.vo.*;
import com.sist.dao.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BooksServiceImpl  implements BookService{

	@Autowired
	private BooksDAO dao;
	
	@Override
	public List<BooksVO> mainBooks() {
		// TODO Auto-generated method stub
		return dao.mainBooks();
	}

}
