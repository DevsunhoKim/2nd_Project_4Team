package com.sist.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.RecruitmentMapper;
import com.sist.vo.ApplyVO;
import com.sist.vo.CompanyVO;
import com.sist.vo.MemberVO;
import com.sist.vo.RecruitVO;

// RecruitmentMapper를 주입받아 데이터베이스에서 데이터를 가져오는 역할
@Repository
public class RecruitmentDAO {
	@Autowired
	private RecruitmentMapper mapper;

	// 채용 공고 목록 출력
	public List<RecruitVO> recruitListData(int start, int end) {
		return mapper.recruitListData(start, end);
	}

	// 채용 공고 목록 총 페이지
	public int recruitTotalPage() {
		return mapper.recruitTotalPage();
	}
	
	// 채용 공고 검색
	public List<RecruitVO> recruitFindData(String word) {
		return mapper.recruitFindData(word);
	}

	// 채용 공고 정보 상세보기 => RecruitmentMapper의 recuitDetailData 메서드를 호출하여 채용 공고 정보를 가져오기
	public RecruitVO recuitDetailData(int rno) {
		return mapper.recuitDetailData(rno);
	}
	
	// 채용 공고 추가
	public void recruitInsert(RecruitVO vo) {
		mapper.recruitInsert(vo);
	}

	// 채용 공고 수정
	public void recruitUpdate(RecruitVO vo) {
		mapper.recruitUpdate(vo);
	}

	// 채용 공고 삭제
	public void recruitDelete(int rno) {
		mapper.recruitDelete(rno);
	}

	
	// 기업 정보 상세보기 => RecruitmentMapper의 companyDetailData 메서드를 호출하여 기업 정보를 가져오기
	public CompanyVO companyDetailData(int cno) {
		return mapper.companyDetailData(cno);
	}
	
	// 기업 정보 추가
	public void companyInsert(CompanyVO vo) {
		mapper.companyInsert(vo);
	}
	
	// 기업 정보 수정
	public CompanyVO companyUpdate(int cno) {
		return mapper.companyUpdate(cno);
	}
	
	// 기업 정보 삭제
	public void companyDelete(int cno) {
		mapper.companyDelete(cno);
	}
	
	
	// 지원하기
	public void applyInsert(ApplyVO vo) {
		mapper.applyInsert(vo);
	}
	
	// 지원서 수정
	public void applyUpdate(ApplyVO vo) {
		mapper.applyUpdate(vo);
	}
	
	// 지원 취소(삭제)
	public void applyDelete(int ano) {
		mapper.applyDelete(ano);
	}

	
	// 사용자 정보 읽기
	public MemberVO memberInfoData(String userId) {
		return mapper.memberInfoData(userId);
	}
}
