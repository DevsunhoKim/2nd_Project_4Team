package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.StudyRoomReserveMapper;
import com.sist.vo.StudyRoomReserveVO;
import com.sist.vo.StudyRoomRtimeVO;
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
   public int StudyRoomReserveFindMaxNo(String userId)
   {
	   return mapper.StudyRoomReserveFindMaxNo(userId);
   }
   
   //관리자 페이지
   public List<StudyRoomReserveVO> StudyRoomReserveAllList(Map map)
   {
	   return mapper.StudyRoomReserveAllList(map);
   }
    
   public int StudyRoomReserveAllTotalpage(Map map) {
	   return mapper.StudyRoomReserveAllTotalpage(map);
   }

   public List<StudyRoomRtimeVO> StudyRoomRtimeList(int no){
	   return mapper.StudyRoomRtimeList(no);
   }
   
   public List<StudyRoomReserveVO> StudyRoomReserveList(Map map)
   {
	   return mapper.StudyRoomReserveList(map);
   }
   

   public int StudyRoomReserveTotalpage(Map map)
   {
	   return mapper.StudyRoomReserveTotalpage(map);
   }
   
   public int StudyRoomReserveTotalCount(Map map) {
	   return mapper.StudyRoomReserveTotalCount(map);
   }
   public int StudyRoomReserveAllTotalCount() {
	   return mapper.StudyRoomReserveAllTotalCount();
   }
   public StudyRoomReserveVO StudyRoomReserveData(int no) {
	   return mapper.StudyRoomReserveData(no);
   }
   
   public List<StudyRoomReserveVO> myStudyRoomReserveList(Map map)
   {
	   return mapper.myStudyRoomReserveList(map);
   }
   public int myStudyRoomReserveTotalpage(Map map) {
	   return mapper.myStudyRoomReserveTotalpage(map);
   }
}