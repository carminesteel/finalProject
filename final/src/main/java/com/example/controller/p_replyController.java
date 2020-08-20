package com.example.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.e_replyVO;
import com.example.domain.p_replyVO;
import com.example.mapper.ExhibitionMapper;
import com.example.mapper.ProductMapper;
import com.example.mapper.e_replyMapper;
import com.example.mapper.p_replyMapper;



@Controller
@RequestMapping("/p_reply/")
public class p_replyController {
	
	@Autowired
	p_replyMapper mapper;
	@Autowired
	ProductMapper pMapper;
	
	@RequestMapping("list")
	@ResponseBody
	public HashMap<String,Object> list(int p_no,Criteria cri) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		cri.setPerPageNum(5);
		
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(pMapper.replyCount(p_no));
		map.put("pm",pm);
		map.put("list", mapper.list(cri,p_no));
		map.put("count", pMapper.replyCount(p_no));
		return map;
	}
	@RequestMapping(value="insert",method=RequestMethod.POST)
	@ResponseBody
	public void insert(p_replyVO vo) {
		mapper.insert(vo);
		
	}
	@RequestMapping(value="delete",method=RequestMethod.POST)
	@ResponseBody
	public void delete(int r_no) {
		int cnt=mapper.likeCnt(r_no);
		if(cnt==0) {
			mapper.delete(r_no);
		}else {
			mapper.likeDelete(r_no);
			mapper.delete(r_no);
		}
	}
	@RequestMapping("reply")
	public void reply() { 

	}
	
	@RequestMapping(value="/like/update", method = RequestMethod.POST)
	@ResponseBody
	public void LikeUpdate(Model model,@RequestParam(value ="id") String id,@RequestParam(value ="r_no") int r_no) {
		int chk=pMapper.likeTableChk(id, r_no);
		
		if(chk==0) {
			pMapper.likeinsert(id, r_no);
		}else {
			pMapper.likedelete(id, r_no);


		}
	}
}
