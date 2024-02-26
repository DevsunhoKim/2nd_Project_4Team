package com.sist.service;

import java.util.List;
import com.sist.vo.*;
// MentorDAO, RecruitDAO, BookDAO
public interface MainService {
	public List<MentorVO> getMentorBytech(String cate);
	public List<RecruitVO> getRecruitBytech(String engTech);
	public List<BooksVO> getBookstBytech(String engTech);
}
