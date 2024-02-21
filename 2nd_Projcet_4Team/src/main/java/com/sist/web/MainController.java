package com.sist.web;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.service.BooksServiceImpl;
import com.sist.vo.BooksVO;
@Controller
public class MainController {

	@Autowired
	  private BooksServiceImpl bService;

	@GetMapping("main/main.do")
	public String main_main(Model model) {

		List<BooksVO> booksList=bService.mainBooks();
		model.addAttribute("booksList", booksList);
		return "main";
	}

}
