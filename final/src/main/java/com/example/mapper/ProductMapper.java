package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.CartVO;
import com.example.domain.ProductVO;
import com.example.domain.PurchaseVO;
import com.example.domain.UsersVO;

public interface ProductMapper {
	public List<ProductVO> bestList();
	public List<ProductVO> artgoods();
	public List<ProductVO> creater();
	public List<ProductVO> proimage();
	public List<ProductVO> readimage(int p_no);
	public List<ProductVO> p_image(int p_no);
	public void update(ProductVO pvo);
	public void attachUpdate(@Param("p_no") int p_no, @Param("images") String images);
	public ProductVO read(int p_no);
	public void insert(ProductVO vo);
	public int P_noRead(ProductVO vo);
	public void attachInsert(@Param("p_no") int p_no, @Param("images") String images);
	public void updateViewCnt(String id);
	public int replyCount(int p_no);
	public int qnaCount(int p_no);
	public int orderGetCnt(String id);
	public List<UsersVO> addrList(String id);
	public List<CartVO> buyCart(CartVO vo);

	public int getOrders(String id);
	public void InsertOrders(String id);
	public void InsertPurchase(PurchaseVO vo);
	public void UpdatePoint(UsersVO vo);

	public int chkAddr(UsersVO vo);
	public int chkAddrList(UsersVO vo);
	public void InsertAddressList(UsersVO vo);

	public int likeTableChk(@Param(value = "id") String id,@Param(value = "r_no") int r_no);
	public void likeinsert(@Param(value = "id") String id,@Param(value = "r_no") int r_no);
	public void likedelete(@Param(value = "id") String id,@Param(value = "r_no") int r_no);
	public int likeTableCnt(@Param(value = "r_no") int r_no);
	public void E_likeUpdate(@Param(value = "r_no") int r_no, @Param(value = "like") int like);
}