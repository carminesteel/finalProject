package com.example.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.BoardVO;
import com.example.mapper.FeedMapper;

@Controller
public class FeedController {

	@Autowired
	FeedMapper mapper;
	
	@RequestMapping("/feed/feed")
	public void feed() {
		
	}
	
	@RequestMapping("/feed/list")
	@ResponseBody
	public ArrayList<BoardVO> list(String id,Model model) {
		ArrayList<BoardVO> BoardList=(ArrayList<BoardVO>) mapper.feedView(id);
		return BoardList;
	}
	
}
