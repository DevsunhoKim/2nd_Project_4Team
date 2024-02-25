package com.sist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.RecruitmentDAO;
import com.sist.vo.ApplyVO;
import com.sist.vo.CompanyVO;
import com.sist.vo.InterviewVO;
import com.sist.vo.MemberVO;
import com.sist.vo.RecruitVO;
// RecruitmentService를 구현한 클래스로 RecruitmentDAO를 주입받아 비즈니스 로직에서 데이터 액세스를 수행
@Service
public class RecruitmentServiceImpl implements RecruitmentService{

	@Autowired
	private RecruitmentDAO rDao;

	// 목록 출력
	@Override
	public List<RecruitVO> recruitListData(int start, int end) {
		// TODO Auto-generated method stub
		return rDao.recruitListData(start, end);
	}

	// 총 페이지
	@Override
	public int recruitTotalPage() {
		// TODO Auto-generated method stub
		return rDao.recruitTotalPage();
	}
	
	// 검색
	@Override
	public List<RecruitVO> recruitFindData(String word) {
		// TODO Auto-generated method stub
		return rDao.recruitFindData(word);
	}
	
	// 채용 공고 상세 페이지
	@Override
	public RecruitVO recuitDetailData(int rno) {
		// TODO Auto-generated method stub
		return rDao.recuitDetailData(rno);
	}

	// 기업 정보 상세 페이지
	@Override
	public CompanyVO companyDetailData(int cno) {
		// TODO Auto-generated method stub
		return rDao.companyDetailData(cno);
	}

	// 채용 공고 추가
	@Override
	public void recruitInsert(RecruitVO vo) {
		// TODO Auto-generated method stub
		rDao.recruitInsert(vo);
	}

	// 채용 공고 수정
	@Override
	public void recruitUpdate(RecruitVO vo) {
		// TODO Auto-generated method stub
		rDao.recruitUpdate(vo);
	}

	// 채용 공고 삭제
	@Override
	public void recruitDelete(int rno) {
		// TODO Auto-generated method stub
		rDao.recruitDelete(rno);
	}

	// 지원하기
	@Override
	public void applyInsert(ApplyVO vo) {
		// TODO Auto-generated method stub
		rDao.applyInsert(vo);
	}

//	// 면접 후기 목록 출력
//	@Override
//	public List<InterviewVO> interviewListData(int start, int end) {
//		// TODO Auto-generated method stub
//		return rDao.interviewListData(start, end);
//	}
//
//	// 면접 후기 총 페이지 수
//	@Override
//	public int interviewTotalPage() {
//		// TODO Auto-generated method stub
//		return rDao.interviewTotalPage();
//	}
//	
//	// 면접 후기 상세보기
//	@Override
//	public InterviewVO interviewDetailData(int ino) {
//		// TODO Auto-generated method stub
//		return rDao.interviewDetailData(ino);
//	}
	
	// 면접 후기 목록 출력
	@Override
	public List<InterviewVO> interviewListData(int cno) {
		// TODO Auto-generated method stub
		return rDao.interviewListData(cno);
	}
	
	// 면접 후기 작성
	@Override
	public void interviewInsert(InterviewVO vo) {
		// TODO Auto-generated method stub
		rDao.interviewInsert(vo);
	}

	// 면접 후기 수정
	@Override
	public void interviewUpdate(InterviewVO vo) {
		// TODO Auto-generated method stub
		rDao.interviewUpdate(vo);
	}

	// 면접 후기 삭제
	@Override
	public void interviewDelete(int ino) {
		// TODO Auto-generated method stub
		rDao.interviewDelete(ino);
	}

	// 사용자 정보 읽기
	@Override
	public MemberVO memberInfoData(String userId) {
		// TODO Auto-generated method stub
		return rDao.memberInfoData(userId);
	}
}
