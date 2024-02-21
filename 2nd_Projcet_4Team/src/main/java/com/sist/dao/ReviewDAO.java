package com.sist.dao;
import java.util.*;
import com.sist.mapper.*;
import com.sist.vo.ReviewVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	public void reviewDelete(int no)
	{
		mapper.reviewDelete(no);
	}
	
}
