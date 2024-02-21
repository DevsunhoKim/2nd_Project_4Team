package com.sist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.RecruitmentDAO;
import com.sist.vo.CompanyVO;
import com.sist.vo.RecruitVO;

@Service
public class RecruitmentServiceImpl implements RecruitmentService{

	@Autowired
	private RecruitmentDAO rDao;

	// 목록 출력
	@Override
	public List<RecruitVO> recruitListData(int start, int end) {
		// TODO Auto-generated method stub
		return rDao.recruitListData(start, end);
	}

	// 총 페이지
	@Override
	public int recruitTotalPage() {
		// TODO Auto-generated method stub
		return rDao.recruitTotalPage();
	}

	@Override
	public RecruitVO recuitDetailData(int no) {
		// TODO Auto-generated method stub
		return rDao.recuitDetailData(no);
	}

	@Override
	public CompanyVO companyDetailData(int no) {
		// TODO Auto-generated method stub
		return rDao.companyDetailData(no);
	}

}
