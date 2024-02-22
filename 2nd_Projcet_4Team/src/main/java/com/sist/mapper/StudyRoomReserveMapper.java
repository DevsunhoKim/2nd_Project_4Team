package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.StudyRoomReserveVO;
import com.sist.vo.StudyRoomTimeVO;
/*
 * 
 * private int tno,sno,month,day,ischeck;
   private String time;
 */
public interface StudyRoomReserveMapper {
   @Select("SELECT tno,sno,month,day,ischeck,time FROM studyRoom_time WHERE sno=#{sno}")
   public List<StudyRoomTimeVO> studyRoomTimeData(int sno);
   
   @Select("SELECT time FROM studyRoom_time WHERE sno=#{sno} AND month=#{month} AND day=#{day} AND ischeck=0")
   public List<String> studyRoomTimeList(StudyRoomTimeVO vo);
   /*
    * 
   no NUMBER,
    userId VARCHAR2(100),
    sno NUMBER,
    amount NUMBER CONSTRAINT srr_amount_nn NOT NULL,
    price NUMBER CONSTRAINT srr_price_nn NOT NULL,
    regdate
    */
   @Insert("INSERT INTO studyRoom_reserve VALUES(srr_no_seq.nextval,#{userId},#{sno},#{amount},#{price},SYSDATE)")
   public void studyRoomReserveInsert(StudyRoomReserveVO vo);
   
   @Insert("INSERT INTO studyRoom_rtime VALUES(srt_no_seq.nextval, (SELECT MAX(no) FROM studyRoom_reserve), #{time})")
   public void StudyRoomReserveTimeInsert(String time);
   
   @Update("UPDATE studyRoom_time SET ischeck=1 WHERE time=#{time} AND month=#{month} AND day=#{day}")
   public void StudyRoomTimeUpdate(StudyRoomTimeVO vo);
}