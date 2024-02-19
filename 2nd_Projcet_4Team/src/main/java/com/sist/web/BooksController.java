package com.sist.web;
import java.util.List;


import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.service.BooksServiceImpl;
import com.sist.vo.*;

@Controller
public class BooksController {
	@Autowired
	private BooksServiceImpl service;
	@GetMapping("books/list.do")
	public String books_list()
	{
		return "books/list";
	}

	@GetMapping("books/detail.do")
	public String books_detail(int no,Model model)
	{
		model.addAttribute("no",no);  
		return "books/detail";
	}
	
	@GetMapping("books/payment.do")
	public String books_payment(int no,Model model)
	{
		model.addAttribute("no",no);
		return "books/payment";
	}

	// 메인화면에 출력할 데이터 public List<BooksVO> mainBooks() 구현 main-content.jsp 에 구현


}

