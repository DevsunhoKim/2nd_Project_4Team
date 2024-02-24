package com.sist.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.MentorDAO;
import com.sist.vo.MentorVO;

@Service
public class MentorServiceIml implements MentorService{
	private MentorDAO dao;

    @Autowired
    MentorServiceIml(MentorDAO dao){
        this.dao = dao;
    }

    @Override
	public MentorVO getMentorByID(String userId) {
    	return dao.getMentorByID(userId);
    }

    @Override
	public void enrollMentor(MentorVO vo) {
    	dao.enrollMentor(vo);
    }

	@Override
	public List<MentorVO> getMentorListBymap(int page,String selectedVal,String searchWord,String job,String userId) {
		int rowSize=8;
        int start=(rowSize*page)-(rowSize-1);
        int end=rowSize*page;

        Map<String, Object> map=new HashMap<>();
        map.put("start", start);
        map.put("end", end);
        map.put("selectedVal", selectedVal);
        map.put("searchWord", searchWord);
        map.put("job", job);
        
		List<MentorVO> list = dao.getMentorListBymap(map);
		
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
}
