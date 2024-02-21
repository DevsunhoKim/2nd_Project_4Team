package com.sist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.MentorDAO;
import com.sist.vo.MentorVO;

@Service
public class MentorServiceIml implements MentorService{
	private MentorDAO mDao;

    @Autowired
    MentorServiceIml(MentorDAO mDao){
        this.mDao = mDao;
    }

    @Override
	public MentorVO getMentorByID(String userId) {
    	return mDao.getMentorByID(userId);
    }

    @Override
	public void enrollMentor(MentorVO vo) {
    	mDao.enrollMentor(vo);
    }
}
