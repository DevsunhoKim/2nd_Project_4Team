package com.sist.vo;

import lombok.Data;

@Data
public class BooksVO {
	private int no; // 梨� 踰덊샇, �뜲�씠�꽣踰좎씠�뒪�뿉�꽌 �옄�룞�쑝濡� 利앷��맆 寃껋엫
    private String title; // 梨� �젣紐�
    private String poster; // �룷�뒪�꽣 URL
    private String publ; // 異쒗뙋�궗
    private String auth; // ���옄
    private String content; // �궡�슜 �삉�뒗 �긽�꽭 �씠誘몄� URL
    private int price; // 媛�寃�
    private int score; // �룊�젏, 湲곕낯媛� 0
    private int buy_cnt; // 援щℓ �닔, 湲곕낯媛� 0
    private int heart; // 醫뗭븘�슂 �닔, 湲곕낯媛� 0
    private int jjim; // 李쒗븯湲� �닔, 湲곕낯媛� 0
    private String keyword; // �궎�썙�뱶
    private String genre; // �옣瑜�
    private String b_date; // 異쒓컙�씪
}
