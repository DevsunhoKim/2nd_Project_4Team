package com.sist.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

/*
 * 
 *  ano NUMBER,
    sno NUMBER,
    userId VARCHAR2(100),
    name VARCHAR2(51) CONSTRAINT sa_name_nn NOT NULL,
    content CLOB CONSTRAINT sta_name_nn NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    group_id NUMBER CONSTRAINT sa_gid_nn NOT NULL,
    group_step NUMBER DEFAULT 0,
    filename VARCHAR(1000),
    filesize NUMBER,
    filecount NUMBER DEFAULT 0,
    state NUMBER DEFAULT 0,
 */
@Data
public class StudyRoomAskVO {
	private int ano,sno,group_id,group_step,filecount,state;
	private String userId,name,content,dbday,filename,filesize,cate,email,subject;
	private Date regdate;
	private List<MultipartFile> files;
	
}
