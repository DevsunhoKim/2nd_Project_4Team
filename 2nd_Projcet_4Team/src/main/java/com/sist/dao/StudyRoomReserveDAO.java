package com.sist.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.StudyRoomMapper;
import com.sist.mapper.StudyRoomReserveMapper;
import com.sist.vo.StudyRoomTimeVO;

@Repository
public class StudyRoomReserveDAO {
   @Autowired
   private StudyRoomReserveMapper mapper;
   
   public List<StudyRoomTimeVO> studyRoomTimeData(int sno){
      return mapper.studyRoomTimeData(sno);
   }
   public List<String> studyRoomTimeList(StudyRoomTimeVO vo)
   {
      return mapper.studyRoomTimeList(vo);
   }
}