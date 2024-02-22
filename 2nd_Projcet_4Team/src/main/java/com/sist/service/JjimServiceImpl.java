package com.sist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.JjimDAO;
import com.sist.vo.JjimVO;

@Service
public class JjimServiceImpl implements JjimSerive{
	@Autowired
	private JjimDAO dao;
	@Override
	public int jjimCount(JjimVO vo) {
		// TODO Auto-generated method stub
		return dao.jjimCount(vo);
	}
	@Override
	public void jjimInsert(JjimVO vo) {
		// TODO Auto-generated method stub
		dao.jjimInsert(vo);
	}
	@Override
	public void jjimDelete(JjimVO vo) {
		// TODO Auto-generated method stub
		dao.jjimDelete(vo);
	}
	
}
