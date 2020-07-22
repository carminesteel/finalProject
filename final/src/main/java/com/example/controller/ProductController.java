package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.ProductVO;
import com.example.mapper.ProductMapper;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	ProductMapper pmapper;
	
	@RequestMapping("/list")
	public void list(Model model) {
		model.addAttribute("productList", pmapper.productList());
	}
	
	@RequestMapping("/rest/list")
	@ResponseBody
	public List<ProductVO> productList(){
		return pmapper.productList();
	}
}