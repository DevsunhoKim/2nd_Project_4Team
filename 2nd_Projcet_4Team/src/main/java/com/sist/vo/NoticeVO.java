package com.sist.vo;

import java.util.Date;

import lombok.Data;
@Data
public class NoticeVO {
	 private int no;
     private String title,cont,dbDay;
     private Date regDate;
}
