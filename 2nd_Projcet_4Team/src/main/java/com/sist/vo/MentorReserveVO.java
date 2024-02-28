package com.sist.vo;

import lombok.Data;

@Data
public class MentorReserveVO {
	private int no,mno,ok,totalAmount,str_time,end_time;
	private String userId,rDate,regDate,inquiry;
	private MemberVO mvo;
	private MentorVO mtvo;
}
