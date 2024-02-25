package com.sist.service;

import java.util.List;

import com.sist.vo.ApplyVO;
import com.sist.vo.CompanyVO;
import com.sist.vo.InterviewVO;
import com.sist.vo.MemberVO;
import com.sist.vo.RecruitVO;

// 비즈니스 로직을 정의하는 인터페이스
public interface RecruitmentService {

	// 채용 공고 목록 출력
	public List<RecruitVO> recruitListData(int start, int end);

	// 채용 공고 목록 총 페이지 수
	public int recruitTotalPage();
	
	// 채용 공고 검색
	public List<RecruitVO> recruitFindData(String word);

	// 채용 공고 정보 상세보기 => RecruitmentDAO의 recuitDetailData 메서드를 호출하여 채용 공고 정보를 가져오기
	public RecruitVO recuitDetailData(int rno);

	// 채용 공고 추가
	public void recruitInsert(RecruitVO vo);

	// 채용 공고 수정
	public void recruitUpdate(RecruitVO vo);

	// 채용 공고 삭제
	public void recruitDelete(int rno);
	
	// 기업 정보 상세보기 => RecruitmentDAO의 companyDetailData 메서드를 호출하여 기업 정보를 가져오기
	public CompanyVO companyDetailData(int cno);

	// 기업 정보 작성
	public void companyInsert(CompanyVO vo);
	
	// 기업 정보 수정
	public CompanyVO companyUpdate(int cno);
	
	// 기업 정보 삭제
	public void companyDelete(int cno);

	
//	// 면접 후기 목록 출력
//	public List<InterviewVO> interviewListData(int cno);
//	
//	// 면접 후기 총 페이지 수
//	public int interviewTotalPage();
//	
//	// 면접 후기 상세보기
//	public InterviewVO interviewDetailData(int ino);
	
	// 면접 후기 목록 출력
	public List<InterviewVO> interviewListData(int cno);
	
	// 면접 후기 작성
	public void interviewInsert(InterviewVO vo);
	
	// 면접 후기 수정
	public void interviewUpdate(InterviewVO vo);
	
	// 면접 후기 삭제
	public void interviewDelete(int ino);
	
	
	// 지원하기
	public void applyInsert(ApplyVO vo);
	
	// 지원서 수정
	public void applyUpdate(ApplyVO vo);
	
	// 지원 취소(삭제)
	public void applyDelete(int ano);
	
	
	// 사용자 정보 읽기
	public MemberVO memberInfoData(String userId);
}
