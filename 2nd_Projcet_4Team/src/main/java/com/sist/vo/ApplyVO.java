package com.sist.vo;

import java.util.Date;

import lombok.Data;

/*
 * ANO       NOT NULL NUMBER         
CNO                NUMBER         
USERID             VARCHAR2(100)  
REGDATE            DATE           
FILENAME  NOT NULL VARCHAR2(2000) 
FILESIZE  NOT NULL VARCHAR2(2000) 
FILECOUNT          NUMBER  
 */
@Data
public class ApplyVO {
	private int ano, cno, filecount;
	private String userId, filename, filesize;
	private Date regdate;
}
