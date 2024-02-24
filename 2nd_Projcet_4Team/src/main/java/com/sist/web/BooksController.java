package com.sist.web;
import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.service.BooksServiceImpl;
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
	public String books_detail(int no, Model model, Principal p) {
	    // Principal 객체가 null이 아닐 경우 userId를 가져오고, null일 경우 userId에 null을 할당합니다.
	    String userId = (p != null) ? p.getName() : null;
	 // userId가 null이 아닐 경우에만 콘솔에 출력합니다.
	    if (userId != null) {
	        System.out.println(userId);
	    }
	    model.addAttribute("no", no);


	    return "books/detail";
	}


	@GetMapping("books/payment.do")
	public String books_payment(int no,Model model)
	{
		model.addAttribute("no",no);
		return "books/payment";
	}

	@GetMapping("books/payment_ok.do")
	public String book_payment_ok()
	{
	   return "books/payment_ok";
	}



	// 메인화면에 출력할 데이터 public List<BooksVO> mainBooks() 구현 main-content.jsp 에 구현


}

