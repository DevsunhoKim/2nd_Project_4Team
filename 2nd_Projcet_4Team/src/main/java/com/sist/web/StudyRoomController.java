package com.sist.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.security.Principal;
import java.util.Arrays;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	public String room_detail(int no,Boolean askShow,Boolean infoShow,Model model,Principal p)
	{
		String userId="";
		if(p!=null)
		{
			userId=p.getName();
		}
		if(infoShow==null && askShow==null)
		{
			infoShow=true;
			askShow=false;
		}
		else if(infoShow==null)
		{
			infoShow=false;
		}
		else if(askShow==null)
		{
			askShow=false;
		}
		model.addAttribute("askShow", askShow);
		model.addAttribute("infoShow", infoShow);
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
		   
		   return "redirect:../studyRoom/room_detail.do?askShow=true&no="+vo.getSno();
	   }
	   @GetMapping("ask_detail.do")
	   public String ask_detail(int ano,Model model)
	   {
		   model.addAttribute("ano", ano);
		   return "studyRoom/room_ask_detail";
	   }
	   @GetMapping("download.do")
	   public void file_download(String fn,HttpServletRequest request,HttpServletResponse response)
	   {
		  try {
			  String path=request.getSession().getServletContext().getRealPath("/")+"upload\\";
			   path=path.replace("\\", File.separator);
			   File file=new File(path+fn);
			   response.setHeader("Content-Disposition","attachment;filename="+URLEncoder.encode(fn,"UTF-8"));
			   response.setContentLength((int)file.length());
			   
			   // 데이터를 읽어서 버퍼에 저장
			   BufferedInputStream bis=new BufferedInputStream(new FileInputStream(file));
			   // 스트림 : 실제의 입력이나 출력이 표현된 데이터의 이상화된 흐름
			   // response.getOutputStream() => 출력 스트림 = 데이터를 목적지에 보내는 데 사용되는 스트림
			   // BufferedOutputStream: Java에서 출력 스트림에 대한 버퍼링을 제공하는 클래스
			   // 버퍼링(Buffering)은 데이터를 일시적으로 저장하는 메모리 영역
			   BufferedOutputStream bos=new BufferedOutputStream(response.getOutputStream());
			   int i=0;
			   byte[] buffer=new byte[1024];
			   //0: 데이터를 저장할 배열 buffer에 저장을 시작할 위치
			   while((i=bis.read(buffer,0,1024))!=-1)
			   {
				   bos.write(buffer,0,i);
			   }
			   // 메모리 누수 방지, 자원 해제, 데이터 안전성
			   bis.close();
			   bos.close();
		  }catch(Exception e) {}
		   
	   }
	   @GetMapping("ask_delete.do")
	   public String ask_delete(int ano,HttpServletRequest request,HttpServletResponse response)
	   {
		  
		   StudyRoomAskVO vo=service.StudyRoomAskDetail(ano);
		  try {
			 String path=request.getSession().getServletContext().getRealPath("/")+"upload\\";
			 path=path.replace("\\", File.separator);
			 service.StudyRoomAskDelete(ano);
			 if(vo.getFilecount()>0){
				 StringTokenizer st=new StringTokenizer(vo.getFilename(),",");
				 while(st.hasMoreTokens())
				 {
					 File file=new File(path+st.nextToken());
					 file.delete();
				 }
			 }
			 
		  }catch(Exception e) {}
		  return "redirect:../studyRoom/room_detail.do?askShow=true&no="+vo.getSno();
	   }
	   @GetMapping("ask_update.do")
	   public String ask_update(int ano,Model model)
	   {
		  
		   StudyRoomAskVO vo=service.StudyRoomAskDetail(ano);
		   model.addAttribute("vo", vo);
		  return "studyRoom/room_ask_update";
	   }
	   @PostMapping(value="ask_update_ok.do", produces = "text/plain;charset=UTF-8")
	   public String ask_update(String check,StudyRoomAskVO vo,HttpServletRequest request)
	   {
		   System.out.println(vo.getName());
		   System.out.println(vo.getCate());
		   System.out.println(vo.getEmail());
		   System.out.println(vo.getContent());
		   System.out.println(check);
		   
		   if(check==null) 
		   {
			   String path=request.getSession().getServletContext().getRealPath("/")+"upload\\";
			   path=path.replace("\\", File.separator);
			   StudyRoomAskVO dbvo=service.StudyRoomAskDetail(vo.getAno());
				  try {
					  if(dbvo.getFilecount()>0) {
						  StringTokenizer st=new StringTokenizer(vo.getFilename(),",");
						  while(st.hasMoreTokens())
						  {
							  File file=new File(path+st.nextToken());
							  file.delete();
						  }
					  }
				  }catch(Exception e) {}
				  List<MultipartFile> list=vo.getFiles();
				  if(list==null)
				  {
					  vo.setFilecount(0);
					  vo.setFilename("");
					  vo.setFilesize("");
				  }
				  else {
					  String filename="";
					  String filesize="";
					  for(MultipartFile mf:list)
					  {
						  String name=mf.getOriginalFilename();
						  File f=new File(path+name);
						  try {
							  mf.transferTo(f);
							  
						  }catch(Exception e) {}
						  filename+=name+",";
						  filesize+=f.length()+",";
					  }
					  filename=filename.substring(0,filename.lastIndexOf(","));
			    	  filesize=filesize.substring(0,filesize.lastIndexOf(","));
			    	  vo.setFilecount(list.size());
			          vo.setFilename(filename);
			    	  vo.setFilesize(filesize);
				  }
				  service.StudyRoomAskUpdate(vo);
		   }
		   else {
			   service.StudyRoomAskfileNoneUpdate(vo);
		   }
		  return "redirect:../studyRoom/ask_detail.do?ano="+vo.getAno();
	   }
	   
}
