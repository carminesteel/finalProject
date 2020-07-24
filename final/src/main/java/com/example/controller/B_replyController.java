package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.B_replyVO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.mapper.B_replyMapper;

@Controller
@RequestMapping("/b_reply/")
public class B_replyController {
@Autowired
B_replyMapper mapper;

@RequestMapping(value="insert", method=RequestMethod.POST)
public String insert(B_replyVO vo) {
int b_no = vo.getB_no();
	mapper.insert(vo);

 return "redirect:/board/read?b_no=" + b_no;
}
@RequestMapping(value="delete", method=RequestMethod.POST)
@ResponseBody
	public void delete(int r_no) {
	
	mapper.delete(r_no);	
}
}
