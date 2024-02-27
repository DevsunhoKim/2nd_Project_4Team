package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.StudyRoomReserveVO;
import com.sist.vo.StudyRoomRtimeVO;
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
   
   
   //관리자 페이지
   @Select("SELECT no,sno,amount,price,userId,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,num "
   		+ "FROM (SELECT no,sno,amount,price,userId,regdate,rownum as num "
   		+ "FROM (SELECT no,sno,amount,price,userId,regdate "
   		+ "FROM studyRoom_reserve WHERE sno=#{sno} ORDER BY no DESC)) "
   		+ "WHERE num BETWEEN #{start} AND #{end}")
   public List<StudyRoomReserveVO> StudyRoomReserveList(Map map);
   
   
   @Select("SELECT CEIL(COUNT(*)/7.0) FROM studyRoom_reserve WHERE sno=#{sno}")
   public int StudyRoomReserveTotalpage(Map map);
   
   @Select("SELECT COUNT(*) FROM studyRoom_reserve WHERE sno=#{sno}")
   public int StudyRoomReserveTotalCount(Map map);
   
   @Select("SELECT no,sno,amount,price,userId,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,num "
	   		+ "FROM (SELECT no,sno,amount,price,userId,regdate,rownum as num "
	   		+ "FROM (SELECT no,sno,amount,price,userId,regdate "
	   		+ "FROM studyRoom_reserve ORDER BY no DESC)) "
	   		+ "WHERE num BETWEEN #{start} AND #{end}")
   public List<StudyRoomReserveVO> StudyRoomReserveAllList(Map map);
   
   @Select("SELECT CEIL(COUNT(*)/7.0) FROM studyRoom_reserve")
   public int StudyRoomReserveAllTotalpage(Map map);
   
   @Select("SELECT no,rno,time WHERE rno=#{no}")
   public List<StudyRoomRtimeVO> StudyRoomRtimeList(int no);
   
   @Select("SELECT COUNT(*) FROM studyRoom_reserve")
   public int StudyRoomReserveAllTotalCount();
}