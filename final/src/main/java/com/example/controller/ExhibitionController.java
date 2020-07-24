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

import com.example.domain.ExhibitionVO;
import com.example.mapper.ExhibitionMapper;
import com.example.service.ExhibitionService;

@Controller
public class ExhibitionController {

	@Resource(name="uploadPath")
	private String path;
	
	@Autowired
	ExhibitionMapper mapper;

	@Autowired
	ExhibitionService service;
	
	@RequestMapping("exh/update")
	public void update() {

	}
	
	@RequestMapping("exh/read")
	public void read(Model model,int e_no) {
		model.addAttribute("vo", mapper.read(e_no));
		model.addAttribute("images", mapper.getE_imagelist(e_no));
		model.addAttribute("re", mapper.replyCount(e_no));
		System.out.println(model);
	}

	@RequestMapping("exh/list")
	public void list(Model model) {
		model.addAttribute("list",mapper.list());
	}

	@RequestMapping("exh/insert")
	public void insert(ExhibitionVO vo) {
		
	}
	
	@RequestMapping(value="/exh/insert", method=RequestMethod.POST)
	public String insertPost(ExhibitionVO vo,MultipartHttpServletRequest multi)throws Exception {
		String date=vo.getDate()+"~"+vo.getDate2();
		vo.setDate(date);
		MultipartFile file = multi.getFile("file");
		if(!file.isEmpty()) {
			String image=System.currentTimeMillis() + file.getOriginalFilename();
			file.transferTo(new File(path+File.separator+ image));
			vo.setImage(image);
		}
		//첨부파일업로드
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
		/* System.out.println(vo.toString()); */
		service.insert(vo);
		return "redirect:list";
	}
}
