package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.B_replyVO;
import com.example.domain.Criteria;
import com.example.domain.QnaVO;

public interface QnaMapper {
  public List<QnaVO> list(@Param("p_no") int p_no,@Param("cri")Criteria cri);
  public void insert(QnaVO vo);
  public void delete(int q_no);
  


}
	