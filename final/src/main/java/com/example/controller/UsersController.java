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
				} else if (readVO.getPosition() == 3) {
					result = 3; // ������
				} else {
					result = 4;// ȸ��Ż��
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
	public void mypage(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		model.addAttribute("vo", mapper.read(id));
	}

	@RequestMapping(value = "/login/mypagePassChk", method = RequestMethod.POST)
	@ResponseBody
	public int mypagePassChk(UsersVO vo) {
		System.out.println("����");
		int chk = -1;
		UsersVO readVO = mapper.read(vo.getId());
		if (passEncoder.matches(vo.getPass(), readVO.getPass())) {
			chk = 1;
		} else {
			chk = 0;
		}

		return chk;
	}

	@RequestMapping("/login/usersUpdate")
	public void usersUpdate() {

	}

	@RequestMapping("/user/read")
	public void userRead(Model model, String id) {
		model.addAttribute("vo", mapper.read(id));
	}

	@RequestMapping("/user/followChk")
	@ResponseBody
	public int followChk(@RequestParam(value = "follower") String follower,
			@RequestParam(value = "target") String target) {
		int chk = mapper.followChk(follower, target);

		System.out.println(chk);
		return chk;
	}

	@RequestMapping("/user/followUpdate")
	@ResponseBody
	public int followUpdate(@RequestParam(value = "follower") String follower,
			@RequestParam(value = "target") String target) {
		int chk = mapper.followChk(follower, target);
		int followerCnt;
		int followingCnt;
		if (chk == 0) {
			mapper.followInsert(follower, target);
			followerCnt = mapper.followerCnt(target);
			followingCnt = mapper.followingCnt(follower);
			mapper.followerUpdate(followerCnt, target);
			mapper.followUpdate(followingCnt, follower);
		} else {
			mapper.followDelete(follower, target);
			followerCnt = mapper.followerCnt(target);
			followingCnt = mapper.followingCnt(follower);
			mapper.followerUpdate(followerCnt, target);
			mapper.followUpdate(followingCnt, follower);
		}
		return followerCnt;
	}

	// ���̵� ã�� ����
	@RequestMapping("/login/idFind")
	public void idFind() {
	}

	// ���̵� ã��
	@RequestMapping(value = "/login/idFind", method = RequestMethod.POST)
	public String find_id() throws Exception {
		return "/login/login";
	}

	// �̸��Ϸ� ���̵� ã��
	@RequestMapping("/find_id/read")
	@ResponseBody
	public Integer Eread(String email) {
		int cnt = mapper.find_id_cnt(email);
		System.out.println(cnt);
		return cnt;
	}

	@RequestMapping("/find_id/readid")
	@ResponseBody
	public UsersVO EreadId(String email) {
		return mapper.find_id(email);
	}
	///////////////////////////////////////////////////////////////////////////////////////////////

	// ��� ã�� ����
	@RequestMapping("/login/passFind")
	public void passFind() {
	}

	// ���̵� ġ�� �̸��� ã��
	@RequestMapping(value = "/login/passFind", method = RequestMethod.POST)
	public String find_email() throws Exception {

		return "/login/login";
	}

	// ���̵�� �̸��� ã��
	@RequestMapping("/find_email/read")
	@ResponseBody
	public Integer IIread(String id) {
		int cnt = mapper.find_email_cnt(id);
		System.out.println(cnt);
		return cnt;
	}

	@RequestMapping("/find_email/readEmail")
	@ResponseBody
	public UsersVO IreadEmail(String id) {
		return mapper.find_email(id);
	}

	// ��й�ȣ ã�� �̸��� ����
	@RequestMapping("/memberPass/email_injeung")
	public void emailPass_injeung() {
	}

	// ��й�ȣ update
	@RequestMapping(value = "/login/passFind/update", method = RequestMethod.POST)
	@ResponseBody
	public void update(UsersVO vo) {
		vo.setPass(passEncoder.encode(vo.getPass()));
		mapper.update(vo);

	}
}