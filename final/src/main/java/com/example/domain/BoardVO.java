package com.example.domain;

import java.util.ArrayList;
import java.sql.Date;

public class BoardVO {
 private int b_no;
 private String id;
 private String title;
 private String content;
 private String image;
 private int view;
 private int b_like;
 private int report;
 private int r_cnt;
 private Date date;
 private String nickname;
 private String u_image;
 private String introduce;
 private int r;
 
 
 
 public int getR() {
	return r;
}
public void setR(int r) {
	this.r = r;
}
public int getR_cnt() {
   return r_cnt;
}
public void setR_cnt(int r_cnt) {
   this.r_cnt = r_cnt;
}
public String getIntroduce() {
   return introduce;
}
public void setIntroduce(String introduce) {
   this.introduce = introduce;
}
private ArrayList<String> images;

public ArrayList<String> getImages() {
   return images;
}
public String getNickname() {
   return nickname;
}
public void setNickname(String nickname) {
   this.nickname = nickname;
}
public String getU_image() {
   return u_image;
}
public void setU_image(String u_image) {
   this.u_image = u_image;
}
public void setImages(ArrayList<String> images) {
   this.images = images;
}
public int getB_no() {
   return b_no;
}
public void setB_no(int b_no) {
   this.b_no = b_no;
}
public String getId() {
   return id;
}
public void setId(String id) {
   this.id = id;
}
public String getTitle() {
   return title;
}
public void setTitle(String title) {
   this.title = title;
}
public String getContent() {
   return content;
}
public void setContent(String content) {
   this.content = content;
}
public String getImage() {
   return image;
}
public void setImage(String image) {
   this.image = image;
}
public int getView() {
   return view;
}
public void setView(int view) {
   this.view = view;
}

public int getB_like() {
   return b_like;
}
public void setB_like(int b_like) {
   this.b_like = b_like;
}
public int getReport() {
   return report;
}
public void setReport(int report) {
   this.report = report;
}
public Date getDate() {
   return date;
}
public void setDate(Date date) {
   this.date = date;
}


 
}