package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.StudyRoomAskDAO;
import com.sist.dao.StudyRoomReserveDAO;
import com.sist.vo.StudyRoomAskVO;
import com.sist.vo.StudyRoomReserveVO;
import com.sist.vo.StudyRoomRtimeVO;

@Service
public class AdminpageServiceImpl implements AdminpageService{
	@Autowired
	private StudyRoomAskDAO saDao;
	@Autowired
	private StudyRoomReserveDAO srDao;
	
	//스터디룸
	@Override
	public List<StudyRoomAskVO> AdminRoomAskList(Map map) {
		// TODO Auto-generated method stub
		return saDao.AdminRoomAskList(map);
	}

	@Override
	public int AdminRoomAskTotalpage() {
		// TODO Auto-generated method stub
		return saDao.AdminRoomAskTotalpage();
	}

	@Override
	public int AdminRoomAskCount() {
		// TODO Auto-generated method stub
		return saDao.AdminRoomAskCount();
	}

	@Override
	public void StudyRoomAskReturnInsert(StudyRoomAskVO vo) {
		// TODO Auto-generated method stub
		saDao.StudyRoomAskReturnInsert(vo);
	}

	@Override
	public List<StudyRoomReserveVO> StudyRoomReserveAllList(Map map) {
		// TODO Auto-generated method stub
		return srDao.StudyRoomReserveAllList(map);
	}

	@Override
	public int StudyRoomReserveAllTotalpage(Map map) {
		// TODO Auto-generated method stub
		return srDao.StudyRoomReserveAllTotalpage(map);
	}

	@Override
	public List<StudyRoomRtimeVO> StudyRoomRtimeList(int no) {
		// TODO Auto-generated method stub
		return srDao.StudyRoomRtimeList(no);
	}

	@Override
	public List<StudyRoomReserveVO> StudyRoomReserveList(Map map) {
		// TODO Auto-generated method stub
		return srDao.StudyRoomReserveList(map);
	}

	@Override
	public int StudyRoomReserveTotalpage(Map map) {
		// TODO Auto-generated method stub
		return srDao.StudyRoomReserveTotalpage(map);
	}

	@Override
	public int StudyRoomReserveTotalCount(Map map) {
		// TODO Auto-generated method stub
		return srDao.StudyRoomReserveTotalCount(map);
	}

	@Override
	public int StudyRoomReserveAllTotalCount() {
		// TODO Auto-generated method stub
		return srDao.StudyRoomReserveAllTotalCount();
	}

	@Override
	public StudyRoomReserveVO StudyRoomReserveData(int no) {
		// TODO Auto-generated method stub
		return srDao.StudyRoomReserveData(no);
	}

}
