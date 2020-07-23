package com.example.mapper;

import java.util.HashMap;
import java.util.List;

import com.example.domain.BoardVO;

public interface FeedMapper {
	public List<String> TargetRead(String id);
	public int TargetBoardCount(String target);
	public BoardVO TargetBoardListRead(String target);
}
