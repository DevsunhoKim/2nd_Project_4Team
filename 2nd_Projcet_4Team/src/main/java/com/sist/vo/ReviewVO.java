package com.sist.vo;
import java.util.Date;

import lombok.Data;
@Data
public class ReviewVO {

	private int rno, score, cateno,no;
	private String userId, cont, dbday ;
	private Date regdate;


}
