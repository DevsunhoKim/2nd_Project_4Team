package com.sist.service;

import java.util.List;

import com.sist.vo.ReviewVO;

public interface ReviewService {
	public List<ReviewVO> reviewListData(int no,int cateno);
	public void reviewInsert(ReviewVO vo);
	public void reviewUpdate(ReviewVO vo);
	public void reviewDelete(int rno,String userId,int cateno);

}
