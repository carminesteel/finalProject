package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.BoardVO;

public interface FeedMapper {
	public List<BoardVO> feedView(String id);
	public int getFollowing(String id);
	public List<BoardVO> feedList(@Param(value="id") String id, @Param(value="targetCnt") int targetCnt);
}
