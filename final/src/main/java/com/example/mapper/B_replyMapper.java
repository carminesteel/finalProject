package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.B_replyVO;
import com.example.domain.Criteria;

public interface B_replyMapper {
  public List<B_replyVO> rlist(@Param("b_no") int b_no, @Param("cri") Criteria cri);
  public List<B_replyVO> rrlist(int b_no);
  public void insert(B_replyVO vo);
  public int replyCount(int b_no);
  public void delete(int r_no);
  
  public int getB_no(int r_no);

}
	