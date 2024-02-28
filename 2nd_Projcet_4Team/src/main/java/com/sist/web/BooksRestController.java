package com.sist.web;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.B_CartServiceImpl;
import com.sist.service.BooksServiceImpl;
import com.sist.service.ReviewServiceImpl;
import com.sist.vo.B_CartVO;
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
   public String booksDetailVue(int no,int cateno, HttpSession session, Principal principal) throws Exception {
       BooksVO vo = service.booksDetailData(no); // 책의 상세 정보 가져오기
       List<ReviewVO> reviews = reviewMapper.reviewListData(no,cateno); // 해당 책에 대한 리뷰 목록 가져오기
       Double avgScore = reviewMapper.avgScore(no, cateno); // 해당 책의 리뷰 점수 평균 계산
       if (avgScore == null) {
           avgScore = 0.0; // 리뷰가 없을 경우 평균 점수를 0으로 설정
       }

       String userId = (String)session.getAttribute("userId");

       ObjectMapper mapper = new ObjectMapper();
       Map<String, Object> resultMap = new HashMap<>();
       resultMap.put("bookDetail", vo); // 책의 상세 정보를 Map에 추가
       resultMap.put("reviews", reviews); // 리뷰 목록을 Map에 추가
       resultMap.put("sessionId", userId); // 사용자 ID를 Map에 추가 (로그인하지 않은 경우 null일 수 있음)
       resultMap.put("avgScore", avgScore);
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

   // 리뷰 ================================================================================



      public String commonsreviewData(int no,int cateno) throws Exception
      {
         ObjectMapper mapper=new ObjectMapper();
         List<ReviewVO> list=reviewMapper.reviewListData(no,cateno);
         String json=mapper.writeValueAsString(list);
         return json;
      }

      @PostMapping(value="review_insert_vue.do", produces = "text/plain;charset=UTF-8")
      public String review_insert(ReviewVO vo, Principal p) throws Exception {
         String userId=p.getName(); // 세션에서 userId 가져오기
          System.out.println(userId); // 콘솔에 userId 출력하여 확인
          vo.setUserId(userId); // ReviewVO 객체에 userId 설정

          reviewMapper.reviewInsert(vo); // DB에 리뷰 삽입


          return commonsreviewData(vo.getNo(),vo.getCateno()); // 삽입된 리뷰의 데이터를 가져오는 메소드 호출
      }
      // 수정
      @PostMapping(value="review_update_vue.do", produces = "text/plain;charset=UTF-8")
      public String review_update(ReviewVO vo, Principal p) throws Exception {
          // 현재 로그인한 사용자의 ID를 가져옵니다.
          String userId = p.getName();
          // ReviewVO 객체에 userId를 설정합니다.
          vo.setUserId(userId);

          // 리뷰 업데이트 메서드를 호출합니다.
          reviewMapper.reviewUpdate(vo);
          // 업데이트된 리뷰 데이터를 반환합니다.
          return commonsreviewData(vo.getNo(),vo.getCateno());
      }

      // 삭제
      @GetMapping(value="review_delete_vue.do",produces = "text/plain;charset=UTF-8")
      public String reply_delete(int rno,int cateno,Principal p) throws Exception
      {

         String userId=p.getName(); // 세션에서 userId 가져오기
         reviewMapper.reviewDelete(rno,userId,cateno);
         return commonsreviewData(rno,cateno);
      }

     //구매  ==============================================================================
      @GetMapping(value="pay_info_vue.do", produces = "application/json;charset=UTF-8")
       public String payInfoVue(int no,Principal p) throws Exception {
           BooksVO vo = service.booksDetailData(no); // 책의 상세 정보 가져오기
           // 사용자 ID 등 필요한 추가 정보 처리
           String userId = p.getName();

           Map<String, Object> resultMap = new HashMap<>();
           resultMap.put("detail_data", vo);
           resultMap.put("sessionId", userId);
           // resultMap.put("sessionId", userId); // 필요한 경우 추가

           ObjectMapper mapper = new ObjectMapper();
           String json = mapper.writeValueAsString(resultMap); // Map을 JSON 문자열로 변환

           return json; // JSON 문자열 반환
       }

      @PostMapping(value="pay_ok.do", produces = "text/plain;charset=UTF-8")
      public String addToPurchase(@RequestBody B_CartVO vo, Principal p, BooksVO bvo) {
          try {
              String userId = p.getName(); // 현재 로그인한 사용자의 ID를 가져옴
              vo.setUserId(userId); // B_CartVO 객체에 사용자 ID 설정
              
              cService.updateBuyCnt(bvo.getNo(), bvo.getBuy_cnt());
              cService.payCartItem(vo); // 서비스를 통해 구매 정보 처리
              
              return "{\"status\":\"success\"}"; // 성공 응답
          } catch(Exception e) {
              e.printStackTrace();
              return "{\"status\":\"error\"}"; // 오류 응답
          }
      }
      
      @PostMapping(value="cart_ok.do", produces = "text/plain;charset=UTF-8")
      public String cart_ok(@RequestBody B_CartVO vo, Principal p, BooksVO bvo) {
         
              String userId = p.getName(); // 현재 로그인한 사용자의 ID를 가져옴
              vo.setUserId(userId); // B_CartVO 객체에 사용자 ID 설정
              
              cService.insertCartItem(vo);
              
              return ""; // 성공 응답
          
      }


      @GetMapping(value="pay_info_ok.do", produces = "text/plain;charset=UTF-8")
      public String pay_info_ok() throws Exception {
          // 최대 rno 값을 조회
          int maxRno = cService.findMaxRno();

          // 최대 rno 값에 해당하는 결제 정보 처리
          B_CartVO vo = cService.pay_ok(maxRno);

          // 처리된 결제 정보와 최대 rno 값을 응답 데이터에 포함
          Map<String, Object> map = new HashMap<>();
          map.put("vo", vo); // 처리된 결제 정보
          map.put("maxRno", maxRno); // 최대 rno 값

          ObjectMapper mapper = new ObjectMapper();
          String json = mapper.writeValueAsString(map); // 맵을 JSON 문자열로 변환

          return json; // JSON 문자열을 응답으로 반환
      }






}