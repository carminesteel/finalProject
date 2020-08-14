package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.B_replyVO;
import com.example.domain.Criteria;
import com.example.domain.QnaVO;
import com.example.domain.Qna_replyVO;

public interface QnaMapper {
  public List<QnaVO> list(@Param("p_no") int p_no,@Param("cri")Criteria cri);
  public void insert(QnaVO vo);
  public void delete(int q_no);
  /*public List<Qna_replyVO> list1(Integer q_no);*/
  public void insert2(Qna_replyVO vo);
  public void delete2(int qr_no);
  public List<Qna_replyVO> read(Integer q_no);
}
	