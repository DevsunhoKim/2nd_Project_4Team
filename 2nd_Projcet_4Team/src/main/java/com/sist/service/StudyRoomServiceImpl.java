package com.sist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.StudyRoomDAO;
import com.sist.vo.StudyRoomVO;

@Service
public class StudyRoomServiceImpl implements StudyRoomService{
	@Autowired
	private StudyRoomDAO sdao;
	@Override
	public List<StudyRoomVO> studyRoomListData() {
		// TODO Auto-generated method stub
		return sdao.studyRoomListData();
	}
	@Override
	public StudyRoomVO studyRoomDetailData(int no) {
		// TODO Auto-generated method stub
		return sdao.studyRoomDetailData(no);
	}

}
