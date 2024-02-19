package com.sist.service;

import com.sist.vo.MemberVO;

public interface MemberService {
	public MemberVO getMemberByID(String id); // 아이디로 회원정보 조회
    public int getIDCount(String userId); // 아이디 중복 조회
    public int getNicknameCount(String nickname); // 닉네임 중복 조회
    public int joinMember(MemberVO vo); // 회원가입
	public void memberAuthorityInsert(String userId); // 회원 권한부여
	public MemberVO login(String userId,String userPwd); // 로그인
    public int updateMember(MemberVO vo); //회원정보 수정
}
