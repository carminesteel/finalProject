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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
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
@RequestMapping("report")
public void report() {
}
@RequestMapping(value="reportCnt", method=RequestMethod.POST)
@ResponseBody
public int reportCnt(@RequestParam(value="id") String id,@RequestParam(value="b_no") int b_no) { 
	int cnt=-1;
	cnt=mapper.reportCnt(id, b_no);
	
	return cnt;
}
@RequestMapping(value="reportInsert", method=RequestMethod.POST)
@ResponseBody
public void reportInsert(BoardVO vo) { 
	mapper.reportInsert(vo);
	vo.setReport(mapper.BoardReportCnt(vo.getB_no()));
	mapper.updateReport(vo);
}

@RequestMapping(value="/like/update", method = RequestMethod.POST)
@ResponseBody
public int LikeUpdate(@RequestParam(value ="id") String id,@RequestParam(value ="b_no") int b_no) {
	int like=0;
	int chk=mapper.likeTableChk(id, b_no);
	
	if(chk==0) {
		mapper.likeinsert(id, b_no);
		like=mapper.likeTableCnt(b_no);
		mapper.B_likeUpdate(b_no, like);
		System.out.println(like);
	}else {
		mapper.likedelete(id, b_no);
		like=mapper.likeTableCnt(b_no);
		mapper.B_likeUpdate(b_no, like);
		System.out.println(like);
	}
	
	return like;
}

@RequestMapping("read")
public void read(Model model, int b_no,Criteria cri) {
	cri.setPerPageNum(10);
	PageMaker pm=new PageMaker();
	pm.setCri(cri);
	pm.setTotalCount(rmapper.replyCount(b_no));
	model.addAttribute("cri",cri);
	model.addAttribute("pm",pm);
	model.addAttribute("vo",mapper.read(b_no));
	model.addAttribute("list", mapper.getB_imagelist(b_no));
	model.addAttribute("vo",service.read(b_no));
	model.addAttribute("replyCount",rmapper.replyCount(b_no));
	
}
@RequestMapping(value="insert", method=RequestMethod.POST)
public String insertPost(BoardVO vo, MultipartHttpServletRequest multi) throws Exception { //업로드할 파일을 받을때
	MultipartFile file=multi.getFile("file");
	
	//파일업로드
	if(!file.isEmpty()) { // 업로드 파일이 비어있지 않으면 
		String image=System.currentTimeMillis() + file.getOriginalFilename(); // 파일명이 중복되지않게 하기위해서 currentTimeMillis
		file.transferTo(new File(path + File.separator + image));
		vo.setImage(image);
	}
	//첨부파일업로드
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
	
	// 파일업로드
			if (!file.isEmpty()) { // 업로드 파일이 비어있지 않으면
				
				// 예전이미지가 있으면 삭제
				String oldImage=vo.getImage();
				if(!oldImage.equals("")) {
					new File(path + File.separator + oldImage).delete();
				}
				
				String image = System.currentTimeMillis() + file.getOriginalFilename(); // 파일명이 중복되지않게 하기위해서 currentTimeMillis
				file.transferTo(new File(path + File.separator + image));
				vo.setImage(image);
			}
			//첨부파일 업로드
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

//이미지파일 브라우저에 출력
	@RequestMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> display(String fileName) throws Exception {
		ResponseEntity<byte[]> result = null;
		// display fileName이 있는 경우
		if (!fileName.equals("")) {
			File file = new File(path + File.separator + fileName);
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		}
		return result;
	}
	
}
