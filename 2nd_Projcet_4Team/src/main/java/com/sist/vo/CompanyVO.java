package com.sist.vo;

import lombok.Data;

/*
 * NO         NOT NULL NUMBER         
LOGO                VARCHAR2(1000) 
NAME       NOT NULL VARCHAR2(100)  
YEAR                VARCHAR2(100)  
SCALE               VARCHAR2(100)  
SALES               VARCHAR2(100)  
WORKER              NUMBER         
TYPE                VARCHAR2(100)  
CONTENT             CLOB           
IMG                 VARCHAR2(1000) 
ADDRESS             VARCHAR2(1000) 
HOMEPAGE            VARCHAR2(1000) 
PHONE               VARCHAR2(100)  
EMAIL               VARCHAR2(1000) 
LIKE_COUNT          NUMBER
 */
@Data
public class CompanyVO {
	private int no, worker, like_count;
	private String logo, name, year, scale, sales, type, content, img, address, hompage, phone, email;
}
