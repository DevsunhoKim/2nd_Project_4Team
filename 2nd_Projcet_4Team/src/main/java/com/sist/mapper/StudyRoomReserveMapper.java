package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
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

   @Insert("INSERT INTO studyRoom_reserve VALUES((SELECT NVL(MAX(no)+1,1) FROM studyRoom_reserve),#{userId},#{sno},#{amount},#{price},SYSDATE,#{rdate},#{time})")
   public void studyRoomReserveInsert(StudyRoomReserveVO vo);

   @Insert("INSERT INTO studyRoom_rtime VALUES((SELECT NVL(MAX(no)+1,1) FROM studyRoom_rtime), (SELECT MAX(no) FROM studyRoom_reserve), #{time})")
   public void StudyRoomReserveTimeInsert(String time);

   @Update("UPDATE studyRoom_time SET ischeck=1 WHERE time=#{time} AND month=#{month} AND day=#{day} AND sno=#{sno}")
   public void StudyRoomTimeUpdate(StudyRoomTimeVO vo);
   
   @Select("SELECT MAX(no) FROM studyRoom_reserve WHERE userId=#{userId}")
   public int StudyRoomReserveFindMaxNo(String userId);
 
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
   
   @Select("SELECT no,sno,amount,price,userId,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,rdate,time,num "
	   		+ "FROM (SELECT no,sno,amount,price,userId,regdate,rdate,time,rownum as num "
	   		+ "FROM (SELECT no,sno,amount,price,userId,regdate,rdate,time "
	   		+ "FROM studyRoom_reserve ORDER BY no DESC)) "
	   		+ "WHERE num BETWEEN #{start} AND #{end}")
   public List<StudyRoomReserveVO> StudyRoomReserveAllList(Map map);
   
   @Select("SELECT CEIL(COUNT(*)/7.0) FROM studyRoom_reserve")
   public int StudyRoomReserveAllTotalpage(Map map);
   
   @Select("SELECT no,rno,time WHERE rno=#{no}")
   public List<StudyRoomRtimeVO> StudyRoomRtimeList(int no);
   
   @Select("SELECT COUNT(*) FROM studyRoom_reserve")
   public int StudyRoomReserveAllTotalCount();
   
   @Select("SELECT no,sno,amount,price,userId,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,rdate,time "
   		+ "FROM studyRoom_reserve WHERE no=#{no}")
   public StudyRoomReserveVO StudyRoomReserveData(int no);
   
   // 마이페이지
   @Results({
		  @Result(column="poster", property="svo.poster"),
		  @Result(column="name", property="svo.name")
		})
   @Select("SELECT no,userId,sno,amount,price,TO_CHAR(regdate,'YYYY-MM-DD'),rdate,time,poster,name,num "
   		+ "FROM (SELECT no,userId,sno,amount,price,regdate,rdate,time,poster,name,rownum AS num "
   		+ "FROM (SELECT sr.no,userId,sno,amount,sr.price,regdate,rdate,time,s.poster,s.name "
   		+ "FROM studyRoom s,studyRoom_reserve sr WHERE sr.sno=s.NO AND userId=#{userId} ORDER BY sr.no DESC)) "
   		+ "WHERE num BETWEEN #{start} AND #{end}")
   public List<StudyRoomReserveVO> myStudyRoomReserveList(Map map);
   
   @Select("SELECT CEIL(COUNT(*)/7.0) "
   		+ "FROM studyRoom s,studyRoom_reserve sr "
   		+ "WHERE sr.sno=s.NO AND userId=#{userId}")
   public int myStudyRoomReserveTotalpage(Map map);
   
   
}