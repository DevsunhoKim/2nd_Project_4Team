package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.B_CartVO;
public interface B_CartMapper {

	 // 사용자별 장바구니 항목 조회
    @Select("SELECT * FROM b_cart WHERE userid = #{userId}")
    public List<B_CartVO> findCartItemsByUserId(String userId);

    // 장바구니 항목 업데이트 (예: 수량 변경)
    @Update("UPDATE b_cart SET quantity = #{quantity}, total_price = #{totalPrice} WHERE rno = #{rno}")
    public void updateCartItem(B_CartVO vo);

    // 장바구니 추가
    @Insert("INSERT INTO b_cart (rno, userid, no, quantity, total_price, isSale, regdate, status) " +
            "VALUES (b_cart_seq.NEXTVAL, #{userid}, #{no}, #{quantity}, #{totalPrice}, #{isSale}, SYSDATE, #{status})")
    public void insertCartItem(B_CartVO vo);

 // 장바구니 항목 삭제
    @Delete("DELETE FROM b_cart WHERE rno = #{rno}")
    public void deleteCartItem(int rno);


}
