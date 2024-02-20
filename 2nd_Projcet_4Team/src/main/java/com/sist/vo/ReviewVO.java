package com.sist.vo;
import java.util.Date;

import lombok.Data;
@Data
public class ReviewVO {

	private int rno, score, cateno,no;
	private String userid, cont, dbday ;
	private Date regdate;

	private MemberVO mvo=new MemberVO();
}
