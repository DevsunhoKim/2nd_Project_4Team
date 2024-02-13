package com.sist.service;

import java.util.List;

import com.sist.vo.StudyRoomVO;

public interface StudyRoomService {
	public List<StudyRoomVO> studyRoomListData();

	public StudyRoomVO studyRoomDetailData(int no);
}
