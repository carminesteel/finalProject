package com.example.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.domain.UsersVO;
import com.example.mapper.MyPageMapper;
import com.example.mapper.UsersMapper;
import com.mysql.fabric.xmlrpc.base.Array;

@Controller
public class UsersController {
	@Autowired
	UsersMapper mapper;

	@Autowired
	MyPageMapper Mmapper;
	
	
	@Autowired 
	BCryptPasswordEncoder passEncoder;
	
	/* �̹������� �������� ��� */
	@Resource(name = "uploadPath") /* ���� ���ε带 ���� �ʿ� */
	private String path;

	@RequestMapping("/login/login")
	public void login() {

	}

	@RequestMapping(value = "/login/login", method = RequestMethod.POST)
	@ResponseBody
	public int loginPost(UsersVO vo, HttpSession session) {
		int result = 0; // ȸ�� �������� ���� ���, ���̵� �������� �ʴ� ���

		UsersVO readVO = mapper.read(vo.getId());
		if (readVO != null) {
			if (passEncoder.matches(vo.getPass(), readVO.getPass())) { // �α��� ����
				if (readVO.getPosition() == 1) {
					result = 1; // �Ϲ� user
					session.setAttribute("id", readVO.getId());
					session.setAttribute("name", readVO.getNickname());
					session.setAttribute("position", readVO.getPosition());
				} else if (readVO.getPosition() == 2) {
					result = 2; // admin
					session.setAttribute("id", readVO.getId());
					session.setAttribute("name", readVO.getName());
					session.setAttribute("position", readVO.getPosition());
				} else if (readVO.getPosition() == 3){
					result = 3; // ������
				} else {
					result = 4;//ȸ��Ż��
				}
			} else {
				result = 5; // ��й�ȣ Ʋ���� ���
			}
		}
		return result;
	}

	// ���̹� �α��� ���� (���� �ϼ�x)
	@RequestMapping("/login/naverlogin")
	public String loginNaver() {
		return "/login/naverlogin";

	}

	@RequestMapping("/loginNaverResult")
	public String loginNaverResult(String email, HttpSession session) {
		session.setAttribute("id", email);
		session.setAttribute("position", 1);
		System.out.println(email);
		return "redirect:http://localhost:8088/";
	}

	// ȸ������ ������ �� �ߴ� (���� â)
	@RequestMapping("/login/agree")
	public void agree() {
	}

	// ���̵� �ߺ��˻�
	@RequestMapping("/insert/read")
	@ResponseBody
	public Integer Iread(String id) {
		System.out.println(id);
		int cnt = -1;
		UsersVO vo = mapper.read(id);
		if (vo == null) {
			cnt = 0;
		} else {
			cnt = 1;
		}
		return cnt;
	}

	// ȸ������ �������� �̵�
	@RequestMapping("/login/insert")
	public void insert() {
	}

	@RequestMapping(value = "/login/insert", method = RequestMethod.POST)
	public String insertPost(UsersVO vo, HttpSession session, MultipartHttpServletRequest multi) throws Exception {
		MultipartFile file = multi.getFile("file");
		session.setAttribute("id", vo.getId());
		session.setAttribute("name", vo.getName());
		// ���Ͼ��ε�
		if (!file.isEmpty()) { // ���ε� ������ ������� ������
			String image = System.currentTimeMillis() + file.getOriginalFilename(); // ���ϸ���
																					// �ߺ������ʰ�
																					// �ϱ����ؼ�
																					// currentTimeMillis
			file.transferTo(new File(path + File.separator + image));
			vo.setU_image(image);
		}
		vo.setPass(passEncoder.encode(vo.getPass()));
		mapper.insert(vo);
		return "redirect:/login/hello";
	}

	@RequestMapping("/login/hello")
	public void hello() {
	}

	@RequestMapping("/member/email_injeung")
	public void email_injeung() {
	}

	@RequestMapping(value = "/login/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login/login";
	}
		
	@RequestMapping("/login/mypage")
	public void mypage(Model model,HttpSession session) {
		String id=(String) session.getAttribute("id");
		model.addAttribute("vo", mapper.read(id));
		model.addAttribute("blist",Mmapper.myBlist(id));
		model.addAttribute("plist",Mmapper.myPlist(id));
		
		List<String> followingList = Mmapper.myFollowing(id);
		ArrayList<UsersVO> followingInfo = new ArrayList<UsersVO>();
		if(followingList.size()>0) {
			for(String following:followingList) {
				followingInfo.add(Mmapper.UserRead(following));
			}
		}
		model.addAttribute("followingInfo",followingInfo);

		List<String> followerList = Mmapper.myFollower(id);
		ArrayList<UsersVO> followerInfo = new ArrayList<UsersVO>();
		if(followerList.size()>0) {
			for(String follower:followerList) {
				followerInfo.add(Mmapper.UserRead(follower));
			}
		}
		model.addAttribute("followerInfo",followerInfo);
	}
	
	@RequestMapping(value="/login/mypagePassChk", method=RequestMethod.POST)
	@ResponseBody
	public int mypagePassChk(UsersVO vo){
		System.out.println("����");
		int chk=-1;
			UsersVO readVO = mapper.read(vo.getId());
			if(passEncoder.matches(vo.getPass(), readVO.getPass())){
				chk=1;
			}else{
				chk=0;
			}
		
		return chk;
	}
	@RequestMapping("/login/usersUpdate")
	public void usersUpdate(){
		
	}
	
	@RequestMapping("/user/read")
	public void userRead(Model model,String id) {
		model.addAttribute("vo", mapper.read(id));
		
		model.addAttribute("blist",Mmapper.myBlist(id));
		model.addAttribute("plist",Mmapper.myPlist(id));
		
		List<String> followingList = Mmapper.myFollowing(id);
		System.out.println(followingList.toString());
		ArrayList<UsersVO> followingInfo = new ArrayList<UsersVO>();
		if(followingList.size()>0) {
			for(String following:followingList) {
				followingInfo.add(Mmapper.UserRead(following));
			}
		}
		model.addAttribute("followingInfo",followingInfo);

		List<String> followerList = Mmapper.myFollower(id);
		System.out.println(followerList.toString());
		ArrayList<UsersVO> followerInfo = new ArrayList<UsersVO>();
		if(followerList.size()>0) {
			for(String follower:followerList) {
				followerInfo.add(Mmapper.UserRead(follower));
			}
		}
		model.addAttribute("followerInfo",followerInfo);
	}
	
	
	
	@RequestMapping("/user/followChk")
	@ResponseBody
	public int followChk(@RequestParam(value="follower") String follower,@RequestParam(value="target")String target) {
		int chk=mapper.followChk(follower, target);
		
		System.out.println(chk);
		return chk;
	}
	
	@RequestMapping("/user/followUpdate")
	@ResponseBody
	public int followUpdate(@RequestParam(value="follower") String follower,@RequestParam(value="target")String target) {
		int chk=mapper.followChk(follower, target);
		int followerCnt;
		int followingCnt;
		if(chk==0) {
			mapper.followInsert(follower, target);
			followerCnt=mapper.followerCnt(target);
			followingCnt=mapper.followingCnt(follower);
			mapper.followerUpdate(followerCnt, target);
			mapper.followUpdate(followingCnt, follower);
		}else {
			mapper.followDelete(follower, target);
			followerCnt=mapper.followerCnt(target);
			followingCnt=mapper.followingCnt(follower);
			mapper.followerUpdate(followerCnt, target);
			mapper.followUpdate(followingCnt, follower);
		}
		return followerCnt;
	}
}