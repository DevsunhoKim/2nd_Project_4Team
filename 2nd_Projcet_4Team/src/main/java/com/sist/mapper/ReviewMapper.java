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

    @Select("SELECT r.no, r.rno, r.userId, r.cont, TO_CHAR(r.regdate, 'YYYY-MM-DD HH24:MI:SS') as dbday, cateno , r.score " +
            "FROM review1 r JOIN member m ON r.userId = m.userId " +
            "WHERE r.no=#{no} AND r.cateno = #{cateno}" +
            "ORDER BY r.rno DESC")
    public List<ReviewVO> reviewListData(@Param("no") int no,@Param("cateno") int cateno);

    @Insert("INSERT INTO review1(rno, no, userId, cont, score, regdate, cateno) " +
            "VALUES(review1_rno_seq.nextval, #{no}, #{userId}, #{cont}, #{score}, SYSDATE, #{cateno})")
    public void reviewInsert(ReviewVO vo);

    @Update("UPDATE review1 SET " +
            "cont=#{cont}, score=#{score} " +
            "WHERE rno=#{rno} AND cateno=#{cateno} AND userId=#{userId}")
    public void reviewUpdate(ReviewVO vo);

    @Delete("DELETE FROM review1 WHERE rno=#{rno} AND userId=#{userId} AND cateno=#{cateno}")
    public void reviewDelete(@Param("rno") int rno, @Param("userId") String userId, @Param("cateno") int cateno);

    @Select("SELECT ROUND(AVG(score), 1) AS average_score FROM review1 WHERE no = #{no} AND cateno = #{cateno}")
    Double avgScore(@Param("no") int no, @Param("cateno") int cateno);



}

