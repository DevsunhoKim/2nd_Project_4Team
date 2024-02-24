package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.MentorVO;

public interface MentorService {
    public MentorVO getMentorByID(String userId);
    public void enrollMentor(MentorVO vo);
    public List<MentorVO> getMentorListBymap(int page,String selectedVal,String searchWord,String job,String userId);
    public Map getTotalMentorPageBymap(int page,String selectedVal,String searchWord,String job);
}
