package com.sist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.ReviewDAO;
import com.sist.vo.ReviewVO;
@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewDAO dao;

	@Override
	public List<ReviewVO> reviewListData(int no,int cateno) {
		// TODO Auto-generated method stub
		return dao.reviewListData(no, cateno); 
	}

	@Override
	public void reviewInsert(ReviewVO vo) {
		// TODO Auto-generated method stub
		dao.reviewInsert(vo);
	}

	@Override
	public void reviewUpdate(ReviewVO vo) {
		// TODO Auto-generated method stub
		dao.reviewUpdate(vo);
	}

	@Override
	public void reviewDelete(int no,String userId,int cateno) {
		// TODO Auto-generated method stub
		dao.reviewDelete(no,userId,cateno);
	}

}
