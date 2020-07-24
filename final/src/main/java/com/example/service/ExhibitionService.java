package com.example.service;

import java.util.List;

import com.example.domain.ExhibitionVO;


public interface ExhibitionService {

	public void insert(ExhibitionVO vo);
	public List<String> getE_imagelist(int e_no);
	public void delete(int e_no);
	public void update(ExhibitionVO vo);
	public ExhibitionVO read(int e_no);
}
