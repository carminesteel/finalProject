package com.example.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.domain.MessageVO;
import com.example.mapper.MessageMapper;



@RestController
public class MessageController {

	@Autowired
	MessageMapper mapper;
	

	@RequestMapping("/message/sdelete")
	public void sdelete(int m_no) {
		mapper.updateSdel(m_no);
	}
	@RequestMapping("/message/pdelete")
	public void pdelete(int m_no) {
		mapper.updatePosition(m_no);
	}
	@RequestMapping("/list/send")
	public List<MessageVO> listSend(String id){
		return mapper.listSend(id);
	}
	@RequestMapping("/list/receive")
	public List<MessageVO> listReceive(String id){
		return mapper.listReceive(id);
	}
	
	@RequestMapping("/message/insert")
	public void paperInsert(MessageVO vo) {
		mapper.paperInsert(vo);
	}
	
	@RequestMapping("/message/read")
	public MessageVO read(MessageVO mvo) {
		MessageVO vo=mapper.read(mvo.getM_no());
		if(vo.getReceiveDate()==null) {
			mapper.updateRead(mvo);		
		}
		return mapper.read(mvo.getM_no());
	}
	
	@RequestMapping("/message/rRead")
	public MessageVO rRead(MessageVO mvo) {
		MessageVO vo=mapper.rRead(mvo);
		System.out.println(vo);
		if(vo.getReceiveDate()==null) {
			mapper.updateRead(mvo);			
		}
		System.out.println(vo);
		return mapper.rRead(mvo);
	}
}
