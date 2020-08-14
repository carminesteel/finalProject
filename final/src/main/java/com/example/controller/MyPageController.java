package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mapper.MyPageMapper;
import com.example.mapper.UsersMapper;

@Controller
public class MyPageController {

	@Autowired
	MyPageMapper Mmapper;
	
	@Autowired
	UsersMapper mapper;
	
	@RequestMapping("/mypage/unfollow")
	@ResponseBody
	public void unFollow(String follower, String target) {
		mapper.followDelete(follower, target);
        int followerCnt=mapper.followerCnt(target);
        int followingCnt=mapper.followingCnt(follower);
        mapper.followerUpdate(followerCnt, target);
        mapper.followUpdate(followingCnt, follower);
	}
}
