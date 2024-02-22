package com.sist.service;

import com.sist.vo.JjimVO;

public interface JjimSerive {
	public int jjimCount(JjimVO vo);
    public void jjimInsert(JjimVO vo);
	public void jjimDelete(JjimVO vo);
}
