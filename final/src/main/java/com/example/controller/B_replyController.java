package com.example.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.B_replyVO;
import com.example.mapper.B_replyMapper;

@Controller
@RequestMapping("/b_reply/")
public class B_replyController {
@Autowired
B_replyMapper mapper;

@RequestMapping("list")
public void list() {

}

@RequestMapping(value="read", method=RequestMethod.POST)
@ResponseBody
	public ArrayList<B_replyVO> read(int b_no) {
		ArrayList<B_replyVO> array = new ArrayList<B_replyVO>();
		array.addAll(mapper.rlist(b_no));
		System.out.println(array.toString());
		return array;
}

@RequestMapping(value="insert", method=RequestMethod.POST)
@ResponseBody
public void insert(B_replyVO vo) {
	mapper.insert(vo);
}
@RequestMapping(value="delete", method=RequestMethod.POST)
@ResponseBody
	public void delete(int r_no) {
	
	mapper.delete(r_no);	
}

}
