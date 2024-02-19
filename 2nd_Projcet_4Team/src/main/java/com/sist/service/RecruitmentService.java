package com.sist.service;

import java.util.List;

import com.sist.vo.RecruitVO;

public interface RecruitmentService {
	
	// 목록 출력
	public List<RecruitVO> recruitListData(int start, int end);
	
	// 총 페이지 수
	public int recruitTotalPage();
}
