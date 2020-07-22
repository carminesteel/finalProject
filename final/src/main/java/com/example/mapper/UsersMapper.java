package com.example.mapper;

import com.example.domain.UsersVO;

public interface UsersMapper {
	public int login(UsersVO vo);
	public UsersVO read(String id);
}
