package com.sist.web;
import java.net.http.HttpRequest;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.service.BooksServiceImpl;
import com.sist.service.MemberService;
import com.sist.vo.BooksVO;
import com.sist.vo.MemberVO;
@Controller
public class MainController {
	private MemberService mService;
	private BooksServiceImpl bService;
	
	@Autowired
	public MainController(MemberService mService, BooksServiceImpl bService) {
		this.mService = mService;
		this.bService = bService;
	}

	@GetMapping("main/main.do")
	public String main_main(Model model, Principal p, HttpSession session) {
		if(p!=null) {
			MemberVO vo = mService.getMemberByID(p.getName());
			session.setAttribute("userId", vo.getUserId());
			session.setAttribute("userPwd", vo.getUserPwd());
			session.setAttribute("userName", vo.getUserName());
			session.setAttribute("nickname", vo.getNickname());
			session.setAttribute("birthday", vo.getBirthday());
			session.setAttribute("gender", vo.getGender());
			session.setAttribute("email", vo.getEmail());
			session.setAttribute("phone", vo.getPhone());
			session.setAttribute("post", vo.getPost());
			session.setAttribute("addr", vo.getAddr());
			session.setAttribute("detail_addr", vo.getDetail_addr());
			session.setAttribute("hope_job", vo.getHope_job());
			session.setAttribute("regdate", vo.getRegdate());
			session.setAttribute("mentor", vo.getMentor());
			session.setAttribute("authority", vo.getAuthority());
		}
		
		List<BooksVO> booksList=bService.mainBooks();
		model.addAttribute("booksList", booksList);
		return "main";
	}

}
