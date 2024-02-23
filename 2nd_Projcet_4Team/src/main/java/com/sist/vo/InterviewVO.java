package com.sist.vo;

import java.util.Date;

import lombok.Data;

/*
 * INO     NOT NULL NUMBER         
CNO              NUMBER         
USERID           VARCHAR2(100)  
TITLE   NOT NULL VARCHAR2(1000) 
CAREER  NOT NULL VARCHAR2(100)  
SCORE   NOT NULL VARCHAR2(100)  
ILEVEL  NOT NULL VARCHAR2(100)  
RESULT  NOT NULL VARCHAR2(100)  
CONTENT NOT NULL CLOB           
REGDATE          DATE 
 */

@Data
public class InterviewVO {
	private int ino, cno;
	private String userId, title, career, score, ilevel, result, content;
	private Date regdate;
}
