package com.sist.service;

import com.sist.vo.MentorVO;

public interface MentorService {
    public MentorVO getMentorByID(String userId);
    public void enrollMentor(MentorVO vo);
}
