package com.example.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.B_replyVO;
import com.example.domain.BoardVO;
import com.example.mapper.B_replyMapper;
import com.example.mapper.FeedMapper;

@Controller
public class FeedController {

	@Autowired
	FeedMapper mapper;
	
	@Autowired
	B_replyMapper Rmapper;
	
	@RequestMapping("/feed/list")
	public String list(HttpSession session,Model model) {
		
		ArrayList<B_replyVO> array = new ArrayList<B_replyVO>();
		String id = (String)session.getAttribute("id");
		ArrayList<BoardVO> b_nos=(ArrayList<BoardVO>)mapper.feedView(id);
		for(BoardVO b_no:b_nos) {
			ArrayList<B_replyVO> chk=(ArrayList<B_replyVO>) Rmapper.rrlist(b_no.getB_no()); 
			 if(chk!=null) {
			 array.addAll((ArrayList<B_replyVO>)Rmapper.rrlist(b_no.getB_no()));
			 }
			 
		}
		model.addAttribute("Flist",mapper.feedView(id));
		model.addAttribute("Rlist",array);
		return "/feed/list";
	}

	@RequestMapping(value="/feed/infiniteScrollDown", method=RequestMethod.POST)
	public @ResponseBody List<BoardVO> infiniteScrollDownPOST(@RequestBody BoardVO bvo, HttpSession session){
		Integer rToStart=bvo.getR()-1;
		String id = (String)session.getAttribute("id");
		return mapper.infiniteScrollDown(id, rToStart);
	}
	
	@RequestMapping(value="read", method=RequestMethod.POST)
	@ResponseBody
		public ArrayList<B_replyVO> read(int b_no) {
			ArrayList<B_replyVO> array = new ArrayList<B_replyVO>();
			array.addAll(Rmapper.rrlist(b_no));
			return array;
	}
	
}
