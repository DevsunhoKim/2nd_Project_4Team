package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.B_CartVO;

public interface B_CartMapper {

    // 사용자별 장바구니 항목 조회
    @Select("SELECT * FROM b_cart WHERE userId = #{userId}")
    public List<B_CartVO> findCartItemsByuserId(String userId);

    // 장바구니 항목 업데이트 (예: 수량 변경)
    @Update("UPDATE b_cart SET quantity = #{quantity}, totalprice = #{totalPrice} WHERE rno = #{rno}")
    public void updateCartItem(B_CartVO vo);

    // 장바구니 추가 (상태 기본값 'N')
    @Insert("INSERT INTO b_cart(rno, userId, no, quantity, totalPrice, isSale, regdate, status,addr,title,poster) " +
            "VALUES(b_cart_rno_seq.NEXTVAL, #{userId}, #{no}, #{quantity}, #{totalPrice}, 0 , SYSDATE, 'N',#{addr},#{title},#{poster})")
    public void insertCartItem(B_CartVO vo);

    // 장바구니 항목 삭제
    @Delete("DELETE FROM b_cart WHERE rno = #{rno}")
    public void deleteCartItem(int rno);

 // 구매완료 detail 페이지에서 바로 구매  (상태 기본값 'Y' 로변경)
    @Insert("INSERT INTO b_cart(rno, userId, no, quantity, totalPrice, isSale, regdate, status, addr ,title ,poster) " +
            "VALUES(b_cart_rno_seq.NEXTVAL, #{userId}, #{no}, #{quantity}, #{totalPrice}, 0 , SYSDATE, 'Y', #{addr}, #{title}, #{poster})")
    public void payCartItem(B_CartVO vo);

   // 최대값 조회
    @Select("SELECT MAX(rno) FROM b_cart")
    public int findMaxRno();

    // 결제 완료 내역 출력
    @Select("SELECT rno, userId, no, quantity, totalPrice, status, addr, title, poster, TO_CHAR(regdate, 'YYYY-MM-DD HH24:MI') AS dbday FROM b_cart WHERE rno=#{rno}")
    public B_CartVO pay_ok(int rno);

    // 구매 수량에 따라 books 테이블의 buy_cnt를 업데이트하는 메서드
    @Update("UPDATE books SET buy_cnt = buy_cnt + #{quantity} WHERE no = #{no}")
    public void updateBuyCnt(@Param("no") int no, @Param("quantity") int quantity);

}
