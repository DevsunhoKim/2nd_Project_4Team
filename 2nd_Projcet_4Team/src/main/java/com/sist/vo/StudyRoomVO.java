package com.sist.vo;

import lombok.Data;

/*
 * 
 * 
 * no NUMBER,
    name VARCHAR2(50)  CONSTRAINT sr_name_nn NOT NULL,
    poster VARCHAR2(1000) CONSTRAINT sr_poster_nn NOT NULL,
    price NUMBER CONSTRAINT sr_price_nn NOT NULL,
    inwon NUMBER CONSTRAINT sr_inwon_nn NOT NULL,
    area VARCHAR2(100) CONSTRAINT sr_area_nn NOT NULL,
    lobby VARCHAR2(100) CONSTRAINT sr_roby_nn NOT NULL,
    conve VARCHAR2(300) CONSTRAINT sr_conve_nn NOT NULL,
    deimage VARCHAR2(3000)  CONSTRAINT sr_deimage_nn NOT NULL,
    jjim NUMBER DEFAULT 0,
 */
@Data
public class StudyRoomVO {
	private int no,jjim,price,inwon;
	private String name,poster,area,lobby,conve,deimage;
	private String[] dimage;
	
}
