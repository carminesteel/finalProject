package com.example.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.QnaVO;
import com.example.domain.Qna_replyVO;
import com.example.mapper.ProductMapper;
import com.example.mapper.QnaMapper;



@Controller
@RequestMapping("/qna/")
public class QnaController {
	
	@Autowired
	QnaMapper mapper;
	@Autowired
	ProductMapper pMapper;
	
	@RequestMapping("list")
	@ResponseBody
	public HashMap<String,Object> list(@Param(value="p_no") int p_no,Integer q_no,Criteria cri) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		cri.setPerPageNum(5);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(pMapper.qnaCount(p_no));
		map.put("pm",pm);
		map.put("list", mapper.list(p_no,cri));
		
		map.put("count",pMapper.qnaCount(p_no));
		return map;
	}
	
	@RequestMapping("read")
	public void read(Model model,Integer q_no,HttpSession session) {
		session.setAttribute("q_no", q_no);
		model.addAttribute("vo",mapper.read(q_no));
	}
	@RequestMapping(value="insert")
	public void insert() {
		
	}
	@RequestMapping(value="insert",method=RequestMethod.POST)
	@ResponseBody
	public void insert(QnaVO vo) {
		mapper.insert(vo);
		
	}
	@RequestMapping(value="delete",method=RequestMethod.POST)
	@ResponseBody
	public void delete(int q_no) {
		mapper.delete(q_no);
	}
	@RequestMapping(value="insert2",method=RequestMethod.POST)
	@ResponseBody
	public void insert2(Qna_replyVO vo) {
		mapper.insert2(vo);
		
	}
	@RequestMapping(value="delete2",method=RequestMethod.POST)
	@ResponseBody
	public void delete2(int qr_no) {
		mapper.delete2(qr_no);
	}
}
