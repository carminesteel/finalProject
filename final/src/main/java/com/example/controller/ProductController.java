package com.example.controller;

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.domain.BoardVO;
import com.example.domain.MessageVO;
import com.example.domain.ProductVO;
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
		System.out.println(vo);
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
	      System.out.println(vo.toString());
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
}