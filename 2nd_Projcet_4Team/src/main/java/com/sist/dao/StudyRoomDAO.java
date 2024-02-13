package com.sist.dao;

import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.StudyRoomMapper;
import com.sist.vo.StudyRoomVO;

@Repository
public class StudyRoomDAO {
	@Autowired
	private StudyRoomMapper mapper;

	public List<StudyRoomVO> studyRoomListData(){
		return mapper.studyRoomListData();
	}

	public StudyRoomVO studyRoomDetailData(int no)
	{
		StudyRoomVO vo=mapper.studyRoomDetailData(no);
		StringTokenizer st=new StringTokenizer(vo.getDeimage(),"^");
		String[] arr=new String[4];
		while(st.hasMoreTokens())
		{

			for(int i=0;i<arr.length;i++)
			{
				arr[i]=st.nextToken();
			}
		}
		vo.setDimage(arr);
		for(String img:vo.getDimage()) {
			System.out.println(img);
		}
		return vo;
	}
}
