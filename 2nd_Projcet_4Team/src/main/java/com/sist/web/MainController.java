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
import com.sist.service.StudyRoomService;
import com.sist.vo.BooksVO;
import com.sist.vo.MemberVO;
import com.sist.vo.StudyRoomVO;
@Controller
public class MainController {
	private MemberService mService;
	private BooksServiceImpl bService;
	private StudyRoomService sService;
	
	@Autowired
	public MainController(MemberService mService, BooksServiceImpl bService,StudyRoomService sService) {
		this.mService = mService;
		this.bService = bService;
		this.sService = sService;
	}

	@GetMapping("main/main.do")
	public String main_main(Model model, Principal p, HttpSession session) {
		if(p!=null) {
			MemberVO vo = mService.getMemberByID(p.getName());
			session.setAttribute("userId", vo.getUserId());
			session.setAttribute("userPwd", vo.getUserPwd());
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
		List<StudyRoomVO> roomList=sService.studyRoomListData();
		model.addAttribute("booksList", booksList);
		model.addAttribute("roomList", roomList);
		return "main";
	}

}
