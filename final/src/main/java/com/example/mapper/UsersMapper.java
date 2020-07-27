package com.example.mapper;

import java.util.List;

import com.example.domain.UsersVO;

public interface UsersMapper {
	public List<UsersVO> list();
	public List<UsersVO> proimage();
	public int login(UsersVO vo);
	public UsersVO read(String id);
	public void insert(UsersVO vo);
}
