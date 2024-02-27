package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.StudyRoomAskVO;

public interface AdminpageService {
	public List<StudyRoomAskVO> AdminRoomAskList(Map map);
	public int AdminRoomAskTotalpage();
	public int AdminRoomAskCount();
	public void StudyRoomAskReturnInsert(StudyRoomAskVO vo);
}
