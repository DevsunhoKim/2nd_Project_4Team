package com.sist.service;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.StudyRoomTimeVO;
import com.sist.vo.StudyRoomVO;

public interface StudyRoomService {
   public List<StudyRoomVO> studyRoomListData();
   public StudyRoomVO studyRoomDetailData(int no);
   //스터디룸 예약 가능 시간 리스트
   public List<StudyRoomTimeVO> studyRoomTimeData(int sno);
   public List<String> studyRoomTimeList(StudyRoomTimeVO vo);
}