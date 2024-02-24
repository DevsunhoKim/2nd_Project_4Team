package com.sist.vo;
/*
 * 	mno NUMBER NOT NULL,
	userId VARCHAR2(100) NOT NULL,
	job VARCHAR2(500) NOT NULL,
	career VARCHAR2(1000) NOT NULL,
	department VARCHAR2(300) NULL,
	img VARCHAR2(1000) DEFAULT '../images/mentor1.png' NOT NULL,
	keyword VARCHAR2(1000) NULL,
	title VARCHAR2(2000) NOT NULL,
	intro CLOB NULL,
	pay NUMBER DEFAULT 0 NOT NULL,
	follower NUMBER DEFAULT 0 NOT NULL,
	score_avg NUMBER NULL,
	rev_cnt NUMBER NULL
 */

import lombok.Data;

@Data
public class MentorVO {
	private int mno,pay,follower,rev_cnt;
	private double score_avg;
	private String userId,job,career,department,img,title,intro,keyword;
	private String[] keywords;
	private MemberVO mvo = new MemberVO();
}
