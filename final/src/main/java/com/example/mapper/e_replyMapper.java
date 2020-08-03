package com.example.mapper;

import java.util.List;

import com.example.domain.e_replyVO;

public interface e_replyMapper {

	public List<e_replyVO> list(int e_no);
	public void insert(e_replyVO vo);
	public void delete(int r_no);
	
}
