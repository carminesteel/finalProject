package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.UsersVO;

public interface UsersMapper {
	public List<UsersVO> list();
	public List<UsersVO> proimage();
	public int login(UsersVO vo);
	public UsersVO read(String id);
	public void insert(UsersVO vo);
	
	public int followChk(@Param(value="follower")String follower,@Param(value="target")String target);
	public void followInsert(@Param(value="follower")String follower,@Param(value="target")String target);
	public void followDelete(@Param(value="follower")String follower,@Param(value="target")String target);
	public int followerCnt(String target);
	public int followingCnt(String follower);
	public void followerUpdate(@Param(value="follower") int followerCnt, @Param(value="id") String target);
	public void followUpdate(@Param(value="follow") int followingCnt, @Param(value="id") String follower);
	
}
