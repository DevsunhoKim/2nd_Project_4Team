package com.sist.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.StudyRoomMapper;
import com.sist.mapper.StudyRoomReserveMapper;
import com.sist.vo.StudyRoomReserveVO;
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
   public void studyRoomReserveInsert(StudyRoomReserveVO vo) {
	    mapper.studyRoomReserveInsert(vo);
   }
	
   public void StudyRoomReserveTimeInsert(String time) {
		mapper.StudyRoomReserveTimeInsert(time);
   }
	
   public void StudyRoomTimeUpdate(StudyRoomTimeVO vo) {
		mapper.StudyRoomTimeUpdate(vo);
   }
}