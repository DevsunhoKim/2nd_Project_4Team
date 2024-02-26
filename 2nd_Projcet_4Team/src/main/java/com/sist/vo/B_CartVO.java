package com.sist.vo;
import java.util.*;

import lombok.Data;

@Data
public class B_CartVO {
	private int rno,quantity,totalPrice,isSale,no;
	private Date regdate;
	private String dbday,userId,status,poster,title;
}
