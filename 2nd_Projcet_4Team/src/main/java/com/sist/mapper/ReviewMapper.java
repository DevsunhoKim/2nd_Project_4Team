package com.sist.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.ReviewVO;
public interface ReviewMapper {
	  // 목록
	  @Select("SELECT no,rno,userId,userName,msg,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday "
			 +"FROM review1 "
			 +"WHERE rno=#{rno} && cateno=#{cateno}"
			 +"ORDER BY no DESC")
	  public List<ReviewVO> reviewListData(int rno);
	  // 추가
	  @Insert("INSERT INTO review1(no,rno,userId,userName,cont,score) "
			 +"VALUES(prr_no_seq.nextval,#{rno},#{userId},#{userName},#{cont},#{score})")
	  public void reviewInsert(ReviewVO vo);
	  // 수정
	  @Update("UPDATE review SET "
			 +"cont=#{cont} "
			 +"WHERE no=#{no} && cateno=#{cateno}")
	  public void reviewUpdate(ReviewVO vo);
	  // 삭제
	  @Delete("DELETE FROM review1 "
			 +"WHERE no=#{no} && cateno=#{cateno}")
	  public void reviewDelete(int no);
}
