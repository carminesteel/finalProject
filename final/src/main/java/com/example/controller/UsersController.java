package com.example.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.UsersVO;
import com.example.mapper.UsersMapper;

@Controller
public class UsersController {
	@Autowired
	UsersMapper mapper;

	/* 이미지파일 브라우저에 출력 */
	@Resource(name = "uploadPath") /* 파일 업로드를 위해 필요 */
	private String path;

	@RequestMapping("/login/login")
	public void login() {

	}

	@RequestMapping(value = "/login/login", method = RequestMethod.POST)
	@ResponseBody
	public int loginPost(UsersVO vo, HttpSession session) {
		int result = 0; // 회원 존재하지 않은 경우, 아이디 존재하지 않는 경우

		UsersVO readVO = mapper.read(vo.getId());
		if (readVO != null) {
			if (readVO.getPass().equals(vo.getPass())) { // 로그인 성공
				if (readVO.getPosition() == 1) {
					result = 1; // 일반 user
					session.setAttribute("id", readVO.getId());
					session.setAttribute("name", readVO.getNickname());
					session.setAttribute("position", readVO.getPosition());
				} else if (readVO.getPosition() == 2) {
					result = 2; // admin
					session.setAttribute("id", readVO.getId());
					session.setAttribute("name", readVO.getName());
					session.setAttribute("position", readVO.getPosition());
				} else {
					result = 3; // 블랙유저
				}
			} else {
				result = 4; // 비밀번호 틀렸을 경우
			}
		}
		return result;
	}

	@RequestMapping(value = "loginPostNaver", method = RequestMethod.GET)
	public String loginPOSTNaver(HttpSession session) {

		return "login/loginPostNaver";
	}

	@RequestMapping("/login/insert")
	public void insert() {

	}
}