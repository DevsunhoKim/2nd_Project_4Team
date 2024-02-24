package com.sist.service;

import java.util.List;

import com.sist.vo.ApplyVO;
import com.sist.vo.CompanyVO;
import com.sist.vo.RecruitVO;

// 비즈니스 로직을 정의하는 인터페이스
public interface RecruitmentService {

	// 목록 출력
	public List<RecruitVO> recruitListData(int start, int end);

	// 총 페이지 수
	public int recruitTotalPage();
	
	// 검색
	public List<RecruitVO> recruitFindData(String word);

	// 1. 채용 공고 정보 => RecruitmentDAO의 recuitDetailData 메서드를 호출하여 채용 공고 정보를 가져오기
	public RecruitVO recuitDetailData(int rno);

	// 2. 기업 정보 => RecruitmentDAO의 companyDetailData 메서드를 호출하여 기업 정보를 가져오기
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
