package com.example.controller;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.domain.UsersVO;
import com.example.mapper.UsersMapper;

@Controller
public class UsersController {
	@Autowired
	UsersMapper mapper;

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
			if (readVO.getPass().equals(vo.getPass())) { // �α��� ����
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
				} else {
					result = 3; // ������
				}
			} else {
				result = 4; // ��й�ȣ Ʋ���� ���
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
}