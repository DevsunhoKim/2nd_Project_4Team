package com.sist.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.RecruitmentMapper;
import com.sist.vo.CompanyVO;
import com.sist.vo.RecruitVO;

@Repository
public class RecruitmentDAO {
	@Autowired
	private RecruitmentMapper mapper;

	// 목록 출력
	public List<RecruitVO> recruitListData(int start, int end) {
		return mapper.recruitListData(start, end);
	}

	// 총 페이지
	public int recruitTotalPage() {
		return mapper.recruitTotalPage();
	}

	// 1. 채용 공고 정보
	public RecruitVO recuitDetailData(int rno) {
		return mapper.recuitDetailData(rno);
	}

	// 2. 기업 정보
	public CompanyVO companyDetailData(int cno) {
		return mapper.companyDetailData(cno);
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
}
