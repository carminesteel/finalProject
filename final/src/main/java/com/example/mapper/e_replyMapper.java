package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.Criteria;
import com.example.domain.e_replyVO;

public interface e_replyMapper {

	public List<e_replyVO> list(@Param("cri")Criteria cri,@Param("e_no")int e_no);
	public void insert(e_replyVO vo);
	public void delete(int r_no);
	
}
