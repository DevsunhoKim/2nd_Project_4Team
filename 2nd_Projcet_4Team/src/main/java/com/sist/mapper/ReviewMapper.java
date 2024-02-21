package com.sist.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.ReviewVO;

// 데이터베이스 내 리뷰 작업을 처리하기 위한 매퍼 인터페이스
public interface ReviewMapper {
    // 특정 카테고리와 리뷰 번호에 대한 리뷰 목록 검색
    @Select("SELECT r.no, r.rno, r.userId, r.cont, TO_CHAR(r.regdate, 'YYYY-MM-DD HH24:MI:SS') as dbday,cateno " +
            "FROM review1 r JOIN member m ON r.userId = m.userId " +
            "WHERE r.no=#{no} AND r.cateno=1 " +
            "ORDER BY r.no DESC")
    public List<ReviewVO> reviewListData(@Param("no") int no);

 
    @Insert("INSERT INTO review1(no, rno, userId, cont, score) " +
            "VALUES(review1_no_seq.nextval, #{rno}, #{userId}, #{cont}, #{score})")
    public void reviewInsert(ReviewVO vo);

    // 기존 리뷰의 내용 업데이트 
    @Update("UPDATE review1 SET " +
            "cont=#{cont}, score=#{score} " +
            "WHERE no=#{no} AND cateno=1")
    public void reviewUpdate(ReviewVO vo);

    // 데이터베이스에서 리뷰 삭제
    @Delete("DELETE FROM review1 " +
            "WHERE no=#{no} AND cateno=1")
    public void reviewDelete(int no); // 'cateno' 매개변수 추가 및 @Param 어노테이션 사용
}
