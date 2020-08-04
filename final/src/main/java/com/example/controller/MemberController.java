package com.example.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.domain.UsersVO;
import com.example.hansub_project.service.member.MemberService;

@Controller // 컨트롤러 빈 선언
public class MemberController {

	@Inject // 서비스를 호출하기 위해서 의존성을 주입
	JavaMailSender mailSender; // 메일 서비스를 사용하기 위해 의존성을 주입함.
	MemberService memberservice; // 서비스를 호출하기 위해 의존성을 주입

	// 로깅을 위한 변수
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private static final String String = null;

	// 이메일 인증 페이지 맵핑 메소드
		@RequestMapping("/member/email")
		public void email(UsersVO vo , Model model) {
			model.addAttribute("id",vo.getId());
			model.addAttribute("pass",vo.getPass());
			model.addAttribute("name",vo.getName());
			model.addAttribute("nickname",vo.getNickname());
			model.addAttribute("phone",vo.getPhone());
			model.addAttribute("u_image",vo.getU_image());
			model.addAttribute("introduce",vo.getIntroduce());
			model.addAttribute("email",vo.getEmail());
			
			System.out.println("!");

		}

	
	// mailSending 코드
	@RequestMapping(value = "/member/auth.do", method = RequestMethod.POST)
	@ResponseBody
	public int mailSending(HttpServletRequest request,String email,Model model,String e_mail, HttpServletResponse response_email)
			throws IOException {

		Random r = new Random();
		int dice = r.nextInt(4589362) + 49311; // 이메일로 받는 인증코드 부분 (난수)
		System.out.println("ㅆㅆㅆㅆㅆㅆㅆㅆㅆㅆㅆㅆㅃㅃㅃㅃㅃㅃㅃㅃㅃ"+dice);
		String setfrom = "jungjaejae4885@gamil.com";
		String tomail = request.getParameter("e_mail"); // 받는 사람 이메일
		String title = "회원가입 인증 이메일 입니다."; // 제목
		String content =
				System.getProperty("line.separator") + // 한줄씩 줄간격을 두기위해 작성

						System.getProperty("line.separator") +

						"안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"

						+ System.getProperty("line.separator") +

						System.getProperty("line.separator") +

						" 인증번호는 " + dice + " 입니다. "

						+ System.getProperty("line.separator") +

						System.getProperty("line.separator") +

						"받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		ModelAndView mv = new ModelAndView(); // ModelAndView로 보낼 페이지를 지정하고, 보낼
												// 값을 지정한다.
		mv.setViewName("/login/insert"); // 뷰의이름
		mv.addObject("dice", dice);
		
		/*
		 * //Data 값 insert 페이지에서 받아오기 model.addAttribute("id",vo.getId());
		 * model.addAttribute("pass",vo.getPass());
		 * model.addAttribute("name",vo.getName());
		 * model.addAttribute("nickname",vo.getNickname());
		 * model.addAttribute("phone",vo.getPhone());
		 * model.addAttribute("u_image",vo.getU_image());
		 * model.addAttribute("introduce",vo.getIntroduce());
		 * model.addAttribute("email",vo.getEmail());
		 */


		return dice;

	}

	
	// 이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
	// 내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 회원가입 페이지로 넘어가고,
	// 틀리면 다시 원래 페이지로 돌아오는 메소드
	@RequestMapping(value = "/member/join_injeung.do", method = RequestMethod.POST)
	@ResponseBody
	public Integer join_injeung(String email_injeung,Model model,String dice,UsersVO vo,HttpServletResponse response_equals) throws IOException {
		int chk=-1;
		System.out.println("마지막 : email_injeung : " + email_injeung);

		System.out.println("마지막 : dice : " + dice);

		if (email_injeung.equals(dice)) {
			chk=1;
			 

		} else if (email_injeung != dice) {

			chk=0;
			 
		}
		return chk;

	}
	
}