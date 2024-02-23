package com.sist.dao;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.ReviewMapper;
import com.sist.vo.ReviewVO;

@Repository
public class ReviewDAO {
	@Autowired
	private ReviewMapper mapper;

	public List<ReviewVO> reviewListData(int no,int cateno)
	{
		return mapper.reviewListData(no,cateno);
	}

	public void reviewInsert(ReviewVO vo)
	{
		mapper.reviewInsert(vo);
	}

	public void reviewUpdate(ReviewVO vo)
	{
		mapper.reviewUpdate(vo);
	}

	public void reviewDelete(int no,String userId,int cateno)
	{
		mapper.reviewDelete(no,userId,cateno);
	}
	
	public Double avgScore(int no, int cateno) 
	{   
		return mapper.avgScore(no, cateno);  
	}


}
