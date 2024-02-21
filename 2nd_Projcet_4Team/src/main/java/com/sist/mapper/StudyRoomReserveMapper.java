package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.StudyRoomTimeVO;

public interface StudyRoomReserveMapper {
	@Select("SELECT * FROM studyRoom_time WHERE sno=#{sno}")
	public List<StudyRoomTimeVO> studyRoomTimeData(int sno);
	
	@Select("SELECT time FROM studyRoom_time WHERE sno=#{sno} AND month=#{month} AND day=#{day}")
	public List<String> studyRoomTimeList(StudyRoomTimeVO vo);
}
