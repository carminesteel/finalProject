package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.ExhibitionVO;

public interface ExhibitionMapper {
    
	public List<ExhibitionVO> list();
	public ExhibitionVO read(int e_no);
	public void insert(ExhibitionVO vo);
    public void delete(int e_no);
	public int replyCount(int e_no);
	public int EnoRead(ExhibitionVO vo);
	public void addE_imagelist(@Param("e_no") int e_no,@Param("images") String image);
	public void delE_imagelist(int e_no);
	public List<String> getE_imagelist(int e_no);
	public void update(ExhibitionVO vo);

}
