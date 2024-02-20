package com.sist.vo;

import lombok.Data;
/*
 * 
 *  no NUMBER,
    rno NUMBER,
    time VARCHAR2(50)
    CONSTRAINT srt_no_pk PRIMARY KEY(no),
    CONSTRAINT srt_rno_fk FOREIGN KEY(rno)
    REFERENCES studyRoom_reserve(no)
 */
@Data
public class StudyRoomRtimeVO {
	private int no,rno;
	private String time;
}
