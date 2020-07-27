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
import com.example.mapper.B_replyMapper;
import com.example.mapper.BoardMapper;
import com.example.service.BoardService;


@Controller
@RequestMapping("/board/")
public class BoardController {
	@Resource(name="uploadPath")
	private String path;
	@Autowired
	BoardMapper mapper;
	@Autowired
	B_replyMapper rmapper;

@Autowired
BoardService service;

@RequestMapping("list")
public void list(Model model) {
	model.addAttribute("list",mapper.list());

}
@RequestMapping("insert")
public void insert() {

}
@RequestMapping("read")
public void read(Model model, int b_no) {
	model.addAttribute("vo",mapper.read(b_no));
	model.addAttribute("list", mapper.getB_imagelist(b_no));
}
@RequestMapping(value="insert", method=RequestMethod.POST)
public String insertPost(BoardVO vo, MultipartHttpServletRequest multi) throws Exception { //���ε��� ������ ������
	MultipartFile file=multi.getFile("file");
	
	//���Ͼ��ε�
	if(!file.isEmpty()) { // ���ε� ������ ������� ������ 
		String image=System.currentTimeMillis() + file.getOriginalFilename(); // ���ϸ��� �ߺ������ʰ� �ϱ����ؼ� currentTimeMillis
		file.transferTo(new File(path + File.separator + image));
		vo.setImage(image);
	}
	//÷�����Ͼ��ε�
		List<MultipartFile> files = multi.getFiles("files");
		ArrayList<String> images=new ArrayList<String>();
		for(MultipartFile addFile:files) {
			if(!addFile.isEmpty()) {
				String image=System.currentTimeMillis()+addFile.getOriginalFilename();
				addFile.transferTo(new File(path + File.separator + image));
				images.add(image);
			}
		}
			
			vo.setImages(images);
			System.out.println(vo.toString());
	service.insert(vo);
	return "redirect:list";
}
@RequestMapping(value="update" , method=RequestMethod.POST)
public String updatePost(BoardVO vo, MultipartHttpServletRequest multi)throws Exception {
	MultipartFile file = multi.getFile("file");
	
	// ���Ͼ��ε�
			if (!file.isEmpty()) { // ���ε� ������ ������� ������
				
				// �����̹����� ������ ����
				String oldImage=vo.getImage();
				if(!oldImage.equals("")) {
					new File(path + File.separator + oldImage).delete();
				}
				
				String image = System.currentTimeMillis() + file.getOriginalFilename(); // ���ϸ��� �ߺ������ʰ� �ϱ����ؼ� currentTimeMillis
				file.transferTo(new File(path + File.separator + image));
				vo.setImage(image);
			}
			//÷������ ���ε�
			List<MultipartFile> files =multi.getFiles("files");
			ArrayList<String> images=new ArrayList<String>();
			for(MultipartFile attFile:files) {
				if(!attFile.isEmpty()) {
					if(images.size()==0) {
						List<String> oldImages=mapper.getB_imagelist(vo.getB_no());
						for(String oldImage:oldImages) {
							new File(path + File.separator + oldImage).delete();
						}
					}
					String image=System.currentTimeMillis() + attFile.getOriginalFilename();
					attFile.transferTo(new File(path + File.separator + image));
					images.add(image);
				}
			}
		vo.setImages(images);
	service.update(vo);
	System.out.println(vo.toString());
	return "redirect:list";
}
@RequestMapping(value="delete" , method=RequestMethod.POST)
public String deletePost(BoardVO vo)throws Exception{
	System.out.println(vo.toString());
	String oldImage=vo.getImage();
	if(!oldImage.equals("")){
		new File(path + File.separator + oldImage).delete();
	}
	List<String> images=mapper.getB_imagelist(vo.getB_no());
	for(String image: images) {
		if(!image.equals("")) {
			new File(path + File.separator + image).delete();
		}
	}
	
	service.delete(vo.getB_no());
	return "redirect:list";
}

//�̹������� �������� ���
	@RequestMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> display(String fileName) throws Exception {
		ResponseEntity<byte[]> result = null;
		// display fileName�� �ִ� ���
		if (!fileName.equals("")) {
			File file = new File(path + File.separator + fileName);
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		}
		return result;
	}
	
}