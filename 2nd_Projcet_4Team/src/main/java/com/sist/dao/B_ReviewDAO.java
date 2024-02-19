package com.sist.dao;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.*;
import com.sist.vo.B_ReviewVO;
@Repository
public class B_ReviewDAO {
	@Autowired
	private B_ReviewMapper mapper;
	
	public void insertReview(B_ReviewVO vo)
	{
		 mapper.insertReview(vo);
	}
	
	public B_ReviewVO reviewDetaildata(int rno)
	{
		return mapper.reviewDetaildata(rno);
	}
	
	public List<B_ReviewVO> reviewListData()
	{
		return mapper.reviewListData();
	}
	
	 public void reviewUpdate(B_ReviewVO vo)
	 {
		 mapper.reviewUpdate(vo);
	 }
	 
	 public void reviewDelete(int rno)
	 {
		 mapper.reviewDelete(rno);
	 }
}
