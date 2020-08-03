package com.example.mapper;

import java.util.List;

import com.example.domain.BoardVO;
import com.example.domain.ProductVO;
import com.example.domain.UsersVO;

public interface MyPageMapper {
	public List<BoardVO> myBlist(String id);
	
	public List<ProductVO> myPlist(String id);
	
	public List<String> myFollowing(String id);
	
	public List<String> myFollower(String id);
	
	public UsersVO UserRead(String id);
}
