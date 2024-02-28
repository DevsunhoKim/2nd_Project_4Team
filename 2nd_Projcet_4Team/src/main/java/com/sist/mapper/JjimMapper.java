package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.CompanyVO;
import com.sist.vo.JjimVO;
import com.sist.vo.MentorVO;
import com.sist.vo.StudyRoomVO;

public interface JjimMapper {
	@Select("SELECT COUNT(*) FROM codev_jjim WHERE userId=#{userId} AND cateno=#{cateno} AND no=#{no}")
	public int jjimCount(JjimVO vo);

	@Insert("INSERT INTO codev_jjim VALUES((SELECT NVL(MAX(jno)+1,1) FROM codev_jjim),#{userId},#{cateno},#{no})")
	public void jjimInsert(JjimVO vo);

	@Delete("DELETE FROM codev_jjim WHERE userId=#{userId} AND cateno=#{cateno} AND no=#{no}")
	public void jjimDelete(JjimVO vo);

	@Update("UPDATE studyRoom SET jjim=jjim+1 WHERE no=#{no}")
	public void studyRoomJjimUpdate(int no);

	@Update("UPDATE studyRoom SET jjim=jjim-1 WHERE no=#{no}")
	public void studyRoomJjimUpdateMinus(int no);
	
	
	@Update("UPDATE mentor SET follower=follower+1 WHERE mno=#{mno}")
	public void MentorJjimUpdate(int mno);

	@Update("UPDATE mentor SET follower=follower-1 WHERE mno=#{mno}")
	public void MentorJjimUpdateMinus(int mno);
	
	@Update("UPDATE COMPANY SET like_count=like_count+1 WHERE cno=#{cno}")
	public void companyJjimUpdate(int cno);

	@Update("UPDATE COMPANY SET like_count=like_count-1 WHERE cno=#{cno}")
	public void companyJjimUpdateMinus(int cno);
	
	/*
	 *  SELECT s.no,poster,name
		FROM studyRoom s,codev_jjim j
		WHERE s.NO=j.no AND CATENO=2 AND userId='yoon';
		
		SELECT mno,img,m.NICKNAME
		FROM MENTOR mt,codev_jjim j,MEMBER m
		WHERE mt.MNO=j.no AND j.USERID=m.USERID AND CATENO=2 AND j.userId='yoon';
		
		SELECT cno,logo,name
		FROM COMPANY c,codev_jjim j
		WHERE c.cno=j.no AND CATENO=4 AND userId='yoon';
	 */
	
	@Select("SELECT s.no,poster,name "
			+ "FROM studyRoom s,codev_jjim j "
			+ "WHERE s.NO=j.no AND CATENO=2 AND userId=#{userId} ORDER BY j.no DESC")
	public List<StudyRoomVO> studyRoomJjim(String userId);
	
	@Results({
		  @Result(column="nickname", property="mvo.nickname")
	})
	@Select("SELECT mno,img,m.nickname "
			+ "		FROM MENTOR mt,codev_jjim j,MEMBER m "
			+ "		WHERE mt.MNO=j.no AND mt.USERID=m.USERID AND CATENO=1 AND j.userId=#{userId} ORDER BY j.no DESC")
	public List<MentorVO> mentorJjim(String userId);
	
	@Select("SELECT cno,logo,name "
			+ "		FROM COMPANY c,codev_jjim j "
			+ "		WHERE c.cno=j.no AND CATENO=4 AND userId=#{userId} ORDER BY j.no DESC")
	public List<CompanyVO> companyJjim(String userId);
	
}
