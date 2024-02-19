package com.sist.web;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.BooksServiceImpl;
import com.sist.vo.BooksVO;
import com.sist.vo.*;
@RestController
@RequestMapping("books/")
public class BooksRestController {
	@Autowired
	private BooksServiceImpl service;

	@GetMapping(value="list_vue.do", produces = "text/plain;charset=UTF-8")
	public String books_list_vue(@RequestParam("page") int page, 
	                             @RequestParam(value = "filter", required = false) String filter, 
	                             @RequestParam(value = "keyword", required = false) String keyword) throws Exception {
	    int rowSize = 12;
	    int start = (rowSize * page) - (rowSize - 1);
	    int end = rowSize * page;

	    // 필터와 키워드를 처리하는 서비스 메서드로 변경
	    List<BooksVO> list = service.booksListData(start, end, filter, keyword);

	    ObjectMapper mapper = new ObjectMapper();
	    String json = mapper.writeValueAsString(list);
	    return json;
	}

	@GetMapping(value="page_vue.do",produces = "text/plain;charset=UTF-8")
	public String books_page_vue(int page) throws Exception
	{
		final int BLOCK=10;
		   int startPage=((page-1)/BLOCK*BLOCK)+1;
		   int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		   Map map=new HashMap();
		   int totalpage=service.booksTotalPage();
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
	
	@GetMapping(value="detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String books_detail_vue(int no) throws Exception
	{
		BooksVO vo=service.booksDetailData(no);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}
	
	
	@GetMapping(value="search_vue.do", produces = "text/plain;charset=UTF-8")
	public String booksSearch_vue(String ss) throws Exception {
	    List<BooksVO> list = service.searchBooks(ss); // 검색어를 매개변수로 하는 서비스 계층의 검색 메소드 호출
	    ObjectMapper mapper = new ObjectMapper();
	    String json = mapper.writeValueAsString(list);
	    return json;
	}
	
	@GetMapping(value="search_page_vue.do",produces = "text/plain;charset=UTF-8")
	public String search_books_page_vue(int page) throws Exception
	{
		final int BLOCK=10;
		   int startPage=((page-1)/BLOCK*BLOCK)+1;
		   int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		   Map map=new HashMap();
		   int totalpage=service.booksTotalPage();
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
	
	
	// 리뷰 목록 조회
	@GetMapping("review_list.do")
	public String reviewList() throws Exception {
	    // 여기서 페이징 처리를 위한 로직 추가...
	    List<B_ReviewVO> reviews = service.reviewListData();
	    ObjectMapper mapper = new ObjectMapper();
	    return mapper.writeValueAsString(reviews);
	}

	// 리뷰 상세 조회
	@GetMapping("review_detail.do")
	public String reviewDetail(@RequestParam("rno") int rno) throws Exception {
	    B_ReviewVO review = service.reviewDetaildata(rno);
	    ObjectMapper mapper = new ObjectMapper();
	    return mapper.writeValueAsString(review);
	}

	// 리뷰 추가
	@PostMapping("review_insert.do")
	public String reviewInsert(@RequestBody B_ReviewVO vo) throws Exception {
	    service.insertReview(vo);
	    return "{\"result\":\"OK\"}";
	}

	// 리뷰 수정
	@PostMapping("review_update.do")
	public String reviewUpdate(@RequestBody B_ReviewVO vo) throws Exception {
	    service.reviewUpdate(vo);
	    return "{\"result\":\"OK\"}";
	}

	// 리뷰 삭제
	@GetMapping("review_delete.do")
	public String reviewDelete(@RequestParam("rno") int rno) throws Exception {
	    service.reviewDelete(rno);
	    return "{\"result\":\"OK\"}";
	}
	
	
	
}
