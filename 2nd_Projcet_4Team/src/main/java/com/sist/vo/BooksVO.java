package com.sist.vo;

import lombok.Data;

@Data
public class BooksVO {
	private int no; // 책 번호, 데이터베이스에서 자동으로 증가될 것임
    private String title; // 책 제목
    private String poster; // 포스터 URL
    private String publ; // 출판사
    private String auth; // 저자
    private String content; // 내용 또는 상세 이미지 URL
    private int price; // 가격
    private int score; // 평점, 기본값 0
    private int buy_cnt; // 구매 수, 기본값 0
    private int heart; // 좋아요 수, 기본값 0
    private int jjim; // 찜하기 수, 기본값 0
    private String keyword; // 키워드
    private String genre; // 장르
    private String b_date; // 출간일
}
