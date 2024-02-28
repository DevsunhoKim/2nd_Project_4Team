package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.vo.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.*;
@RestController
public class B_CartRestContller {

	@Autowired
	private B_CartServiceImpl bService;
	
	@GetMapping(value="mypage/books_cart_list.do", produces = "application/json;charset=UTF-8")
    public String cart_list_vue(HttpSession session) throws Exception {
        String userId = (String) session.getAttribute("userId");
        List<B_CartVO> list = bService.findCartItemsByUserId(userId);
        Map map = new HashMap();
        map.put("list", list);
        map.put("userId", userId);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(map);

        return json;
    }
	// 수정 
	@PostMapping(value="mypage/books_cart_update.do", produces = "application/json;charset=UTF-8")
    public String cart_update_vue(HttpSession session) throws Exception {
        

        return "";
    }
	
	// 삭제
	
	// 구매
	
	
}
