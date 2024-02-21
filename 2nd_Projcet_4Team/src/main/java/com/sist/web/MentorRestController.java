package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.MentorService;
import com.sist.vo.MentorVO;

@RestController
public class MentorRestController {
	private MentorService mService;

    @Autowired
    public MentorRestController(MentorService mService) {
    	this.mService = mService;
    }

/*	@GetMapping(value="find_vue.do",produces = "text/plain;charset=UTF-8")
	   public String food_find(int page,String fd) throws Exception
	   {
		   int rowSize=20;
		   int start=(rowSize*page)-(rowSize-1);
		   int end=(rowSize*page);
		   Map map=new HashMap();
		   map.put("start",start);
		   map.put("end", end);
		   map.put("address", fd);
		   List<MentorVO> list=mService.foodFindData(map);
		   //JSON변경
		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(list);
		   return json;
	   }

	   @GetMapping(value="page_vue.do",produces = "text/plain;charset=UTF-8")
	   public String food_page(int page,String fd) throws Exception
	   {
		   final int BLOCK=10;
		   int startPage=((page-1)/BLOCK*BLOCK)+1;
		   int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		   Map map=new HashMap();
		   map.put("address", fd);
		   int totalpage=mService.foodFindCount(map);
		   if(endPage>totalpage)
			   endPage=totalpage;

		   map=new HashMap();
		   map.put("curpage",page);
		   map.put("totalpage", totalpage);
		   map.put("startPage", startPage);
		   map.put("endPage", endPage);

		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(map);
		   return json;
	   }
*/
}
