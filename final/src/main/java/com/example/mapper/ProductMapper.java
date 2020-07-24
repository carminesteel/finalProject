package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.ProductVO;

public interface ProductMapper {
	public List<ProductVO> bestList();
	public List<ProductVO> artgoods();
	public List<ProductVO> creater();
	public List<ProductVO> proimage(String id);
	public ProductVO read(int p_no);
	public void insert(ProductVO vo);
	public int P_noRead(ProductVO vo);
	public void attachInsert(@Param("p_no") int p_no, @Param("images") String images);
	public void updateViewCnt(String id);
}