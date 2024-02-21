package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.MentorMapper;
import com.sist.vo.MentorVO;

@Repository
public class MentorDAO {
	private MentorMapper mapper;

    @Autowired
    MentorDAO(MentorMapper mapper){
        this.mapper = mapper;
    }

    public MentorVO getMentorByID(String userId) {
    	return mapper.getMentorByID(userId);
    }

    public void enrollMentor(MentorVO vo) {
    	mapper.enrollMentor(vo);
    	mapper.updateMentorById(vo.getUserId());
    }
}
