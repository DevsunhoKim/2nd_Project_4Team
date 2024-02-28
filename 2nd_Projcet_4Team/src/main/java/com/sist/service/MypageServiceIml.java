package com.sist.service;


import java.util.HashMap;
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
	public MypageServiceIml(MemberDAO mDao, MentorDAO mtDao, RecruitmentDAO rDao, BooksDAO bDao, StudyRoomDAO sDao,StudyRoomReserveDAO srDao,JjimDAO jDao,BCryptPasswordEncoder encoder) {
		this.mDao = mDao;
		this.mtDao = mtDao;
		this.sDao = sDao;
		this.rDao = rDao;
		this.bDao = bDao;
		this.srDao =srDao;
		this.jDao = jDao;
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

	@Override
	   public Map getAllMyMentorRev(String userId,int page) {
	      int rowSize=5;
	        int start=(rowSize*page)-(rowSize-1);
	        int end=rowSize*page;
	        
	        Map<String, Object> map=new HashMap<>();
	        map.put("start", start);
	        map.put("end", end);
	        map.put("userId", userId);
	        List<MentorReserveVO> list = mtDao.getAllMyMentorRev(map);
	        
	      int totalpage=mtDao.getMRTotalPage(userId);
	      
	      final int BLOCK=5;
	      int startPage=((page-1)/BLOCK*BLOCK)+1;
	      int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
	      
	      if(endPage>totalpage) {
	         endPage=totalpage;
	      }
	      
	      int totalCount = mtDao.getMRTotalCount(userId);
	      map.clear();
	      map.put("curpage", page);
	      map.put("totalpage", totalpage);
	      map.put("startPage", startPage);
	      map.put("endPage", endPage);
	      map.put("list", list);
	      map.put("totalCount", totalCount);
	      
	      return map;
	   }
    
}
