package com.sist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.StudyRoomDAO;
import com.sist.dao.StudyRoomReserveDAO;
import com.sist.vo.StudyRoomTimeVO;
import com.sist.vo.StudyRoomVO;

@Service
public class StudyRoomServiceImpl implements StudyRoomService{
	@Autowired
	private StudyRoomDAO sdao;
	@Autowired
	private StudyRoomReserveDAO srdao;
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
	@Override
	public List<StudyRoomTimeVO> studyRoomTimeData(int sno) {
		// TODO Auto-generated method stub
		return srdao.studyRoomTimeData(sno);
	}

}
