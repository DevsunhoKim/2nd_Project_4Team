package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.StudyRoomAskVO;

public interface StudyRoomAskMapper {
	@Insert("INSERT INTO studyRoom_ASK "
			+ "VALUES((SELECT NVL(MAX(ano)+1,1) FROM studyRoom_ASK),#{sno},"
			+ "#{userId},#{name},#{content},SYSDATE,"
			+ "(SELECT NVL(MAX(group_id)+1,1) FROM studyRoom_ASK),0,"
			+ "#{filename},#{filesize},#{filecount},0,#{cate},#{email},#{subject})")
	public void StudyRoomAskInsert(StudyRoomAskVO vo);
	
	@Select("SELECT ano,sno,group_id,group_step,state,userId,name,content,filename,"
			+ "filesize,cate,email,subject,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,num"
			+ " FROM (SELECT ano,sno,group_id,group_step,state,userId,name,content,filename,"
			+ "filesize,cate,email,subject,regdate,rownum as num "
			+ "FROM (SELECT * FROM studyRoom_ASK WHERE sno=#{sno} ORDER BY ano DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<StudyRoomAskVO> StudyRoomAskList(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM studyRoom_ASK WHERE sno=#{sno}")
	public int StudyRoomAskTotalpage(int sno);
	
	@Select("SELECT COUNT(*) FROM studyRoom_ASK WHERE sno=#{sno}")
	public int StudyRoomAskCount(int sno);
}
