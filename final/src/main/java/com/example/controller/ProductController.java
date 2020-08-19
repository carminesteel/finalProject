package com.example.controller;

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.domain.CartVO;
import com.example.domain.MessageVO;
import com.example.domain.ProductVO;
import com.example.domain.PurchaseVO;
import com.example.domain.UsersVO;
import com.example.mapper.CartMapper;
import com.example.mapper.MessageMapper;
import com.example.mapper.ProductMapper;
import com.example.mapper.UsersMapper;
import com.example.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	ProductMapper pmapper;
	
	@Autowired
	UsersMapper umapper;
	
	@Autowired
	MessageMapper Mmapper;
	
	@Autowired
	ProductService pService;
	
	@Autowired
	CartMapper cmapper;
	
	@RequestMapping("/message")
	public void message() {		
	}	
	@RequestMapping("/paper")
	public void paper() {		
	}
	@RequestMapping(value="/paperInsert", method=RequestMethod.POST)
	@ResponseBody
	public void paperInsert(MessageVO vo) { 
		Mmapper.paperInsert(vo);
	}
	
	@RequestMapping("/list")
	public void list(Model model) {
		model.addAttribute("users", umapper.list());
		
		model.addAttribute("proimage", umapper.proimage());
	}
	
	@RequestMapping("/rest/bestlist")
	@ResponseBody
	public List<ProductVO> bestList(){
		return pmapper.bestList();
	}
	
	@RequestMapping("/rest/artgoods")
	@ResponseBody
	public List<ProductVO> artgoods(){
		return pmapper.artgoods();
	}
	
	
	@RequestMapping("/rest/proimage")
	@ResponseBody
	public List<ProductVO> proimage(){
		return pmapper.proimage();
	}
	
	@RequestMapping("/read")
	public void read(Model model, int p_no, String id) {
		pmapper.updateViewCnt(id);
		model.addAttribute("p_image", pmapper.p_image(p_no));
		model.addAttribute("readimage", pmapper.readimage(p_no));
		model.addAttribute("read", pmapper.read(p_no));
		model.addAttribute("re",pmapper.replyCount(p_no));
		model.addAttribute("qe",pmapper.qnaCount(p_no));
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insert(){		
	}
	
	@Resource(name="uploadPath")
	private String path;

	@RequestMapping(value="/insert", method=RequestMethod.POST)
	   public String insertPost(ProductVO vo, MultipartHttpServletRequest multi)throws Exception {

	      MultipartFile file = multi.getFile("file");
	      if(!file.isEmpty()) {
	         String image=System.currentTimeMillis() + file.getOriginalFilename();
	         file.transferTo(new File(path+File.separator+ image));
	         vo.setImage(image);
	      }
	      
	      List<MultipartFile> files = multi.getFiles("files");
	      ArrayList<String> images= new ArrayList<String>();
	      for(MultipartFile addFile:files) {
	         if(!addFile.isEmpty()) {
	            String image=System.currentTimeMillis() + addFile.getOriginalFilename();
	            addFile.transferTo(new File(path+File.separator+ image));
	            images.add(image);
	         }
	      }
	      vo.setImages(images);
	      pService.insert(vo);
	      return "redirect:list";
	   }
	
	
	@RequestMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> display(String fileName) throws Exception {
		ResponseEntity<byte[]> result = null;
		if (!fileName.equals("")) {
			File file = new File(path + File.separator + fileName);
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		}
		return result;
	}
	@RequestMapping("/order")
	public Model order(String id,int p_no,int quantity,int tot,Model model) {
		model.addAttribute("uvo",umapper.read(id));
		model.addAttribute("pvo",pmapper.read(p_no));
		model.addAttribute("quan",quantity);
		model.addAttribute("addrList",pmapper.addrList(id));
		int cnt=pmapper.orderGetCnt(id);
		if(cnt==0) {
			if(tot<50000) {
				model.addAttribute("tot",(tot-2500)/2 + 2500);
				model.addAttribute("discount",(tot-2500)/2);
				model.addAttribute("shipping_fee",2500);
				
				model.addAttribute("cnt",0);
			}else {
				model.addAttribute("tot",tot/2);
				model.addAttribute("discount",(tot/2)+2500);
				model.addAttribute("shipping_fee",0);
				
				model.addAttribute("cnt",1);
			}
				
		}
		else {
			if(tot<50000) {
				model.addAttribute("tot",tot);
				model.addAttribute("discount",0);
				model.addAttribute("shipping_fee",2500);
				
				model.addAttribute("cnt",2);
			}else {
				model.addAttribute("tot",tot);
				model.addAttribute("discount",2500);
				model.addAttribute("shipping_fee",0);
				
				model.addAttribute("cnt",3);
			}
		}
		return model;
	}
	@RequestMapping("/order2")
	public Model order2(String id,int tot,@RequestParam List<String> p_images,Model model) {
		model.addAttribute("uvo",umapper.read(id));
		model.addAttribute("addrList",pmapper.addrList(id));
		CartVO cvo=new CartVO();
		
		List<CartVO> clist = new ArrayList<CartVO>();
		for(String image:p_images) {
			cvo.setId(id);
			cvo.setP_image(image);
			clist.addAll(pmapper.buyCart(cvo));
		}
		model.addAttribute("clist",clist);
		
		int cnt=pmapper.orderGetCnt(id);
		if(cnt==0) {
			if(tot<50000) {
				model.addAttribute("total",(tot-2500)/2 + 2500);
				
				model.addAttribute("shipping_fee",2500);
				
				model.addAttribute("cnt",0);
			}else {
				model.addAttribute("total",tot/2);
				
				model.addAttribute("shipping_fee",0);
				
				model.addAttribute("cnt",1);
			}
				
		}
		else {
			if(tot<50000) {
				model.addAttribute("total",tot);
				model.addAttribute("discount",0);
				model.addAttribute("shipping_fee",2500);
				
				model.addAttribute("cnt",2);
			}else {
				model.addAttribute("total",tot);
				model.addAttribute("discount",2500);
				model.addAttribute("shipping_fee",0);
				
				model.addAttribute("cnt",3);
			}
		}
		return model;
	}
	@RequestMapping("/payment/finish")
	@ResponseBody
	public void finish(HttpSession session, PurchaseVO vo, int point,String addr) {
		String id=(String) session.getAttribute("id");
		int cnt=pmapper.getOrders(id);
		UsersVO uvo=new UsersVO();
		uvo.setId(id);
		uvo.setPoint(point);
		uvo.setAddr(addr);
		int addrcnt=pmapper.chkAddr(uvo);
		int addrListcnt=pmapper.chkAddrList(uvo);
		
		if(addrcnt==0) {
			if(addrListcnt==0) {
				pmapper.InsertAddressList(uvo);
			}
		}
		vo.setOrders_id(id);
		vo.setProduct_no(vo.getP_no());
		if(cnt==0) {
			pmapper.InsertOrders(id);
			pmapper.InsertPurchase(vo);
			pmapper.UpdatePoint(uvo);
		}else {
			pmapper.InsertPurchase(vo);
			pmapper.UpdatePoint(uvo);
		}
	}
	
	@RequestMapping("/payment/finish2")
	public String finish2(HttpSession session,@RequestParam(value="p_nos") List<Integer> p_nos, int point,String requirement,String addr) {
		String id=(String) session.getAttribute("id");
		int cnt=pmapper.getOrders(id);
		UsersVO uvo=new UsersVO();
		uvo.setId(id);
		uvo.setPoint(point);
		uvo.setAddr(addr);
		int addrcnt=pmapper.chkAddr(uvo);
		int addrListcnt=pmapper.chkAddrList(uvo);
		
		if(addrcnt==0) {
			if(addrListcnt==0) {
				pmapper.InsertAddressList(uvo);
			}
		}
		
		CartVO cvo=new CartVO();
		
		cvo.setId(id);
		PurchaseVO vo= new PurchaseVO();
		vo.setOrders_id(id);
		if(cnt==0) {
			pmapper.InsertOrders(id);
			for(int p_no:p_nos) {
				cvo.setP_no(p_no);
				CartVO Incvo = new CartVO();
				Incvo=cmapper.clist(cvo);
				vo.setQuantity(Incvo.getQuantity());
				vo.setProduct_no(Incvo.getP_no());
				vo.setRequirement(requirement);
				pmapper.InsertPurchase(vo);
			}
			pmapper.UpdatePoint(uvo);
		}else {
			for(int p_no:p_nos) {
				cvo.setP_no(p_no);
				CartVO Incvo = new CartVO();
				Incvo=cmapper.clist(cvo);
				vo.setQuantity(Incvo.getQuantity());
				vo.setProduct_no(Incvo.getP_no());
				vo.setRequirement(requirement);
				pmapper.InsertPurchase(vo);
			}
			pmapper.UpdatePoint(uvo);
		}
		
		return "redirect:/product/list";
	}
}