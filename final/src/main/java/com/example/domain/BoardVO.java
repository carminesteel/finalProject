package com.example.domain;

import java.util.ArrayList;
import java.util.Date;

public class BoardVO {
 private int b_no;
 private String id;
 private String title;
 private String content;
 private String image;
 private int view;
 private int b_like;
 private int report;
 private Date date;
 private ArrayList<String> images;
 private int cnt;

public ArrayList<String> getImages() {
   return images;
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
public int getCnt() {
	return cnt;
}
public void setCnt(int cnt) {
	this.cnt = cnt;
}


 
}