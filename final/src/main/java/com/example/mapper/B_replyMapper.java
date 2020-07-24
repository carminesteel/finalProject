package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.B_replyVO;
import com.example.domain.Criteria;

public interface B_replyMapper {
  public List<B_replyVO> rlist(int b_no);
  public void insert(B_replyVO vo);
  public int total(int b_no);
  public void delete(int r_no);
}
	