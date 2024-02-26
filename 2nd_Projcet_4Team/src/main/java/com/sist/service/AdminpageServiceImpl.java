package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.StudyRoomAskDAO;
import com.sist.vo.StudyRoomAskVO;

@Service
public class AdminpageServiceImpl implements AdminpageService{
	@Autowired
	private StudyRoomAskDAO saDao;
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

}
