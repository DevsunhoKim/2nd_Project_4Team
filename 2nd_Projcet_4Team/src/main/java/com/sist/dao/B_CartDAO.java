package com.sist.dao;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.B_CartMapper;
import com.sist.vo.B_CartVO;
@Repository
public class B_CartDAO {

	@Autowired
	private B_CartMapper mapper;

	public List<B_CartVO> findCartItemsByUserId(String userId)
	{
		return mapper.findCartItemsByUserId(userId);
	}

	public void updateCartItem(B_CartVO vo)
	{
		mapper.updateCartItem(vo);
	}

	public void insertCartItem(B_CartVO vo)
	{
	    mapper.insertCartItem(vo);
	}

	public void deleteCartItem(int rno)
	{
		mapper.deleteCartItem(rno);
	}
	
	public void payCartItem(B_CartVO vo)
	{
	    mapper.insertCartItem(vo);
	}
	
	public B_CartVO pay_ok(int rno)
	{
		return mapper.pay_ok(rno);
	}


}
