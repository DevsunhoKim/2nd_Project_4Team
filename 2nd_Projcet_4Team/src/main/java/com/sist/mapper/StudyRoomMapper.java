package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.StudyRoomVO;

public interface StudyRoomMapper {
	@Select("SELECT no,name,poster,price,inwon,jjim,rownum "
			+ "FROM (SELECT no,name,poster,price,inwon,jjim "
			+ "FROM studyRoom ORDER BY no ASC) "
			+ "WHERE rownum BETWEEN 1 AND 4")
	public List<StudyRoomVO> studyRoomListData();

	@Select("SELECT no,jjim,name,poster,price,inwon,area,lobby,conve,deimage "
			+ "FROM studyRoom WHERE no=#{no}")
	public StudyRoomVO studyRoomDetailData(int no);
}
