package com.sist.service;

import java.util.List;
import java.util.Map;
import com.sist.vo.MentorVO;

public interface MentorService {
    public void enrollMentor(MentorVO vo);
    public List<MentorVO> getMentorListBymap(int page,String selectedVal,String searchWord,String job,String filter,String userId);
    public Map getTotalMentorPageBymap(int page,String selectedVal,String searchWord,String job);
    public MentorVO mentorDetailData(int mno);
	public void insertMentoring(int mno, String rDate, int totalAmount, String inquiry, String userId);
}
