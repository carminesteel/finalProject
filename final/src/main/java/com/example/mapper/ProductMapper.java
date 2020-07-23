package com.example.mapper;

import java.util.List;

import com.example.domain.ProductVO;

public interface ProductMapper {
	public List<ProductVO> productList();
	public ProductVO read(int p_no);
}