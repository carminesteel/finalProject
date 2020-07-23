package com.example.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.ProductVO;
import com.example.mapper.ProductMapper;
	
@Repository
public class ProductServiceImpl implements ProductService{
	@Autowired
	ProductMapper pmapper;
	
	@Transactional
	@Override
	public void insert(ProductVO vo) {
		pmapper.insert(vo);
		
		int p_no=pmapper.P_noRead(vo);
		
		ArrayList<String> images = vo.getImages();
		if (images.size() > 0) {
			for (String image : images) {
				pmapper.attachInsert(p_no, image);
			}
		}
	}
	
}
