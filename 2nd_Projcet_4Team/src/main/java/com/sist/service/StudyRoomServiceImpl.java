package com.sist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.StudyRoomDAO;
import com.sist.dao.StudyRoomReserveDAO;
import com.sist.vo.StudyRoomReserveVO;
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

	//스터디룸 예약가능 시간 리스트
	@Override
	public List<StudyRoomTimeVO> studyRoomTimeData(int sno) {
		// TODO Auto-generated method stub
		return srdao.studyRoomTimeData(sno);
	}
	@Override
	public List<String> studyRoomTimeList(StudyRoomTimeVO vo) {
		// TODO Auto-generated method stub
		return srdao.studyRoomTimeList(vo);
	}
	@Override
	public void studyRoomReserveInsert(StudyRoomReserveVO vo) {
		// TODO Auto-generated method stub
		srdao.studyRoomReserveInsert(vo);
	}
	@Override
	public void StudyRoomReserveTimeInsert(String time) {
		// TODO Auto-generated method stub
		srdao.StudyRoomReserveTimeInsert(time);
	}
	@Override
	public void StudyRoomTimeUpdate(StudyRoomTimeVO vo) {
		// TODO Auto-generated method stub
		srdao.StudyRoomTimeUpdate(vo);
	}
	

}
