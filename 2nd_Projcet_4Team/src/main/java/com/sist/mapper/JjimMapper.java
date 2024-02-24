package com.sist.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.JjimVO;

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
}
