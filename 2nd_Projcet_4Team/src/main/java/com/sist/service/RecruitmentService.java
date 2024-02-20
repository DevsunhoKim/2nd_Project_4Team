package com.sist.service;

import java.util.List;

import com.sist.vo.CompanyVO;
import com.sist.vo.RecruitVO;

public interface RecruitmentService {
	
	// 목록 출력
	public List<RecruitVO> recruitListData(int start, int end);
	
	// 총 페이지 수
	public int recruitTotalPage();
	
	// 1. 채용 공고 정보
	public RecruitVO recuitDetailData(int no);
	
	// 2. 기업 정보
	public CompanyVO companyDetailData(int no);
}
