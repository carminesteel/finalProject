package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.CartVO;
import com.example.mapper.CartMapper;

@Controller
@RequestMapping("/cart")
public class CartController {
	@Autowired
	CartMapper cmapper;
	
	@RequestMapping("/orders")
	public void orders(Model model) {
		
	}
	
	@RequestMapping("/insert")
	public void cartinsert(CartVO cvo) {
		cmapper.cartinsert(cvo);
	}
}
