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

import com.example.domain.ProductVO;
import com.example.mapper.ProductMapper;
import com.example.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	ProductMapper pmapper;
	
	@Autowired
	ProductService pService;
	
	@RequestMapping("/list")
	public void list(Model model) {
		model.addAttribute("productList", pmapper.productList());
	}
	
	@RequestMapping("/rest/list")
	@ResponseBody
	public List<ProductVO> productList(){
		return pmapper.productList();
	}
	
	@RequestMapping("/read")
	public void read(Model model, int p_no) {
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
		// display fileName�씠 �엳�뒗 寃쎌슦
		if (!fileName.equals("")) {
			File file = new File(path + File.separator + fileName);
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		}
		return result;
	}
}