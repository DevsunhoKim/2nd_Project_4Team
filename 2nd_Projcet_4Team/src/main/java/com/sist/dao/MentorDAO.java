package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.MentorMapper;
import com.sist.vo.MentorReserveVO;
import com.sist.vo.MentorVO;

@Repository
public class MentorDAO {
	private MentorMapper mapper;

    @Autowired
    MentorDAO(MentorMapper mapper){
        this.mapper = mapper;
    }

    public void enrollMentor(MentorVO vo) {
    	mapper.enrollMentor(vo);
    	mapper.updateMentorById(vo.getUserId());
    }
    
    public List<MentorVO> getMentorListBymap(Map map){
    	return mapper.getMentorListBymap(map);
    }

	public int getTotalMentorPageBymap(Map map) {
		return mapper.getTotalMentorPageBymap(map);
	}
	
	public MentorVO mentorDetailData(int mno) {
		return mapper.mentorDetailData(mno);
	}

	public void insertMentoring(MentorReserveVO vo) {
		mapper.insertMentoring(vo);
	}
	
	public void increaseRevCnt(int mno) {
		mapper.increaseRevCnt(mno);
	}
	
	public List<MentorVO> getMentorBytech(String cate){
		return mapper.getMentorBytech(cate);
	}
	
	public List<MentorReserveVO> getAllMyMentorRev(String userId){
		 return mapper.getAllMyMentorRev(userId);
	 }
}
