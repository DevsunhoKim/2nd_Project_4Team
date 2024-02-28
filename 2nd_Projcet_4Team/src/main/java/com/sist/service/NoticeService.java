package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.MentorReserveVO;
import com.sist.vo.MentorVO;
import com.sist.vo.NoticeVO;

public interface NoticeService {
	public List<NoticeVO> noticeListData(int page);
	public Map noticeTotalpage(int page);
	public NoticeVO noticeDetailData(int no);
}
