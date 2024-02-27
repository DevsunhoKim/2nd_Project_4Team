package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.StudyRoomAskVO;
import com.sist.vo.StudyRoomReserveVO;
import com.sist.vo.StudyRoomRtimeVO;

public interface AdminpageService {
	//스터디룸
	public List<StudyRoomAskVO> AdminRoomAskList(Map map);
	public int AdminRoomAskTotalpage();
	public int AdminRoomAskCount();
	public void StudyRoomAskReturnInsert(StudyRoomAskVO vo);
	public List<StudyRoomReserveVO> StudyRoomReserveAllList(Map map);
	public int StudyRoomReserveAllTotalpage(Map map);
	public List<StudyRoomRtimeVO> StudyRoomRtimeList(int no);
	public List<StudyRoomReserveVO> StudyRoomReserveList(Map map);
    public int StudyRoomReserveTotalpage(Map map);
    public int StudyRoomReserveTotalCount(Map map);
    public int StudyRoomReserveAllTotalCount();
    public StudyRoomReserveVO StudyRoomReserveData(int no);
}
