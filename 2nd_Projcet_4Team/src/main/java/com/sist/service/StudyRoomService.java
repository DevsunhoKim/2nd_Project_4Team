package com.sist.service;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.StudyRoomAskVO;

import com.sist.vo.StudyRoomReserveVO;
import com.sist.vo.StudyRoomTimeVO;
import com.sist.vo.StudyRoomVO;

public interface StudyRoomService {
   public List<StudyRoomVO> studyRoomListData();
   public StudyRoomVO studyRoomDetailData(int no);
   //스터디룸 예약 가능 시간 리스트
   public List<StudyRoomTimeVO> studyRoomTimeData(int sno);
   public List<String> studyRoomTimeList(StudyRoomTimeVO vo);
   //예약 인서트
   public void studyRoomReserveInsert(StudyRoomReserveVO vo);

   public void StudyRoomReserveTimeInsert(String time);

   public void StudyRoomTimeUpdate(StudyRoomTimeVO vo);
   
   //1:1문의
   public void StudyRoomAskInsert(StudyRoomAskVO vo);
   public List<StudyRoomAskVO> StudyRoomAskList(Map map);
   public int StudyRoomAskTotalpage(int sno);
   public StudyRoomAskVO StudyRoomAskDetail(int ano);
   public int StudyRoomAskCount(int sno);
   public void StudyRoomAskDelete(int ano);
   public void StudyRoomAskUpdate(StudyRoomAskVO vo);
   public void StudyRoomAskfileNoneUpdate(StudyRoomAskVO vo);
}