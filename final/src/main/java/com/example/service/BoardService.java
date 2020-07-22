package com.example.service;

import java.util.List;

import com.example.domain.BoardVO;

public interface BoardService {
 public void insert(BoardVO vo);
 public List<String> getB_imagelist(int b_no);
 public void delete(int b_no);
 public void update(BoardVO vo);
}
