package com.sist.web;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.B_CartServiceImpl;
import com.sist.service.BooksServiceImpl;
import com.sist.service.ReviewServiceImpl;
import com.sist.vo.BooksVO;
import com.sist.vo.ReviewVO;
@RestController
@RequestMapping("books/")
public class BooksRestController {
	@Autowired
	private BooksServiceImpl service;

	@Autowired
	private B_CartServiceImpl cService;

	@Autowired
	private ReviewServiceImpl reviewMapper;

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

	@GetMapping(value="detail_vue.do", produces = "text/plain;charset=UTF-8")
	public String booksDetailVue(@RequestParam("no") int no) throws Exception {
	    BooksVO vo = service.booksDetailData(no); // 책의 상세 정보 가져오기
	    List<ReviewVO> reviews = reviewMapper.reviewListData(no); // 해당 책에 대한 리뷰 목록 가져오기

	    ObjectMapper mapper = new ObjectMapper();
	    Map<String, Object> resultMap = new HashMap<>();
	    resultMap.put("bookDetail", vo); // 책의 상세 정보를 Map에 추가
	    resultMap.put("reviews", reviews); // 리뷰 목록을 Map에 추가

	    String json = mapper.writeValueAsString(resultMap); // Map을 JSON 문자열로 변환
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

	   public String commonsreviewData(int rno) throws Exception
	   {
		   ObjectMapper mapper=new ObjectMapper();
		   List<ReviewVO> list=reviewMapper.reviewListData(rno);
		   String json=mapper.writeValueAsString(list);
		   return json;
	   }

	   @PostMapping(value="books/review_insert_vue.do",produces = "text/plain;charset=UTF-8")
	   public String reply_insert(ReviewVO vo,HttpSession session) throws Exception
	   {
		   String userId=(String)session.getAttribute("userId");
		   vo.setUserId(userId);
		   
		   // rno,msg
		   reviewMapper.reviewInsert(vo);
		   
		   return commonsreviewData(vo.getRno());
	   }
	   // 수정
	   @PostMapping(value="books/review_update_vue.do",produces = "text/plain;charset=UTF-8")
	   public String review_update(ReviewVO vo) throws Exception
	   {
		   reviewMapper.reviewUpdate(vo);
		   return commonsreviewData(vo.getRno());
	   }
	   // 삭제
	   @GetMapping(value="books/review_delete_vue.do",produces = "text/plain;charset=UTF-8")
	   public String review_delete(int no,int rno) throws Exception
	   {
		   reviewMapper.reviewDelete(no);
		   return commonsreviewData(rno);
	   }


}
