package com.example.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.e_replyVO;
import com.example.mapper.ExhibitionMapper;
import com.example.mapper.e_replyMapper;



@Controller
public class e_replyController {
	
	@Autowired
	e_replyMapper mapper;
	@Autowired
	ExhibitionMapper eMapper;
	
	@RequestMapping("/reply/list")
	@ResponseBody
	public HashMap<String,Object> list(int e_no) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("list", mapper.list(e_no));
		map.put("count", eMapper.replyCount(e_no));
		System.out.println(map);
		return map;
	}
	@RequestMapping("/reply/insert")
	@ResponseBody
	public void insert(e_replyVO vo) {
		mapper.insert(vo);
	}
	@RequestMapping("/reply/delete")
	@ResponseBody
	public void delete(int r_no) {
		mapper.delete(r_no);
	}
	@RequestMapping("/reply/reply")
	public void reply() { 

	}
}
