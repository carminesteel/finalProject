package com.example.controller;

import java.util.ArrayList;
import java.util.List;

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
   public void cart(Model model, String id) {
	   model.addAttribute("Clist", cmapper.list(id));
   }
   
   @RequestMapping("/rest/list")
   @ResponseBody
   public ArrayList<CartVO> list(String id) {
	   List<CartVO> list = cmapper.list(id);
	   ArrayList<CartVO> clist= new ArrayList<CartVO>();
	   
	   if(list.size()>0) {
		   for(CartVO vo:list) {
			   int price=vo.getPrice();
			   int quantity=vo.getQuantity();
			   vo.setSum(price, quantity);
			   
			   clist.add(vo);
		   }
	   }
	   
	   return clist;
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
   
   @RequestMapping("/rest/delete")
   @ResponseBody
   public String delete(CartVO cvo) {
	   cmapper.delete(cvo);
	   return "redirect:/cart/list?id="+cvo.getId();
   }
}