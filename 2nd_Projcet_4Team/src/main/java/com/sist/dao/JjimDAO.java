package com.sist.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.JjimMapper;
import com.sist.vo.CompanyVO;
import com.sist.vo.JjimVO;
import com.sist.vo.MentorVO;
import com.sist.vo.StudyRoomVO;

@Repository
public class JjimDAO {
	@Autowired
	private JjimMapper mapper;

	public int jjimCount(JjimVO vo) {
		return mapper.jjimCount(vo);
	}
    public void jjimInsert(JjimVO vo)
    {
    	mapper.jjimInsert(vo);
    	mapper.studyRoomJjimUpdate(vo.getNo());
    }

	public void jjimDelete(JjimVO vo) {

		mapper.jjimDelete(vo);
		mapper.studyRoomJjimUpdateMinus(vo.getNo());
	}
    public List<StudyRoomVO> studyRoomJjim(String userId)
    {
    	return mapper.studyRoomJjim(userId);
    }
	
	public List<CompanyVO> companyJjim(String userId)
	{
		return mapper.companyJjim(userId);
	}
	
	public List<MentorVO> mentorJjim(String userId)
	{
		return mapper.mentorJjim(userId);
	}
	
	//멘토 찜하기
	public void MentorjjimInsert(JjimVO vo) {
		mapper.jjimInsert(vo);
		mapper.MentorJjimUpdate(vo.getNo());
	}
	public void MentorjjimDelete(JjimVO vo) {
		mapper.jjimDelete(vo);
		mapper.MentorJjimUpdateMinus(vo.getNo());
	}
	// 관심기업 찜하기
	public void companyjimInsert(JjimVO vo) {
		mapper.jjimInsert(vo);
		mapper.companyJjimUpdate(vo.getNo());
	}
	public void companyjjimDelete(JjimVO vo) {
		mapper.jjimDelete(vo);
		mapper.companyJjimUpdateMinus(vo.getNo());
	}

}
