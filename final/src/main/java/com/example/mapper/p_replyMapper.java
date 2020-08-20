package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.Criteria;
import com.example.domain.p_replyVO;

public interface p_replyMapper {

	public List<p_replyVO> list(@Param("cri")Criteria cri, @Param("p_no")int p_no);;
	public void insert(p_replyVO vo);
	public void delete(int r_no);
	public void likeDelete(int r_no);
	public int likeCnt(int r_no);
	
}
