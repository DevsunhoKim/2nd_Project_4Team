package com.sist.web;

import java.io.File;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.sist.dao.StudyRoomDAO;
import com.sist.service.StudyRoomService;
import com.sist.service.StudyRoomServiceImpl;
import com.sist.vo.StudyRoomAskVO;
import com.sist.vo.StudyRoomVO;

@Controller
@RequestMapping("studyRoom/")
public class StudyRoomController {
	@Autowired
	private StudyRoomServiceImpl service;
	
	@GetMapping("room_main.do")
	public String room_main()
	{
		return "studyRoom/room_main";
	}
	@GetMapping("room_detail.do")
	public String room_detail(int no,Model model,Principal p)
	{
		String userId="";
		if(p!=null)
		{
			userId=(String)p.getName();
		}
		model.addAttribute("no", no);
		model.addAttribute("userId", userId);
		return "studyRoom/room_detail";
	}
	@GetMapping("ask.do")
	public String room_ask(int no,Model model)
	{
		//StudyRoomVO vo=service.studyRoomDetailData(no);
		model.addAttribute("no", no);
		return "studyRoom/room_ask";
	}
	@GetMapping("reserve.do")
	public String room_reserve(int no,Model model)
	{
		model.addAttribute("no", no);
		return "studyRoom/room_reserve";
	}
	   @PostMapping(value="ask_insert_ok.do", produces = "text/plain;charset=UTF-8")
	   public String ask_insert(StudyRoomAskVO vo,HttpServletRequest request,HttpSession session) {
		  String result="yes";
		  //System.out.println(vo.getName());
		  //System.out.println(vo.getCate());
		  //System.out.println(vo.getEmail());
		  //System.out.println(vo.getContent());
		  //System.out.println(session.getAttribute("userId"));
		   try {
			   String path=request.getSession().getServletContext().getRealPath("/")+"upload\\";
			   path=path.replace("\\", File.separator);
			   File dir=new File(path);
			   if(!dir.exists())
			   {
				   dir.mkdir();
			   }
			   List<MultipartFile> list=vo.getFiles();
//			   Boolean check=list.isEmpty();
//			   System.out.println(check);
			   if(list==null)
			   {
				   vo.setFilename("");
		   		   vo.setFilesize("");
		   		   vo.setFilecount(0);
			   }
			   else {
				   String filename="";
				   String filesize="";
				   for(MultipartFile mf:list)
				   {
					   String fname=mf.getOriginalFilename();
					   File file=new File(path+fname);
					   try {
						   mf.transferTo(file);
					   }catch(Exception e)
					   {
						   e.printStackTrace();
					   }
					   filename+=fname+",";
					   filesize+=file.length()+",";
				   }
				   filename=filename.substring(0,filename.lastIndexOf(","));
				   filesize=filesize.substring(0,filesize.lastIndexOf(","));
				   vo.setFilename(filename);
				   //System.out.println(filename);
				   vo.setFilesize(filesize);
				   //System.out.println(filesize);
				   vo.setFilecount(list.size());
			   }
			   String userId=(String)session.getAttribute("userId");
			   vo.setUserId(userId);
			   service.StudyRoomAskInsert(vo);
		   }catch(Exception ex) {
			   ex.printStackTrace();
			   result="no";
		    }
		   
		   return "redirect:../main/main.do";
	   }
}
