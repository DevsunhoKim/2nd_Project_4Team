package com.sist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.JjimDAO;
import com.sist.vo.JjimVO;

@Service
public class JjimServiceImpl implements JjimService{
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
	@Override
	public void MentorjjimInsert(JjimVO vo) {
		// TODO Auto-generated method stub
		dao.MentorjjimInsert(vo);
	}
	@Override
	public void MentorjjimDelete(JjimVO vo) {
		// TODO Auto-generated method stub
		dao.MentorjjimDelete(vo);
	}
	@Override
	public void companyjimInsert(JjimVO vo) {
		// TODO Auto-generated method stub
		dao.companyjimInsert(vo);
	}
	@Override
	public void companyjjimDelete(JjimVO vo) {
		// TODO Auto-generated method stub
		dao.companyjjimDelete(vo);
	}

}
