package com.sist.web;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.StudyRoomServiceImpl;
import com.sist.vo.StudyRoomReserveVO;
import com.sist.vo.StudyRoomTimeVO;
import com.sist.vo.StudyRoomVO;

@RestController
@RequestMapping("studyRoom/")
public class StudyRoomRestController {
   @Autowired
   private StudyRoomServiceImpl service;

//   @GetMapping(value="list_vue.do",produces="text/plain;charset=UTF-8")
//   public String room_list() throws Exception
//   {
//      List<StudyRoomVO> list=service.studyRoomListData();
//      ObjectMapper mapper=new ObjectMapper();
//      String json=mapper.writeValueAsString(list);
//      return json;
//   }
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
   @GetMapping(value="room_reserve_vue.do",produces = "text/plain;charset=UTF-8")
      public String room_reserve_vue(int no) throws Exception
      {
         StudyRoomVO vo=service.studyRoomDetailData(no);
         List<StudyRoomTimeVO> list=service.studyRoomTimeData(no);
//         Map map=new HashMap();
//         map.put("reserve_data", vo);
//         map.put("list", list);
         ObjectMapper mapper=new ObjectMapper();
         String json=mapper.writeValueAsString(vo);
         return json;
      }

   @GetMapping(value="date_vue.do", produces = "text/plain;charset=UTF-8")
   public String room_reserve_vue(String month,String day,int sno) throws Exception {

//       System.out.println("달="+month);
//       System.out.println("일="+day);
//       System.out.println("sno="+sno);
       StudyRoomTimeVO vo=new StudyRoomTimeVO();
       vo.setSno(sno);
       vo.setMonth(Integer.parseInt(month));
       if (day.charAt(0) == '0') {
           vo.setDay(Integer.parseInt(day.substring(1, 2))); // 첫 번째 문자(0)를 제외하고 두 번째 문자(실제 일)를 가져옵니다.
       }
       if (day.length() == 4) {
           vo.setDay(Integer.parseInt(day.substring(0, 2)));
       }
       else {
          vo.setDay(Integer.parseInt(day));
       }

//       // vo의 day를 조작하여 원하는 형태로 변환
//       String dayString = String.valueOf(vo.getDay());
//       if (dayString.length() == 2) {
//           vo.setDay(Integer.parseInt(dayString.substring(0, 1)));
//       } else if (dayString.length() == 4) {
//           vo.setDay(Integer.parseInt(dayString.substring(0, 2)));
//       }
       System.out.println("달="+vo.getMonth());
       System.out.println("일="+vo.getDay());
       System.out.println("sno="+vo.getSno());
       List<String> list = service.studyRoomTimeList(vo);
       System.out.println(list.isEmpty());
       ObjectMapper mapper = new ObjectMapper();
       String json = mapper.writeValueAsString(list);
       return json;
   }
   @PostMapping(value="reserve_ok_vue.do", produces = "text/plain;charset=UTF-8")
   public String room_reserve_ok(int sno,int price,int month,int day, String[] times,HttpSession session,Principal p)
   {
	  
	   String userId=(String) p.getName();
	   for(String t:times)
	   {
		   System.out.println(t);
	   }
	   System.out.println("ok");
	   System.out.println(userId);
	   System.out.println(sno);
	   System.out.println(price);
	   System.out.println(month);
	   System.out.println(day);
	   int amount=times.length;
	   StudyRoomReserveVO srrvo=new StudyRoomReserveVO();
	   srrvo.setSno(sno);
	   srrvo.setAmount(amount);
	   srrvo.setPrice(price);
	   srrvo.setUserId(userId);
	   service.studyRoomReserveInsert(srrvo);
	   
	   StudyRoomTimeVO srtvo=new StudyRoomTimeVO();
	   srtvo.setMonth(month);
	   srtvo.setDay(day);
	   for(String t:times)
	   {
		   service.StudyRoomReserveTimeInsert(t);
		   srtvo.setTime(t);
		   service.StudyRoomTimeUpdate(srtvo);
	   }
	   return "OK";
   }

}