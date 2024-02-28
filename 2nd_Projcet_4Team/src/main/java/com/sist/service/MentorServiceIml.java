package com.sist.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sist.dao.MentorDAO;
import com.sist.vo.MentorReserveVO;
import com.sist.vo.MentorVO;

@Service
public class MentorServiceIml implements MentorService{
	private MentorDAO dao;

    @Autowired
    MentorServiceIml(MentorDAO dao){
        this.dao = dao;
    }

    @Override
	public void enrollMentor(MentorVO vo) {
    	dao.enrollMentor(vo);
    }

	@Override
	public List<MentorVO> getMentorListBymap(int page,String selectedVal,String searchWord,String job,String filter,String userId) {
		int rowSize=8;
        int start=(rowSize*page)-(rowSize-1);
        int end=rowSize*page;
        
        Map<String, Object> map=new HashMap<>();
        map.put("start", start);
        map.put("end", end);
        map.put("selectedVal", selectedVal);
        map.put("searchWord", searchWord);
        map.put("filter", filter);
        map.put("job", job);
        
		List<MentorVO> list = dao.getMentorListBymap(map);
		for(MentorVO vo : list) {
			String kwd = vo.getKeyword();
			if(kwd != null) {
				String[] kList = kwd.split("#");
				vo.setKeywords(kList);
			}
		}
		return list;
	}

	@Override
	public Map getTotalMentorPageBymap(int page,String selectedVal,String searchWord,String job) {
		Map<String, Object> map=new HashMap<>();
		map.put("selectedVal", selectedVal);
        map.put("searchWord", searchWord);
        map.put("job", job);
	
		int totalpage=dao.getTotalMentorPageBymap(map);

		final int BLOCK=5;
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage>totalpage) {
			endPage=totalpage;
		}
		
		map.clear();
		map.put("curpage", page);
		map.put("totalpage", totalpage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		
		return map;
	}

	@Override
	public MentorVO mentorDetailData(int mno) {
		MentorVO vo = dao.mentorDetailData(mno);
		String kwd = vo.getKeyword();
		if(kwd != null) {
			String[] kList = kwd.split("#");
			vo.setKeywords(kList);
		}
		return vo;
	}
	
	@Transactional
	@Override
	public void insertMentoring(int mno, String rDate, int totalAmount, String inquiry, String userId, int str_time,int end_time) {
		MentorReserveVO vo=new MentorReserveVO();
        vo.setMno(mno);
		vo.setRDate(rDate);
		vo.setTotalAmount(totalAmount);
		vo.setInquiry(inquiry);
		vo.setUserId(userId);
		vo.setStr_time(str_time);
		vo.setEnd_time(end_time);
        dao.insertMentoring(vo); 
        dao.increaseRevCnt(mno);
	}
}
