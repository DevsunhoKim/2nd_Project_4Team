package com.sist.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;
@Service
public class MemberServiceIml implements MemberService{

    private MemberDAO dao;
    private BCryptPasswordEncoder pwdEncoder;

    @Autowired
    MemberServiceIml(MemberDAO dao, BCryptPasswordEncoder encoder){
        this.dao = dao;
        this.pwdEncoder = encoder;
    }

    @Override
    public MemberVO getMemberByID(String id){
        return dao.getMemberByID(id);
		/*
		 * // 성별 전환 if(member.getGender().equals("m")){
		 * member.setGender("남자"); } else{
		 * member.setGender("여자"); }
		 *
		 * return member;
		 */
    }

    @Override
    public int getIDCount(String id) {
        return dao.getIDCount(id);
    }

    @Override
    public int getNicknameCount(String nickname) {
        return dao.getNicknameCount(nickname);
    }

    @Override
    public int updateMember(MemberVO member) {
        return dao.updateMember(member);
    }

	@Override
	public int joinMember(MemberVO vo) {
		return dao.joinMember(vo);
	}

	@Override
	public void memberAuthorityInsert(String userId) {
		dao.memberAuthorityInsert(userId);

	}

	@Override
	public MemberVO login(String userId, String userPwd) {
		return dao.login(userId, userPwd);
	}

	@Override
	public void lastLoginUpdate(String name) {
		dao.lastLoginUpdate(name);
		
	}

}
