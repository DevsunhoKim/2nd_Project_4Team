package com.sist.service;

import com.sist.vo.*;

public interface MypageService {
	public MemberVO getMemberByID(String id); //아이디로 회원정보 조회
	public int updateMember(MemberVO vo); //회원정보 수정
}
