package com.example.controller;

import java.util.ArrayList;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.B_replyVO;
import com.example.domain.BoardVO;
import com.example.mapper.B_replyMapper;
import com.example.mapper.BoardMapper;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;

@Controller
@RequestMapping("/b_reply/")
public class B_replyController {
@Autowired
B_replyMapper mapper;
@Autowired
BoardMapper bmapper;

@RequestMapping("list")
public void list() {

}

@RequestMapping(value="read", method=RequestMethod.POST)
@ResponseBody
	public ArrayList<B_replyVO> read(int b_no,Model model,Criteria cri) {
		cri.setPerPageNum(10);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(mapper.replyCount(b_no));
		model.addAttribute("cri",cri);
		model.addAttribute("pm",pm);
		
		ArrayList<B_replyVO> array = new ArrayList<B_replyVO>();
		array.addAll(mapper.rlist(b_no,cri));
		model.addAttribute("replyCount",mapper.replyCount(b_no));
		System.out.println(array.toString());
		return array;
}

@RequestMapping(value="insert", method=RequestMethod.POST)
@ResponseBody
public void insert(B_replyVO vo) {
	mapper.insert(vo);
	int cnt=bmapper.r_cnt(vo.getB_no());
	BoardVO bvo= new BoardVO();
	bvo.setB_no(vo.getB_no());
	bvo.setR_cnt(cnt);
	if(cnt!=0) {
		bmapper.board_r_cnt_update(bvo);
	}
	
}
@RequestMapping(value="delete", method=RequestMethod.POST)
@ResponseBody
	public void delete(int r_no) {
	
	mapper.delete(r_no);	
}

}
