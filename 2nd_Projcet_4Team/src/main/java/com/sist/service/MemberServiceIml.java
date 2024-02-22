package com.sist.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;
@Service
public class MemberServiceIml implements MemberService{
    private MemberDAO dao;

    @Autowired
    MemberServiceIml(MemberDAO dao){
        this.dao = dao;
    }

    @Override
    public MemberVO getMemberByID(String id){
        return dao.getMemberByID(id);
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

	@Override
	public String sendCode(String email, int code) {
		String res = dao.sendCode(email, code);
		return res;
	}
	
	@Override
	public String idFind(String email, int code) {
		String res = dao.idFind(email, code);
		return res;
	}
	
	@Override
	public String pwdFind(String userId, String email, String enTempPwd) {
		String tempPwd = enTempPwd;
		String res = dao.pwdFind(userId, email, tempPwd);
		return res;
	}
}
