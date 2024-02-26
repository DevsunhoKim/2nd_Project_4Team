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
	public int StudyRoomAskTotalpage(Map map) {
		return mapper.StudyRoomAskTotalpage(map);
	}
	public int StudyRoomAskCount(Map map)
	{
		return mapper.StudyRoomAskCount(map);
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
