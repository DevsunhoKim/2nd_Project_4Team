package com.sist.web;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BooksController {
	@GetMapping("books/list.do")
	public String books_list()
	{
		return "books/list";
	}

	@GetMapping("books/detail.do")
	public String books_detail()
	{
		return "books/detail";
	}
}

