package com.example.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.test.annotation.Repeat;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.domain.B_replyVO;
import com.example.domain.BoardVO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.UsersVO;
import com.example.mapper.BoardMapper;
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
   BoardMapper Bmapper;
   
   @Autowired 
   BCryptPasswordEncoder passEncoder;
   
   /* 占싱뱄옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占  */
   @Resource(name = "uploadPath") /* 占쏙옙占쏙옙 占쏙옙占싸드를 占쏙옙占쏙옙 占십울옙 */
   private String path;

   @RequestMapping("/login/login")
   public void login() {

   }

   @RequestMapping(value = "/login/login", method = RequestMethod.POST)
   @ResponseBody
   public int loginPost(UsersVO vo, HttpSession session) {
      int result = 0; // 회占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占 , 占쏙옙占싱듸옙 占쏙옙占쏙옙占쏙옙占쏙옙 占십댐옙 占쏙옙占 

      UsersVO readVO = mapper.read(vo.getId());
      if (readVO != null) {
         if (passEncoder.matches(vo.getPass(), readVO.getPass())) { // 占싸깍옙占쏙옙 占쏙옙占쏙옙
            if (readVO.getPosition() == 1) {
               result = 1; // 占싹뱄옙 user
               session.setAttribute("id", readVO.getId());
               session.setAttribute("name", readVO.getNickname());
               session.setAttribute("position", readVO.getPosition());
               session.setAttribute("u_image", readVO.getU_image());
            } else if (readVO.getPosition() == 2) {
               result = 2; // admin
               session.setAttribute("id", readVO.getId());
               session.setAttribute("name", readVO.getName());
               session.setAttribute("position", readVO.getPosition());
               session.setAttribute("u_image", readVO.getU_image());
            } else if (readVO.getPosition() == 3){
               result = 3; // 占쏙옙占쏙옙占쏙옙
            } else {
               result = 4;//회원탈퇴계정
            }
         } else {
            result = 5; // 占쏙옙橘占싫  틀占쏙옙占쏙옙 占쏙옙占 
         }
      }
      return result;
   }

   // 占쏙옙占싱뱄옙 占싸깍옙占쏙옙 占쏙옙占쏙옙 (占쏙옙占쏙옙 占싹쇽옙x)
   @RequestMapping("/login/naverlogin")
   public String loginNaver() {
      return "/login/naverlogin";

   }

   @RequestMapping("/loginNaverResult")
   public String loginNaverResult(String email, HttpSession session) {
      session.setAttribute("id", email);
      session.setAttribute("position", 1);
      return "redirect:http://localhost:8088/";
   }

   // 회占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙 占쌩댐옙 (占쏙옙占쏙옙 창)
   @RequestMapping("/login/agree")
   public void agree() {
   }

   // 占쏙옙占싱듸옙 占쌩븝옙占싯삼옙
   @RequestMapping("/insert/read")
   @ResponseBody
   public Integer Iread(String id) {
      int cnt = -1;
      UsersVO vo = mapper.read(id);
      if (vo == null) {
         cnt = 0;
      } else {
         cnt = 1;
      }
      return cnt;
   }

   // 회占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占싱듸옙
   @RequestMapping("/login/insert")
   public void insert() {
   }

   @RequestMapping(value = "/login/insert", method = RequestMethod.POST)
   public String insertPost(UsersVO vo, HttpSession session, MultipartHttpServletRequest multi) throws Exception {
      MultipartFile file = multi.getFile("file");
      session.setAttribute("id", vo.getId());
      session.setAttribute("name", vo.getName());

      // 占쏙옙占싹억옙占싸듸옙
      if (!file.isEmpty()) { // 占쏙옙占싸듸옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占  占쏙옙占쏙옙占쏙옙
         String image = System.currentTimeMillis() + file.getOriginalFilename(); // 占쏙옙占싹몌옙占쏙옙
                                                               // 占쌩븝옙占쏙옙占쏙옙占십곤옙
                                                               // 占싹깍옙占쏙옙占쌔쇽옙
                                                               // currentTimeMillis
         file.transferTo(new File(path + File.separator + image));
         vo.setU_image(image);
      }else{
         vo.setU_image("im2.jpg");
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
      model.addAttribute("buyList",Mmapper.myBuyList(id));
      
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
   public int mypagePassChk(UsersVO vo,HttpSession session){
      
      int chk;
         UsersVO readVO = mapper.read(vo.getId());
         if(passEncoder.matches(vo.getPass(), readVO.getPass())){
            chk=1;
            session.setAttribute("passChk", 1);
         }else{
            chk=0;
            session.setAttribute("passChk", 0);
         }
      
      return chk;
   }
   
   @RequestMapping(value="/login/usersUpdate")
   public Model usersUpdate(Model model,HttpSession session){
      String id=(String) session.getAttribute("id");
      model.addAttribute("vo", mapper.read(id));
      
      return model;
   }
   
   @RequestMapping("/user/read")
   public void userRead(Model model,String id) {
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
   
   
   
   @RequestMapping("/user/followChk")
   @ResponseBody
   public int followChk(@RequestParam(value="follower") String follower,@RequestParam(value="target")String target) {
      int chk=mapper.followChk(follower, target);
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
   
   @RequestMapping(value="/login/passFind")
   public void passFind(){

   }
   @RequestMapping(value="/login/idFind")
   public void idFind(){

   }
   @RequestMapping("/find_id/read")
   @ResponseBody
   public int getIdCnt(String email){
      return mapper.find_id_cnt(email);
   }
   @RequestMapping("/find_id/readid")
   @ResponseBody
   public UsersVO getId(String email){
      return mapper.find_id(email);
   }
   
   
   
   
   @RequestMapping("/find_email/read")
   @ResponseBody
   public int getCnt(String id){
      return mapper.find_email_cnt(id);
   }
   
   @RequestMapping("/find_email/readEmail")
   @ResponseBody
   public UsersVO getEmail(String id){
      return mapper.find_email(id);
   }
   @RequestMapping(value="/login/passFind/update")
   @ResponseBody
   public void passFind(UsersVO vo){
      vo.setPass(passEncoder.encode(vo.getPass()));
      mapper.update(vo);
   }
   
   @RequestMapping(value="/login/usersUpdate/profile_update", method = RequestMethod.POST)
   public String profile_update(UsersVO vo, MultipartHttpServletRequest multi) throws Exception{
      MultipartFile file = multi.getFile("file");
      if (!file.isEmpty()) { // 업로드 파일이 비어있지 않으면
         
         // 예전이미지가 있으면 삭제
         String oldImage=vo.getU_image();
         if(oldImage!=null) {
            new File(path + File.separator + oldImage).delete();
         }
         
         String image = System.currentTimeMillis() + file.getOriginalFilename(); // 파일명이 중복되지않게 하기위해서 currentTimeMillis
         file.transferTo(new File(path + File.separator + image));
         vo.setU_image(image);
      }
      
      mapper.profile_update(vo);
      
      return "redirect:/login/usersUpdate";
   }
   
   @RequestMapping(value="/login/usersUpdate/profile_passUpdate")
   @ResponseBody
   public void usersUpdate(UsersVO vo,HttpSession session){
      vo.setPass(passEncoder.encode(vo.getPass()));
      mapper.update(vo);
      session.invalidate();
   }
   
   //회원탈퇴
   @RequestMapping(value="/login/usersUpdate/updatePosition")
   @ResponseBody
   public void updatePosition(HttpSession session){
      String id=(String) session.getAttribute("id");
      mapper.updatePosition(id);
      session.invalidate();
   }
   
   //Admin 회원 관리
   
   @RequestMapping("/admin/usersAdmin")
   public void UsersAdmin(Model model,Criteria cri,int page) {
	   cri.setPage(page);
	   cri.setPerPageNum(10);
	   
	   PageMaker pm=new PageMaker();
	   
	   pm.setCri(cri);
	   pm.setTotalCount(mapper.usercnt());
	   
	   model.addAttribute("cri",cri);
	   model.addAttribute("pm",pm);
	   model.addAttribute("user",mapper.userList(cri));
	   model.addAttribute("report",Bmapper.reportList());
	   
	   ArrayList<BoardVO> array=new ArrayList<BoardVO>();
	   ArrayList<BoardVO> reportList=new ArrayList<BoardVO>();
	   array.addAll(Bmapper.reportList());
	   for(BoardVO b_no:array) {
		   reportList.addAll(Bmapper.reportContent(b_no.getB_no()));
	   }
	   model.addAttribute("reportContent",reportList);
	   model.addAttribute("cnt",Bmapper.reportCount());
   }
   
   @RequestMapping("/admin/reportList")
   @ResponseBody
   public ArrayList<BoardVO> reportList(int b_no){
	   ArrayList<BoardVO> array=new ArrayList<BoardVO>();
	   array.addAll(Bmapper.reportContent(b_no));
	   return array;
   }
   
   
   @RequestMapping("/admin/positionChange")
   @ResponseBody
   public void positionChange(UsersVO vo){
      mapper.positionChange(vo);
   }
   
   @RequestMapping("/admin/boardReportZero")
   @ResponseBody
   public void boardReportZero(int b_no){
	   Bmapper.boardReportZero(b_no);
	   Bmapper.reportDelete(b_no);
   }


   
}