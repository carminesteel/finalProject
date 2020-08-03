package com.example.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.ExhibitionVO;
import com.example.mapper.ExhibitionMapper;

@Service
public class ExhibitionServiceImpl implements ExhibitionService{
	
	@Autowired
	ExhibitionMapper emapper;
	
	@Transactional
	@Override
	public void insert(ExhibitionVO vo) {
		emapper.insert(vo);
		int e_no=emapper.EnoRead(vo);
		//Ã·ºÎÆÄÀÏ insert
		ArrayList<String> images=vo.getImages();
		if(images.size()>0) {
			for(String image:images) {
				emapper.addE_imagelist(e_no, image);
			}
		}
	}

	@Override
	public List<String> getE_imagelist(int e_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Transactional
	@Override
	public void update(ExhibitionVO vo) {
	   emapper.update(vo);
	   emapper.EnoRead(vo);
	   ArrayList<String> images=vo.getImages();
	   if(images.size() > 0) {
	      emapper.delE_imagelist(vo.getE_no());
	      for(String image:images) {
	         emapper.addE_imagelist(vo.getE_no(),image);
	      }
	   }
	}
	@Transactional
	@Override
	public void delete(int e_no) {
	   emapper.delE_imagelist(e_no);
	   emapper.delete(e_no);
	}

	@Transactional
	@Override
	public ExhibitionVO read(int e_no) {
		/* emapper.EnoRead(); */
		return null;
	}

	
}
