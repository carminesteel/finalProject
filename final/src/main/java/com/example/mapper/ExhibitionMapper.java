package com.example.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.example.domain.ExhibitionVO;

public interface ExhibitionMapper {
    
	public List<ExhibitionVO> list();
	public ArrayList<ExhibitionVO> infiniteScrollDown(int r);
	public ExhibitionVO read(int e_no);
	public void insert(ExhibitionVO vo);
    public void delete(int e_no);
	public int replyCount(int e_no);
	public int EnoRead(ExhibitionVO vo);
	public void addE_imagelist(@Param("e_no") int e_no,@Param("images") String images);
	public void delE_imagelist(int e_no);
	public List<String> getE_imagelist(int e_no);
	public void update(ExhibitionVO vo);
	public List<ExhibitionVO> test();
	
	public int likeTableChk(@Param(value = "id") String id,@Param(value = "r_no") int r_no);
	public void likeinsert(@Param(value = "id") String id,@Param(value = "r_no") int r_no);
	public void likedelete(@Param(value = "id") String id,@Param(value = "r_no") int r_no);
	public int likeTableCnt(@Param(value = "r_no") int r_no);
	public void E_likeUpdate(@Param(value = "r_no") int r_no, @Param(value = "like") int like);
}