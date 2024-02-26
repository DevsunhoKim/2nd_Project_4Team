package com.sist.service;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.*;
import com.sist.vo.*;
@Service
public class MainServiceIml implements MainService{
	private MentorDAO mDao;
	private RecruitmentDAO rDao;
	private BooksDAO bDao;
	
	@Autowired
	public MainServiceIml(MentorDAO mDao, RecruitmentDAO rDao, BooksDAO bDao) {
		this.mDao = mDao;
		this.rDao = rDao;
		this.bDao = bDao;
	}

	@Override
	public List<MentorVO> getMentorBytech(String engTech) {
		TechVO vo = rDao.getTechData(engTech);
		String cate = vo.getCate();
		List<MentorVO> mList = mDao.getMentorBytech(cate);
		
		for(MentorVO mvo : mList) {
			String kwd = mvo.getKeyword();
			if(kwd != null) {
				String[] kList = kwd.split("#");
				mvo.setKeywords(kList);
			}
		}
		return mList;
	}

	@Override
	public List<RecruitVO> getRecruitBytech(String engTech) {
		List<RecruitVO> rList = rDao.getRecruitBytech(engTech);
		
		for(RecruitVO vo : rList) {
			String[] stacks = vo.getStack_txt().split("|");
			vo.setStacks_txt(stacks);
		}
		return rList;
	}
	
	@Override
	public List<BooksVO> getBookstBytech(String engTech) {
		TechVO vo = rDao.getTechData(engTech);
		String korTech = vo.getKorTech();
		List<BooksVO> bList = bDao.getBookstBytech(engTech,korTech);
		return bList;
	}

}
