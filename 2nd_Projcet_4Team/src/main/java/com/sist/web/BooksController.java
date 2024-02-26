package com.sist.web;
import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.service.B_CartServiceImpl;
import com.sist.service.BooksServiceImpl;
import com.sist.vo.B_CartVO;
@Controller
public class BooksController {
	@Autowired
	private BooksServiceImpl service;

	@Autowired
	private B_CartServiceImpl cService;

	@GetMapping("books/list.do")
	public String books_list()
	{
		return "books/list";
	}

	@GetMapping("books/detail.do")
	public String books_detail(int no, Model model, Principal p) {
	    // Principal 객체가 null이 아닐 경우 userId를 가져오고, null일 경우 userId에 null을 할당합니다.
	    String userId = (p != null) ? p.getName() : null;
	 // userId가 null이 아닐 경우에만 콘솔에 출력합니다.
	    if (userId != null) {
	        System.out.println(userId);
	    }
	    model.addAttribute("no", no);


	    return "books/detail";
	}

    // 결제창
	@GetMapping("books/payment.do")
	public String books_payment(int no,Model model)
	{
		model.addAttribute("no",no);
		return "books/payment";
	}
	@GetMapping("books/payment_ok.do")
	public String book_payment_ok(Model model) {
	    // 최대 rno 값을 조회합니다.
	    int maxRno = cService.findMaxRno();

	    // 최대 rno에 해당하는 결제 정보를 조회합니다.
	    B_CartVO paymentInfo = cService.pay_ok(maxRno);

	    // 모델에 결제 정보와 rno를 추가합니다.
	    model.addAttribute("paymentInfo", paymentInfo);
	    model.addAttribute("rno", maxRno);

	    return "books/payment_ok";
	}





	// 메인화면에 출력할 데이터 public List<BooksVO> mainBooks() 구현 main-content.jsp 에 구현


}

