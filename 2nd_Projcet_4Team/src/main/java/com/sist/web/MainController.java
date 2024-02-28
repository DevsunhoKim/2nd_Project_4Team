package com.sist.web;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.service.BooksServiceImpl;
import com.sist.service.MainService;
import com.sist.service.MemberService;
import com.sist.service.StudyRoomService;
import com.sist.service.RecruitmentService;
import com.sist.vo.*;
@Controller
public class MainController {
	private MemberService mService;
	private BooksServiceImpl bService;
	private StudyRoomService sService;
	private MainService service;
	private RecruitmentService rService;

	@Autowired
	public MainController(MemberService mService, BooksServiceImpl bService, StudyRoomService sService, RecruitmentService rService, 
							MainService service) {
		this.mService = mService;
		this.bService = bService;
		this.sService = sService;
		this.rService = rService;
		this.service = service;

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
		List<StudyRoomVO> roomList=sService.studyRoomListData();
		List<RecruitVO> recruitList=rService.recruitMainData();
		model.addAttribute("booksList", booksList);
		model.addAttribute("roomList", roomList);
		model.addAttribute("recruitList", recruitList);
		return "main";
	}
	
	@GetMapping("main/searchTech.do")
	public String main_searchTech(String engTech, Model model) {
		List<MentorVO> mList = service.getMentorBytech(engTech);
		List<BooksVO> bList = service.getBookstBytech(engTech);
		List<RecruitVO> rList = service.getRecruitBytech(engTech);
		model.addAttribute("mList",mList);
		model.addAttribute("bList",bList);
		model.addAttribute("rList",rList);
		if(mList != null) {
			String job = mList.get(0).getJob();
			model.addAttribute("job", job);
		}
		return "main/searchTech";
	}
}
