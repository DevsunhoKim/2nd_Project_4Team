package com.sist.web;
import com.sist.vo.*;
import java.util.*;
import com.sist.mapper.*;
import com.sist.dao.*;

import org.springframework.beans.factory.annotation.Autowired;
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

