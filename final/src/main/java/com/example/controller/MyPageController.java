package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mapper.MyPageMapper;

@Controller
public class MyPageController {

	@Autowired
	MyPageMapper mapper;
	
	/*
	 * @RequestMapping("/mypage/list") public void MyPageList(String id,Model model)
	 * { System.out.println(mapper.myBlist(id));
	 * model.addAttribute("blist",mapper.myBlist(id)); }
	 */
	
}
