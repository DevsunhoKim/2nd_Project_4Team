package com.sist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.RecruitmentDAO;
import com.sist.dao.RecruitmentInterviewDAO;
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
	
	@Autowired
	private RecruitmentInterviewDAO iDao;
	
	// 채용 공고 메인 출력
	@Override
	public List<RecruitVO> recruitMainData() {
		// TODO Auto-generated method stub
		return rDao.recruitMainData();
	}

	// 채용 공고 목록 출력
	@Override
	public List<RecruitVO> recruitListData(int start, int end) {
		// TODO Auto-generated method stub
		return rDao.recruitListData(start, end);
	}

	// 채용 공고 목록 총 페이지 수
	@Override
	public int recruitTotalPage() {
		// TODO Auto-generated method stub
		return rDao.recruitTotalPage();
	}
	
	// 채용 공고 검색
	@Override
	public List<RecruitVO> recruitFindData(String word) {
		// TODO Auto-generated method stub
		return rDao.recruitFindData(word);
	}
	
	// 채용 공고 정렬
	@Override
	public List<RecruitVO> recruitSortListData(int start, int end, String sortBy) {
		// TODO Auto-generated method stub
		return rDao.recruitSortListData(start, end, sortBy);
	}
	
	// 채용 공고 상세보기
	@Override
	public RecruitVO recuitDetailData(int rno) {
		// TODO Auto-generated method stub
		return rDao.recuitDetailData(rno);
	}

//	// 채용 공고 추가
//	@Override
//	public void recruitInsert(RecruitVO vo) {
//		// TODO Auto-generated method stub
//		rDao.recruitInsert(vo);
//	}
//
//	// 채용 공고 수정
//	@Override
//	public void recruitUpdate(RecruitVO vo) {
//		// TODO Auto-generated method stub
//		rDao.recruitUpdate(vo);
//	}
//
//	// 채용 공고 삭제
//	@Override
//	public void recruitDelete(int rno) {
//		// TODO Auto-generated method stub
//		rDao.recruitDelete(rno);
//	}
	
	// 기업 정보 상세보기
	@Override
	public CompanyVO companyDetailData(int cno) {
		// TODO Auto-generated method stub
		return rDao.companyDetailData(cno);
	}
	
	// 기업 정보 - 채용 공고 목록 출력
	@Override
	public List<RecruitVO> companyRecruitListData(int cno) {
		// TODO Auto-generated method stub
		return rDao.companyRecruitListData(cno);
	}
	
//	// 기업 정보 작성
//	@Override
//	public void companyInsert(CompanyVO vo) {
//		// TODO Auto-generated method stub
//		rDao.companyInsert(vo);
//	}
//
//	// 기업 정보 수정
//	@Override
//	public CompanyVO companyUpdate(int cno) {
//		// TODO Auto-generated method stub
//		return rDao.companyUpdate(cno);
//	}
//
//	// 기업 정보 삭제
//	@Override
//	public void companyDelete(int cno) {
//		// TODO Auto-generated method stub
//		rDao.companyDelete(cno);
//	}
	
	// 지원하기
	@Override
	public void applyInsert(ApplyVO vo) {
		// TODO Auto-generated method stub
		rDao.applyInsert(vo);
	}
	
//	// 지원서 수정
//	@Override
//	public void applyUpdate(ApplyVO vo) {
//		// TODO Auto-generated method stub
//		rDao.applyUpdate(vo);
//	}
	
	// 지원 취소(삭제)
	@Override
	public void applyDelete(int ano) {
		// TODO Auto-generated method stub
		rDao.applyDelete(ano);
	}
	
	// 사용자 정보 읽기
	@Override
	public MemberVO memberInfoData(String userId) {
		// TODO Auto-generated method stub
		return rDao.memberInfoData(userId);
	}

	
	// 면접 후기 목록 출력
	@Override
	public List<InterviewVO> interviewListData(int cno) {
		// TODO Auto-generated method stub
		return iDao.interviewListData(cno);
	}
	
	// 면접 후기 작성
	@Override
	public void interviewInsert(InterviewVO vo) {
		// TODO Auto-generated method stub
		iDao.interviewInsert(vo);
	}

	// 면접 후기 수정
	@Override
	public void interviewUpdate(InterviewVO vo) {
		// TODO Auto-generated method stub
		iDao.interviewUpdate(vo);
	}

	// 면접 후기 삭제
	@Override
	public void interviewDelete(int ino, String userId) {
		// TODO Auto-generated method stub
		iDao.interviewDelete(ino, userId);
	}
}
