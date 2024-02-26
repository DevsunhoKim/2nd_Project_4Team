package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.*;
import com.sist.mapper.StudyRoomAskMapper;
import com.sist.vo.StudyRoomAskVO;

@Repository
public class StudyRoomAskDAO {
	@Autowired
	private StudyRoomAskMapper mapper;
	
	public void StudyRoomAskInsert(StudyRoomAskVO vo)
	{
		mapper.StudyRoomAskInsert(vo);
	}
	public List<StudyRoomAskVO> StudyRoomAskList(Map map){
		return mapper.StudyRoomAskList(map);
	}
	public int StudyRoomAskTotalpage(int sno) {
		return mapper.StudyRoomAskTotalpage(sno);
	}
	public int StudyRoomAskCount(int sno)
	{
		return mapper.StudyRoomAskCount(sno);
	}
	public StudyRoomAskVO StudyRoomAskDetail(int ano) {
		return mapper.StudyRoomAskDetail(ano);
	}
	public void StudyRoomAskDelete(int ano) {
		mapper.StudyRoomAskDelete(ano);
	}
	public void StudyRoomAskUpdate(StudyRoomAskVO vo) {
		mapper.StudyRoomAskUpdate(vo);
	}
	public void StudyRoomAskfileNoneUpdate(StudyRoomAskVO vo) {
		mapper.StudyRoomAskfileNoneUpdate(vo);
	}
	
}