package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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
			+ "FROM (SELECT * FROM studyRoom_ASK WHERE sno=#{sno} AND cate LIKE '%'||#{cate}||'%' ORDER BY ano DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<StudyRoomAskVO> StudyRoomAskList(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/7.0) FROM studyRoom_ASK WHERE sno=#{sno} AND cate LIKE '%'||#{cate}||'%'")
	public int StudyRoomAskTotalpage(Map map);
	
	@Select("SELECT COUNT(*) FROM studyRoom_ASK WHERE sno=#{sno} AND cate LIKE '%'||#{cate}||'%'")
	public int StudyRoomAskCount(Map map);
	
	@Select("SELECT ano,sno,group_id,group_step,state,userId,name,content,filename," 
			+"filesize,cate,email,subject,TO_CHAR(regdate,'YYYY-MM-DD') as dbday "
			+ "FROM studyRoom_ASK WHERE ano=#{ano}")
	public StudyRoomAskVO StudyRoomAskDetail(int ano);
	
	@Select("SELECT ano,sno,group_id,group_step,state,userId,name,content,filename," 
			+"filesize,cate,email,subject,TO_CHAR(regdate,'YYYY-MM-DD') as dbday "
			+ "FROM studyRoom_ASK WHERE ano=#{ano} AND group_id=#{group_id} AND group_step=#{group_step}")
	public StudyRoomAskVO StudyRoomAskReturnData(Map map);
	
	@Delete("DELETE FROM studyRoom_ASK WHERE ano=#{ano}")
	public void StudyRoomAskDelete(int ano);
	
	@Update("UPDATE studyRoom_ASK SET name=#{name}, cate=#{cate}, subject=#{subject}, content=#{content}, email=#{email},"
			+ "filename=#{filename}, filesize=#{filesize}, filecount=#{filecount} "
			+ "WHERE ano=#{ano}")
	public void StudyRoomAskUpdate(StudyRoomAskVO vo);
	
	@Update("UPDATE studyRoom_ASK SET name=#{name}, cate=#{cate}, subject=#{subject}, content=#{content}, email=#{email} "
			+ "WHERE ano=#{ano}")
	public void StudyRoomAskfileNoneUpdate(StudyRoomAskVO vo);
	
	
	
	// adminpage
	@Select("SELECT ano,sno,group_id,group_step,state,userId,name,content,filename,"
			+ "filesize,cate,email,subject,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,num"
			+ " FROM (SELECT ano,sno,group_id,group_step,state,userId,name,content,filename,"
			+ "filesize,cate,email,subject,regdate,rownum as num "
			+ "FROM (SELECT * FROM studyRoom_ASK ORDER BY ano DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<StudyRoomAskVO> AdminRoomAskList(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/7.0) FROM studyRoom_ASK")
	public int AdminRoomAskTotalpage();
	
	@Select("SELECT COUNT(*) FROM studyRoom_ASK")
	public int AdminRoomAskCount();
	
	
	
	
	
}
