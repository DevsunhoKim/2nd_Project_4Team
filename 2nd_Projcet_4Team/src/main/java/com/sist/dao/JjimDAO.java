package com.sist.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.JjimMapper;
import com.sist.vo.JjimVO;

@Repository 
public class JjimDAO {
	@Autowired
	private JjimMapper mapper;
	
	public int jjimCount(JjimVO vo) {
		return mapper.jjimCount(vo);
	}
    public void jjimInsert(JjimVO vo)
    {
    	mapper.jjimInsert(vo);
    }
	
	public void jjimDelete(JjimVO vo) {
		mapper.jjimDelete(vo);
	}
}
