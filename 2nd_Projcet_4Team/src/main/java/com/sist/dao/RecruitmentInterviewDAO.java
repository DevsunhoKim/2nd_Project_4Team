package com.sist.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.RecruitmentInterviewMapper;
import com.sist.vo.InterviewVO;

@Repository
public class RecruitmentInterviewDAO {
	@Autowired
	private RecruitmentInterviewMapper mapper;
	
//// 면접 후기 목록 출력
//public List<InterviewVO> interviewListData(int cno) {
//	return mapper.interviewListData(cno);
//}
//
//// 면접 후기 총 페이지 수
//public int interviewTotalPage() {
//	return mapper.interviewTotalPage();
//}
//
//// 면접 후기 상세보기
//public InterviewVO interviewDetailData(int ino) {
//	return mapper.interviewDetailData(ino);
//}
	
	// 면접 후기 목록 출력
	public List<InterviewVO> interviewListData(int cno) {
		return mapper.interviewListData(cno);
	}
	
	// 면접 후기 작성
	public void interviewInsert(InterviewVO vo) {
		mapper.interviewInsert(vo);
	}
	
	// 면접 후기 수정
	public void interviewUpdate(InterviewVO vo) {
		mapper.interviewUpdate(vo);
	}
	
	// 면접 후기 삭제
	public void interviewDelete(int ino) {
		mapper.interviewDelete(ino);
	}
}
