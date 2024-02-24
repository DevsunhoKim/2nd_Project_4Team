package com.sist.service;

import java.util.List;

import com.sist.vo.ApplyVO;
import com.sist.vo.CompanyVO;
import com.sist.vo.RecruitVO;

public interface RecruitmentService {

	// 목록 출력
	public List<RecruitVO> recruitListData(int start, int end);

	// 총 페이지 수
	public int recruitTotalPage();

	// 1. 채용 공고 정보
	public RecruitVO recuitDetailData(int rno);

	// 2. 기업 정보
	public CompanyVO companyDetailData(int cno);

	// 채용 공고 추가
	public void recruitInsert(RecruitVO vo);

	// 채용 공고 수정
	public void recruitUpdate(RecruitVO vo);

	// 채용 공고 삭제
	public void recruitDelete(int rno);

	// 지원하기
	public void applyInsert(ApplyVO vo);
}
