package com.sist.service;

import com.sist.vo.JjimVO;

public interface JjimService {
	public int jjimCount(JjimVO vo);
    public void jjimInsert(JjimVO vo);
	public void jjimDelete(JjimVO vo);
	
	public void MentorjjimInsert(JjimVO vo);
	public void MentorjjimDelete(JjimVO vo);
	public void companyjimInsert(JjimVO vo);
	public void companyjjimDelete(JjimVO vo);
}
