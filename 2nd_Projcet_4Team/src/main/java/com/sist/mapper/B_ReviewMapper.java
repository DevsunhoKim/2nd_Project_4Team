package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;
public interface B_ReviewMapper {
	
	// Create - 리뷰 추가
    @Insert("INSERT INTO b_review(rno, userid, no, score, cont, regdate) " +
            "VALUES (b_review_seq.NEXTVAL, #{userid}, #{no}, #{score}, #{cont}, SYSDATE)")
    public void insertReview(B_ReviewVO vo);
    
    // Read - 리뷰 하나 조회
    @Select("SELECT * FROM b_review WHERE rno = #{rno}")
    public B_ReviewVO reviewDetaildata(int rno);
    
    // Read - 모든 리뷰 조회
    @Select("SELECT * FROM b_review")
    public List<B_ReviewVO> reviewListData();
    
    // Update - 리뷰 수정
    @Update("UPDATE b_review SET userid=#{userid}, no=#{no}, score=#{score}, cont=#{cont} WHERE rno = #{rno}")
    public void reviewUpdate(B_ReviewVO vo);
    
    // Delete - 리뷰 삭제
    @Delete("DELETE FROM b_review WHERE rno = #{rno}")
    public void reviewDelete(int rno);
}
