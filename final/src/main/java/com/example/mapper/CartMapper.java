package com.example.mapper;

import java.util.List;

import com.example.domain.CartVO;

public interface CartMapper {
   public List<CartVO> list(String id);
   public void cartinsert(CartVO cvo);
   public void cartupdate(CartVO cvo);
   public int cartRead(CartVO cvo);
   public void minus(CartVO cvo);
   public void plus(CartVO cvo);
   public CartVO read(String id);
   public void delete(CartVO cvo);
   public CartVO clist(CartVO vo);
}