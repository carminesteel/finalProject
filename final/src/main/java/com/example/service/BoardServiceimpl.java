package com.example.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.BoardVO;
import com.example.mapper.BoardMapper;

@Service
public class BoardServiceimpl implements BoardService{
	@Autowired
	BoardMapper mapper;
	
	@Transactional
	@Override
	public void insert(BoardVO vo) {
		mapper.insert(vo);
		int b_no=mapper.BnoRead(vo);
		ArrayList<String> images=vo.getImages();
		if(images.size()>0) {
			for(String image:images) {
				mapper.addB_imagelist(image, b_no);
			}
		}	
	}

	@Override
	public List<String> getB_imagelist(int b_no) {
		// TODO Auto-generated method stub
		return null;
	}
	@Transactional
	@Override
	public void update(BoardVO vo) {
		mapper.update(vo);
		ArrayList<String> images=vo.getImages();
		if(images.size() > 0) {
			mapper.delB_imagelist(vo.getB_no());
			for(String image:images) {
				mapper.addB_imagelist(image, vo.getB_no());
			}
		}
	}
	@Transactional
	@Override
	public void delete(int b_no) {
		mapper.finit();
		mapper.delB_imagelist(b_no);
		mapper.delete(b_no);
		mapper.fover();
	}
	@Transactional
	@Override
	public BoardVO read(int b_no) {
		
		return mapper.read(b_no);
	}
}


