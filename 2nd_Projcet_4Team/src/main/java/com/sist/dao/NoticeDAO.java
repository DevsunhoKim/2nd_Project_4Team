package com.sist.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.NoticeMapper;
import com.sist.vo.NoticeVO;

@Repository
public class NoticeDAO {
	private NoticeMapper mapper;

    @Autowired
    NoticeDAO(NoticeMapper mapper){
        this.mapper = mapper;
    }
	public List<NoticeVO> noticeListData(int start, int end) {
		return mapper.noticeListData(start, end);
	}

	public int noticeTotalpage() {
		return mapper.noticeTotalpage();
	}
}
