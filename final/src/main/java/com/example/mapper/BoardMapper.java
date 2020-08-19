	package com.example.mapper;
	
	import java.util.ArrayList;
	import java.util.List;
	
	import org.apache.ibatis.annotations.Param;
	
	import com.example.domain.BoardVO;
	
	public interface BoardMapper {
		public ArrayList<BoardVO> list();
		public ArrayList<BoardVO> listA();
		public ArrayList<BoardVO> listB();
		public ArrayList<BoardVO> infiniteScrollDown(int r);
		public ArrayList<BoardVO> AinfiniteScrollDown(int r);
		public ArrayList<BoardVO> BinfiniteScrollDown(int r);
		public BoardVO read(int b_no);
		public void insert(BoardVO vo);
		public void delete(int b_no);
		public void update(BoardVO vo);
		public Integer BnoRead(BoardVO vo);
		public void addB_imagelist(@Param("images")String images, @Param("b_no")int b_no);
		public List<String> getB_imagelist(int b_no);
		public void delB_imagelist(int b_no);
		public int r_cnt(int b_no);
		public void board_r_cnt_update(BoardVO vo);
		//like
		public int likeTableChk(@Param(value = "id") String id,@Param(value = "b_no") int b_no);
		public void likeinsert(@Param(value = "id") String id,@Param(value = "b_no") int b_no);
		public void likedelete(@Param(value = "id") String id,@Param(value = "b_no") int b_no);
		
		public int likeTableCnt(@Param(value = "b_no") int b_no);
		public void B_likeUpdate(@Param(value = "b_no") int b_no, @Param(value = "like") int like);
		//report
		public int reportCnt(@Param(value = "id") String id, @Param(value= "b_no") int b_no);
		public void reportInsert(BoardVO vo);
		public int BoardReportCnt(int b_no);
		public void updateReport(BoardVO vo);
		
		//view
		public void updateView(BoardVO vo);
		
		//foreign key �빐�젣 諛� �꽕�젙
		public void finit();
		public void fover();
	}