package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.RecruitmentMapper;
import com.sist.vo.RecruitVO;

@Repository
public class RecruitmentDAO {
	@Autowired
	private RecruitmentMapper mapper;
	
	// 목록 출력
	public List<RecruitVO> recruitListData(int start, int end) {
		return mapper.recruitListData(start, end);
	}
	
	public int recruitTotalPage() {
		return mapper.recruitTotalPage();
	}
}
