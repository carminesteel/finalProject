package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.CartVO;
import com.example.mapper.CartMapper;

@Controller
@RequestMapping("/cart")
public class CartController {
	@Autowired
	CartMapper cmapper;
	
	@RequestMapping("/list")
	public void list(Model model, String id) {
		model.addAttribute("list", cmapper.list(id));
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public void cartinsert(CartVO cvo) {
		int cnt = cmapper.cartRead(cvo);
		if(cnt==0) {
			cmapper.cartinsert(cvo);
		}else {
			cmapper.cartupdate(cvo);
		}
	}
	
	@RequestMapping("/minus")
	public String minus(CartVO cvo) {
		cmapper.minus(cvo);
		return "redirect:/cart/list?id="+cvo.getId();
	}
	
	@RequestMapping("/plus")
	public String plus(CartVO cvo) {
		cmapper.plus(cvo);
		return "redirect:/cart/list?id="+cvo.getId();
	}
}
