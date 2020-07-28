package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.ProductVO;

public interface ProductMapper {
	public List<ProductVO> bestList();
	public List<ProductVO> artgoods();
	public List<ProductVO> creater();
	public List<ProductVO> proimage();
	public ProductVO read(int p_no);
	public void insert(ProductVO vo);
	public int P_noRead(ProductVO vo);
	public void attachInsert(@Param("p_no") int p_no, @Param("images") String images);
	public void updateViewCnt(String id);

	/* 주문을 위한 mapper들 */
	public int countP(@Param("orders_id") String id, @Param("product_no") int p_no);
	public void insertP(@Param("orders_id") String id, @Param("quantity") int quantity, @Param("product_no") int p_no);
	public void updateP(@Param("quantity") int quantity, @Param("orders_id") String id, @Param("product_no") int p_no);
	public void insertO(String id);
}