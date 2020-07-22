package com.example.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.BoardVO;

public interface BoardMapper {
public ArrayList<BoardVO> list();
public BoardVO read(int b_no);
public void insert(BoardVO vo);
public void delete(int b_no);
public void update(BoardVO vo);
public Integer BnoRead(BoardVO vo);
public void addB_imagelist(@Param("images")String images, @Param("b_no")int b_no);
public List<String> getB_imagelist(int b_no);
public void delB_imagelist(int b_no);
}