package com.sist.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.sist.mapper.MemberMapper;
import com.sist.vo.MemberVO;
import com.sist.vo.MentorVO;

@Repository
public class MemberDAO {
    private MemberMapper mapper;
    private BCryptPasswordEncoder encoder;

    @Autowired
    MemberDAO(MemberMapper mapper,BCryptPasswordEncoder encoder){
        this.mapper = mapper;
        this.encoder = encoder;
    }

    // id로 회원정보 가져오기
    public MemberVO getMemberByID(String userId){
        return mapper.getMemberByID(userId);
    }

    public int getIDCount(String userId){
        return mapper.getIDCount(userId);
    }

    public int getNicknameCount(String nickname){
        return mapper.getNicknameCount(nickname);
    }

    public int joinMember(MemberVO vo){
        return mapper.joinMember(vo);
    }

    public void memberAuthorityInsert(String userId) {
    	mapper.memberAuthorityInsert(userId);
    }

	public MemberVO login(String userId,String userPwd) {
		MemberVO dbVO=new MemberVO();
		   int count=mapper.getIDCount(userId);
		   if(count==0){
			   dbVO.setMsg("NOID");
		   }else{
			   dbVO=mapper.login(userId);
			   if(encoder.matches(userPwd, dbVO.getUserPwd())){
				   dbVO.setMsg("OK");
			   }
			   else{
				  dbVO.setMsg("NOPWD");
			   }
		   }
		   return dbVO;
	}

    public int updateMember(MemberVO vo){
        return mapper.updateMember(vo);
    }

    public void lastLoginUpdate(String name) {
    	mapper.lastLoginUpdate(name);
    }

    public String pwdFind(String userId,String email, String tempPwd) {
    	String msg = "";
		   int count=mapper.getIDCount(userId);
		   if(count==0){
			   msg = "NOID";
		   }
		   else{
			   int count2 = mapper.getEmailCountbyUserId(userId,email);
			   if(count2==0) {
				   msg = "NOEMAIL";
			   }else {
				   mapper.pwdFind(userId,tempPwd);
				   msg = "CHANGE_PWD";
			   }
		   }
		return msg;
    }

    public String sendCode(String email, int code) {
    	String msg = "";
		   int count=mapper.getEmailCount(email);
		   if(count==0){
			   msg = "NOEMAIL";
		   }
		   else{
			   mapper.sendCode(code, email);
			   msg = "SEND_CODE";
		   }
		return msg;
    }

    public String idFind(String email, int code) {
		   String userId = mapper.idFind(code,email);
		   if(userId == null || userId.isEmpty()){
			   userId = "WRONG_CODE";
		   }
		return userId;
    }
    
    public String pwdCk(String userId) {
    	return mapper.pwdCk(userId);
    }

    /*------- 회원 탈퇴 --------*/
	public void deleteSRoomRevById(String userId) {
		mapper.deleteSRoomRevById(userId);
	}

	public void deleteSRoomAskById(String userId) {
		 mapper.deleteSRoomAskById(userId);
	}

	public void deleteMentorRevById(String userId) {
		 mapper.deleteMentorRevById(userId);
	}

	public void deleteMentorById(String userId) {
		 mapper.deleteMentorById(userId);
	}
	
	public void deleteReview1ById(String userId) {
		 mapper.deleteReview1ById(userId);
	}

	public void deleteB_cartById(String userId) {
		 mapper.deleteB_cartById(userId);
	}

	public void deleteApplyById(String userId) {
		 mapper.deleteApplyById(userId);
	}

	public void deleteInterviewById(String userId) {
		 mapper.deleteInterviewById(userId);
	}

	public void deleteCodevJjimById(String userId) {
		 mapper.deleteCodevJjimById(userId);
	}

	public void deleteAuthorityById(String userId) {
		 mapper.deleteAuthorityById(userId);
	}

	public void deleteMemberById(String userId) {
		 mapper.deleteMemberById(userId);
	}
}
