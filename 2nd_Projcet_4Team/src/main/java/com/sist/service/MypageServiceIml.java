package com.sist.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sist.dao.*;
import com.sist.vo.*;
@Service
public class MypageServiceIml implements MypageService{
	private MemberDAO mDao;
	private MentorDAO mtDao;
	private StudyRoomDAO sDao;
	private RecruitmentDAO rDao;
	private BooksDAO bDao;
	private JjimDAO jDao;
	private StudyRoomReserveDAO srDao;
	private BCryptPasswordEncoder encoder;
	
	@Autowired
	public MypageServiceIml(MemberDAO mDao, MentorDAO mtDao, RecruitmentDAO rDao, BooksDAO bDao, StudyRoomDAO sDao,StudyRoomReserveDAO srDao,BCryptPasswordEncoder encoder) {
		this.mDao = mDao;
		this.mtDao = mtDao;
		this.sDao = sDao;
		this.rDao = rDao;
		this.bDao = bDao;
		this.srDao =srDao;
		this.encoder = encoder;
	}
	
    @Override
    public int updateMember(MemberVO vo) {
    	System.out.println(vo.getUserPwd());
    	String enPwd=encoder.encode(vo.getUserPwd());// 비밀번호 암호화
    	vo.setUserPwd(enPwd);
        return mDao.updateMember(vo);
    }

	@Override
	public MemberVO getMemberByID(String id) {
		return mDao.getMemberByID(id);
	}

	@Override
	public String pwdCk(String userId,String pwd) {
		String res = "";
		String dbPwd = mDao.pwdCk(userId);
		if(encoder.matches(pwd,dbPwd)) {
			res = "YES";
		}else {
			res = "NOPWD";
		}
		return res;
	}
	
	@Transactional
	@Override
	public String member_withdraw(String userId,String pwd) {
		String res = "";
		String dbPwd = mDao.pwdCk(userId);
		if(encoder.matches(pwd,dbPwd)) {
			mDao.deleteSRoomRevById(userId);
			mDao.deleteSRoomAskById(userId);
			mDao.deleteMentorRevById(userId);
			mDao.deleteMentorById(userId);
			mDao.deleteReview1ById(userId);
			mDao.deleteB_cartById(userId);
			mDao.deleteApplyById(userId);
			mDao.deleteInterviewById(userId);
			mDao.deleteCodevJjimById(userId);
			mDao.deleteAuthorityById(userId);
			mDao.deleteMemberById(userId);
			res = "YES";
		}else {
			res = "NO";
		}
		return res;
	}

	@Override
	public List<MentorReserveVO> getAllMyMentorRev(String userId) {
		return mtDao.getAllMyMentorRev(userId);
	}

	@Override
	public List<StudyRoomVO> studyRoomJjim(String userId) {
		// TODO Auto-generated method stub
		return jDao.studyRoomJjim(userId);
	}

	@Override
	public List<CompanyVO> companyJjim(String userId) {
		// TODO Auto-generated method stub
		return jDao.companyJjim(userId);
	}

	@Override
	public List<MentorVO> mentorJjim(String userId) {
		// TODO Auto-generated method stub
		return jDao.mentorJjim(userId);
	}

	@Override
	public List<StudyRoomReserveVO> myStudyRoomReserveList(Map map) {
		// TODO Auto-generated method stub
		return srDao.myStudyRoomReserveList(map);
	}

	@Override
	public int myStudyRoomReserveTotalpage(Map map) {
		// TODO Auto-generated method stub
		return srDao.myStudyRoomReserveTotalpage(map);
	}
    
}
