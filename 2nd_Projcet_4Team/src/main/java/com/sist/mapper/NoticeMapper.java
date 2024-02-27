package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.NoticeVO;

public interface NoticeMapper {
	@Select("SELECT no, title, TO_CHAR(regdate,'YYYY-MM-DD') as dbDay, num "
			+ "FROM (SELECT no, title, regdate, rownum as num "
			+ "FROM (SELECT no, title, regdate FROM codev_notice ORDER BY no DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<NoticeVO> noticeListData(@Param("start")int start, @Param("end")int end);
	
	@Select("SELECT CEIL(COUNT(*)/7.0) FROM codev_notice")
	public int noticeTotalpage();
	
	@Select("SELECT no, title, TO_CHAR(regdate,'YYYY-MM-DD') as dbDay, cont FROM codev_notice "
			+ "WHERE no = #{no}")
	public NoticeVO noticeDetailData(int no);
}
