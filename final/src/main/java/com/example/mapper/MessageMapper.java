package com.example.mapper;


import java.util.List;
import com.example.domain.MessageVO;

public interface MessageMapper {

	public List<MessageVO> listSend(String id);
	public List<MessageVO> listReceive(String id);
	public void updateRead(MessageVO mvo);
	public void updateSdel(int m_no);
	public void updatePosition(int m_no);
	public MessageVO read(int m_no);
	public MessageVO rRead(MessageVO mvo);
	public void paperInsert(MessageVO mvo);
}
