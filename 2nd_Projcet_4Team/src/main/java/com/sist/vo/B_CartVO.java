package com.sist.vo;
import java.util.Date;

import lombok.Data;

@Data
public class B_CartVO {
	private int rno,quantity,totalPrice,isSale,no,price;
	private Date regdate;
	private String dbday,userId,status,poster,title,addr;
}
