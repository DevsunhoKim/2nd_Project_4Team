package com.sist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.B_CartDAO;
import com.sist.vo.B_CartVO;

@Service
public class B_CartServiceImpl implements B_CartService{

	@Autowired
	private B_CartDAO dao;

	@Override
	public List<B_CartVO> findCartItemsByUserId(String userId) {
		// TODO Auto-generated method stub 
		return dao.findCartItemsByUserId(userId);
	}

	@Override
	public void updateCartItem(B_CartVO vo) {
		// TODO Auto-generated method stub
		dao.updateCartItem(vo);
	}

	@Override
	public void insertCartItem(B_CartVO vo) {
		// TODO Auto-generated method stub
		dao.insertCartItem(vo);
	}

	@Override
	public void deleteCartItem(int rno) {
		// TODO Auto-generated method stub
		dao.deleteCartItem(rno);
	}

	@Override
	public void payCartItem(B_CartVO vo) {
		// TODO Auto-generated method stub
		dao.payCartItem(vo);
	}

	@Override
	public B_CartVO pay_ok(int rno) {
		// TODO Auto-generated method stub
		return dao.pay_ok(rno);
	}

	@Override
	public int findMaxRno() {
		// TODO Auto-generated method stub
		return dao.findMaxRno();
	}

}
