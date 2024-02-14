package com.sist.web;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.BooksServiceImpl;
import com.sist.vo.BooksVO;

@RestController
@RequestMapping("books/")
public class BooksRestController {
	@Autowired
	private BooksServiceImpl service;

	@GetMapping(value="list_vue.do",produces = "text/plain;charset=UTF-8")
	public String books_list_vue(int page) throws Exception
	{
		 int rowSize=12;
		 int start=(rowSize*page)-(rowSize-1);
		   int end=rowSize*page;
		   List<BooksVO> list=service.booksListData(start, end);
		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(list);
		   return json;

	}
	@GetMapping(value="page_vue.do",produces = "text/plain;charset=UTF-8")
	public String books_page_vue(int page) throws Exception
	{
		 int totalpage=service.booksTotalPage();
		   Map map=new HashMap();
		   map.put("curpage", page);
		   map.put("totalpage", totalpage);

		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(map);
		   return json;
	}
	
	@GetMapping(value="detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String books_detail_vue(int no) throws Exception
	{
		BooksVO vo=service.booksDetailData(no);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}
}
