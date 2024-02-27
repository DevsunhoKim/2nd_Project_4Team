package com.sist.vo;

import java.util.Date;

import lombok.Data;

/*
 *
 *  no NUMBER,
    userId VARCHAR2(100),
    sno NUMBER,
    amount NUMBER CONSTRAINT srr_amount_nn NOT NULL,
    price NUMBER CONSTRAINT srr_price_nn NOT NULL,
    regdate
 */
@Data
public class StudyRoomReserveVO {
	private int no,sno,amount,price;
	private String userId,dbday,time,rdate;
	private Date regdate;
}
