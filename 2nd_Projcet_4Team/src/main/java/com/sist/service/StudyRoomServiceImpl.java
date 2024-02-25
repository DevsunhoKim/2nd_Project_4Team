package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.StudyRoomAskDAO;
import com.sist.dao.StudyRoomDAO;
import com.sist.dao.StudyRoomReserveDAO;
import com.sist.vo.StudyRoomAskVO;
import com.sist.vo.StudyRoomReserveVO;
import com.sist.vo.StudyRoomTimeVO;
import com.sist.vo.StudyRoomVO;

@Service
public class StudyRoomServiceImpl implements StudyRoomService{
	@Autowired
	private StudyRoomDAO sdao;
	@Autowired
	private StudyRoomReserveDAO srdao;
	@Autowired
	private StudyRoomAskDAO sadao;
	
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
	@Override
	public void StudyRoomAskInsert(StudyRoomAskVO vo) {
		// TODO Auto-generated method stub
		sadao.StudyRoomAskInsert(vo);
	}
	@Override
	public List<StudyRoomAskVO> StudyRoomAskList(Map map) {
		// TODO Auto-generated method stub
		return sadao.StudyRoomAskList(map);
	}
	@Override
	public int StudyRoomAskTotalpage(int sno) {
		// TODO Auto-generated method stub
		return sadao.StudyRoomAskTotalpage(sno);
	}
	@Override
	public StudyRoomAskVO StudyRoomAskDetail(int ano) {
		// TODO Auto-generated method stub
		return sadao.StudyRoomAskDetail(ano);
	}
	@Override
	public int StudyRoomAskCount(int sno) {
		// TODO Auto-generated method stub
		return sadao.StudyRoomAskCount(sno);
	}
	@Override
	public void StudyRoomAskDelete(int ano) {
		// TODO Auto-generated method stub
		sadao.StudyRoomAskDelete(ano);
	}
	@Override
	public void StudyRoomAskUpdate(StudyRoomAskVO vo) {
		// TODO Auto-generated method stub
		sadao.StudyRoomAskUpdate(vo);
	}
	@Override
	public void StudyRoomAskfileNoneUpdate(StudyRoomAskVO vo) {
		// TODO Auto-generated method stub
		sadao.StudyRoomAskfileNoneUpdate(vo);
	}
	

}
