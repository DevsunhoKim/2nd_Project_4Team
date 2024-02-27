package com.sist.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.NoticeDAO;
import com.sist.vo.NoticeVO;

@Service
public class NoticeServiceIml implements NoticeService {
	private NoticeDAO dao;

    @Autowired
    NoticeServiceIml(NoticeDAO dao){
        this.dao = dao;
    }

	@Override
	public List<NoticeVO> noticeListData(int page) {
		int rowSize=7;
        int start=(rowSize*page)-(rowSize-1);
        int end=rowSize*page;
        List<NoticeVO> list = dao.noticeListData(start, end);
		return list;
	}

	@Override
	public Map noticeTotalpage(int page) {
		Map<String, Object> map=new HashMap<>();
		int totalpage=dao.noticeTotalpage();

		final int BLOCK=5;
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage>totalpage) {
			endPage=totalpage;
		}
		
		map.put("curpage", page);
		map.put("totalpage", totalpage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		
		return map;
	}

	@Override
	public NoticeVO noticeDetailData(int no) {
		NoticeVO vo = dao.noticeDetailData(no);
		return vo;
	}
	
}
