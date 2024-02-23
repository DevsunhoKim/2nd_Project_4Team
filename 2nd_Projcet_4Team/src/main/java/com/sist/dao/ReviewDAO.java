package com.sist.dao;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.ReviewMapper;
import com.sist.vo.ReviewVO;

@Repository
public class ReviewDAO {
	@Autowired
	private ReviewMapper mapper;

	public List<ReviewVO> reviewListData(int no)
	{
		return mapper.reviewListData(no);
	}

	public void reviewInsert(ReviewVO vo)
	{
		mapper.reviewInsert(vo);
	}

	public void reviewUpdate(ReviewVO vo)
	{
		mapper.reviewUpdate(vo);
	}

	public void reviewDelete(int no,String userId)
	{
		mapper.reviewDelete(no,userId);
	}

}
