package com.sist.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.StudyRoomServiceImpl;
import com.sist.vo.StudyRoomVO;

@RestController
@RequestMapping("studyRoom/")
public class StudyRoomRestController {
	@Autowired
	private StudyRoomServiceImpl service;

//	@GetMapping(value="list_vue.do",produces="text/plain;charset=UTF-8")
//	public String room_list() throws Exception
//	{
//		List<StudyRoomVO> list=service.studyRoomListData();
//		ObjectMapper mapper=new ObjectMapper();
//		String json=mapper.writeValueAsString(list);
//		return json;
//	}
	@GetMapping(value="list_vue.do",produces = "text/plain;charset=UTF-8")
	   public String room_list() throws Exception
	   {
		   List<StudyRoomVO> list=service.studyRoomListData();
		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(list);
		   return json;
	   }
	@GetMapping(value="detail_vue.do",produces = "text/plain;charset=UTF-8")
	   public String room_detail(int no) throws Exception
	   {
		   StudyRoomVO vo=service.studyRoomDetailData(no);
		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(vo);
		   return json;
	   }
}
