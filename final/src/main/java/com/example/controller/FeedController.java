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
		List<String> targets=mapper.TargetRead(id);
		System.out.println(targets);
		ArrayList<BoardVO> BoardList=new ArrayList<BoardVO>();
		
		if(targets.size()>0) {
		for(String target:targets) {
				int num=mapper.TargetBoardCount(target);
				System.out.println(targets.size()+"=»çÀÌÁî /"+num+"°¹¼ö");
				if(num>0) {
					BoardList.add(mapper.TargetBoardListRead(target)); 
					
				}
					
			}
		}
		System.out.println(BoardList.toString());
		return BoardList;
	}
	
}
