package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.*;

public interface MypageService {
	public MemberVO getMemberByID(String id); // 아이디로 회원정보 조회
	public int updateMember(MemberVO vo); // 회원정보 수정
	public String pwdCk(String userId,String pwd); // 비밀번호 확인
	public String member_withdraw(String userId, String pwd); // 회원탈퇴
	//public List<MentorReserveVO> getAllMyMentorRev(String userId); // 멘토링 예약정보

	//
	public List<StudyRoomVO> studyRoomJjim(String userId); //스터디룸담기 
	public List<CompanyVO> companyJjim(String userId); //관심기업
	public List<MentorVO> mentorJjim(String userId); //멘토팔로우
	public List<StudyRoomReserveVO> myStudyRoomReserveList(Map map); // 스터디룸 예약 리스트
    public int myStudyRoomReserveTotalpage(Map map); // 스터디룸 총페이지
	
	
}