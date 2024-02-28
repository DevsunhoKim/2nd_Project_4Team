package com.sist.vo;

import lombok.Data;

/*
 * NO         NOT NULL NUMBER
CNO                 NUMBER
TITLE      NOT NULL VARCHAR2(1000)
STACK_TXT           VARCHAR2(1000)
STACK_IMG           CLOB
CAREER     NOT NULL VARCHAR2(100)
EDUCATION  NOT NULL VARCHAR2(100)
CONTENT_J           CLOB
CONTENT_Q           CLOB
CONTENT_P           CLOB
CONTENT_B           CLOB
END_DATE   NOT NULL VARCHAR2(1000)
LIKE_COUNT          NUMBER
CNAME               VARCHAR2(500)
 */

@Data
public class RecruitVO {
	private CompanyVO cvo;
	private int rno, cno, like_count;
	private String title, stack_txt, stack_img, career, education, content_j, content_q, content_p, content_b, end_date, cname;
	private String[] stacks_txt;
	private Boolean likeState;
}
